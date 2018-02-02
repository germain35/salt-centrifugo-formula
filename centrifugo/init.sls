{%- from "centrifugo/map.jinja" import centrifugo with context %}

include:
  {%- if centrifugo.manage_repo %}
  - centrifugo.repo
  {%- endif %}
  - centrifugo.install
  - centrifugo.config
  - centrifugo.service
