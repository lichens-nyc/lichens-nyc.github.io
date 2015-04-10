---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% for genus in site.data.lichens-nyc %}
{% if genus.species %}
{% for species in genus.species %}
<h4><cite>{{ genus.name }} {{ species.name }}</cite></h4>
<ul>
  <li>Boroughs: {{ species.boroughs | join: ', ' }}</li>
</ul>
{% endfor %}
{% else %}
<h4><cite>{{ genus.name }}</cite> sp.</h4>
<ul>
  <li>Boroughs: {{ genus.boroughs | join: ', ' }}</li>
</ul>
{% endif %}
{% endfor %}
