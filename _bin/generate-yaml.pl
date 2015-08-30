#!/usr/bin/perl
use utf8;
use strict;
use warnings;
use open qw( :encoding(UTF-8) :std );
use List::MoreUtils qw( zip );
use YAML::XS qw( DumpFile );

$YAML::XS::QuoteNumericStrings = 0;

my %locations;
for my $boro ( in('boros') ) {
    $locations{boros}{ $boro->{id} } = $boro->{name};
}
for my $site ( in('sites') ) {
    $locations{sites}{ $site->{id} } = {
        boro => $site->{boro},
        name => $site->{name},
    };
}
out(locations => \%locations);

my %taxa;
for my $genus ( in('genera') ) {
    $taxa{ $genus->{genus} } = {
        map  { $_ => $genus->{$_} }
        grep { $genus->{$_}       }
        qw   { auth date form     }
    };
}
for my $species ( in('species') ) {
    $taxa{ $species->{genus} }{species}{ $species->{species} } = {
        map  { $_ => $species->{$_} }
        grep { $species->{$_}       }
        qw   { auth syn eol         }
    };
}
out(taxa => \%taxa);

my %obs;
for my $obs ( in('observations') ) {
    push @{$obs{ $obs->{genus} }{ $obs->{species} }{ $obs->{site} }}, {
        when => $obs->{when},
        who  => $obs->{who},
    };
}
out(observations => \%obs);

sub in {
    my ($name) = @_;
    my (@names, @rows);
    my $file = "_data/src/$name.tsv";

    open my $content, '<', $file
        or die "Can’t open $file: $!";

    while (my $line = <$content>) {
        chomp $line;
        my @row = split "\t", $line;

        if ($. == 1) {
            @names = @row;
            next;
        }

        push @rows, { zip @names, @row };
    }

    close $content
        or die "Can’t close $file: $!";

    return @rows;
}

sub out {
    my ($name, $data) = @_;
    my $file = "_data/$name.yaml";

    DumpFile($file, $data);
}