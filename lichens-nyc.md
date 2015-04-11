---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% assign boroughs = site.data.locations.boroughs %}

{% for genus in site.data.lichens-nyc %}
<h3><cite>{{ genus.name }}</cite></h3>
{% if genus.species %}
{% for species in genus.species %}
<h4><cite>{{ genus.name | slice: 0 }}. {{ species.name }}</cite></h4>
<ul>
  <li>
    Boroughs:
    {% for borough in species.boroughs %}
      {{ boroughs[borough] }}{% unless forloop.last %}, {% endunless %}
    {% endfor %}
  </li>
</ul>
{% endfor %}
{% else %}
<ul>
  <li>
    Boroughs:
    {% for borough in genus.boroughs %}
      {{ boroughs[borough] }}{% unless forloop.last %}, {% endunless %}
    {% endfor %}
  </li>
</ul>
{% endif %}
{% endfor %}
