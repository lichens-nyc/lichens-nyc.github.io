---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% assign boroughs = site.data.locations.boroughs %}

{% for genus in site.data.lichens-nyc %}
<h2><cite>{{ genus.name }}</cite></h2>
<p>
  Form: {{ genus.form }}
</p>
{% if genus.species %}
{% for species in genus.species %}
<h4><cite>{{ genus.name }} {{ species.name }}</cite></h4>
<p>
  Boroughs:
  {% for borough in species.boroughs %}
    {{ boroughs[borough] }}{% unless forloop.last %}, {% endunless %}
  {% endfor %}
</p>
{% endfor %}
{% else %}
<p>
  Boroughs:
  {% for borough in genus.boroughs %}
    {{ boroughs[borough] }}{% unless forloop.last %}, {% endunless %}
  {% endfor %}
</p>
{% endif %}
{% endfor %}
