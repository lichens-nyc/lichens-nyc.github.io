---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% assign lichens = site.data.lichens         %}
{% assign boros   = site.data.locations.boros %}
{% assign parks   = site.data.locations.parks %}

{% for genus in site.data.lichens-nyc %}
<h2>
  <strong><cite>{{ genus.name }}</cite></strong>
  <span style="font-size: 0.7em">{{ lichens[genus.name].auth | replace: ' ex ', ' <em>ex</em> ' }}</span>
</h2>
<p>
  <strong>Form</strong>: {{ lichens[genus.name].form }}
</p>
{% for species in genus.species %}
<h4>
{% if species.name == 'sp.' or species.name == 'spp.' %}
  <strong><cite>{{ genus.name }}</cite> {{ species.name }}</strong>
{% else %}
  <strong><cite>{{ genus.name }} {{ species.name }}</cite></strong>
  <span style="font-size: 0.7em">{{ lichens[genus.name].species[species.name].auth }}</span>
{% endif %}
</h4>
<p>
  {% for boro in species.loc %}
    {% assign boro_key = boro[0] %}
    <strong>{{ boros[boro_key] }}</strong>:
    {% for park in boro[1] %}
      {{ parks[park].name }}{% unless forloop.last %}, {% endunless %}
    {% endfor %}
    {% unless forloop.last %}<br>{% endunless %}
  {% endfor %}
</p>
{% endfor %}
{% endfor %}
