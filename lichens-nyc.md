---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% for genus in site.data.lichens-nyc %}
{% if genus.species %}
{% for species in genus.species %}
<h3><cite>{{ genus.name }} {{ species.name }}</cite></h3>
{% endfor %}
{% else %}
<h3><cite>{{ genus.name }}</cite> sp.</h3>
{% endif %}
{% endfor %}
