---
title:     Lichens of New York City
permalink: /lichens/nyc/
layout:    page
---

{% assign boros = site.data.locations.boros %}
{% assign parks = site.data.locations.parks %}

{% for genus in site.data.lichens-nyc %}
<h2><cite>{{ genus.name }}</cite></h2>
<p>
  <strong>Form</strong>: {{ genus.form }}
</p>
{% if genus.species %}
{% for species in genus.species %}
<h4><strong><cite>{{ genus.name }} {{ species.name }}</cite></strong> {{ species.auth }}</h4>
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
{% else %}
<p>
  {% for boro in genus.loc %}
    {% assign boro_key = boro[0] %}
    <strong>{{ boros[boro_key] }}</strong>:
    {% for park in boro[1] %}
      {{ parks[park].name }}{% unless forloop.last %}, {% endunless %}
    {% endfor %}
    {% unless forloop.last %}<br>{% endunless %}
  {% endfor %}
</p>
{% endif %}
{% endfor %}
