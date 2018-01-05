{%- from "centrifugo/map.jinja" import centrifugo with context %}

include:
  - centrifugo.repo
  - centrifugo.install
  - centrifugo.config
  - centrifugo.service
