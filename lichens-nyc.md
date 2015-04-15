---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% assign lichens = site.data.lichens         %}
{% assign boros   = site.data.locations.boros %}
{% assign sites   = site.data.locations.sites %}

{% for genus in site.data.lichens-nyc %}
{% assign genus_name = genus[0] %}
<h2>
  <strong><cite>{{ genus_name }}</cite></strong>
  <span style="font-size: 0.7em">{{ lichens[genus_name].auth | replace: ' ex ', ' <em>ex</em> ' }}</span>
</h2>
<p>
  <strong>Form</strong>: {{ lichens[genus_name].form }}
</p>
{% for species in genus[1] %}
{% assign species_name = species[0] %}
<h4>
{% if species_name == 'sp.' %}
  <strong><cite>{{ genus_name }}</cite> {{ species_name }}</strong>
{% else %}
  <strong><cite>{{ genus_name | append: ' ' | append: species_name | replace: ' cf. ', '</cite> cf. <cite>' | replace: ' var. ', '</cite> var. <cite>' | replace: ' f. ', '</cite> f. <cite>' }}</cite></strong>
  <span style="font-size: 0.7em">{{ lichens[genus_name].species[species_name].auth | replace: ' ex ', ' <em>ex</em> ' }}</span>
{% endif %}
</h4>
<p>
{% for boro in boros %}
  {% assign use_boro = false %}
  {% assign site_names = '' %}
  {% for site in species[1] %}
    {% assign site_code = site[0] %}
    {% if sites[site_code].boro == boro[0] %}
      {% assign use_boro = true %}
      {% if site_names != '' %}
        {% assign site_names = site_names | append: '␞' %}
      {% endif %}
      {% assign site_names = site_names | append: sites[site_code].name %}
    {% endif %}
  {% endfor %}
  {% if use_boro %}
    <strong>{{ boro[1] }}</strong>:
    {{ site_names | split: '␞' | sort | join: ', ' }}<br />
  {% endif %}
{% endfor %}
</p>
{% endfor %}
{% endfor %}
