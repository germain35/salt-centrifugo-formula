{%- from "centrifugo/map.jinja" import centrifugo with context %}

include:
  - centrifugo.install
  - centrifugo.config

centrifugo_service:
  service.running:
    - name: {{ centrifugo.service }}
    - enable: {{ centrifugo.service_enabled }}
    - reload: {{ centrifugo.service_reload }}
    - require:
        - pkg: centrifugo_package
