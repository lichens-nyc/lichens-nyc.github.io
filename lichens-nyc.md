---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% assign lichens = site.data.lichens         %}
{% assign boros   = site.data.locations.boros %}
{% assign sites   = site.data.locations.sites %}

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
{% for boro in boros %}
  {% assign use_boro = false %}
  {% for site in species.sites %}
    {% assign site_code = site[0] %}
    {% if sites[site_code].boro == boro[0] %}
      {% assign use_boro = true %}
    {% endif %}
  {% endfor %}
  {% if use_boro %}
    <strong>{{ boro[1] }}</strong>:
    {% assign site_names = '' %}
    {% for site in species.sites %}
      {% assign site_code = site[0] %}
      {% if sites[site_code].boro == boro[0] %}
        {% if site_names != '' %}
          {% assign site_names = site_names | append: ', ' %}
        {% endif %}
        {% assign site_names = site_names | append: sites[site_code].name %}
      {% endif %}
    {% endfor %}
    {{ site_names }}<br />
  {% endif %}
{% endfor %}
</p>
{% endfor %}
{% endfor %}
