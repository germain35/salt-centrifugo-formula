{%- from "centrifugo/map.jinja" import centrifugo with context %}

include:
  - centrifugo.install
  - centrifugo.service

centrifugo_conf:
  file.serialize:
    - name: {{ centrifugo.conf_file }}
    - dataset: {{ centrifugo.config }}
    - user: {{ centrifugo.user }}
    - group: {{ centrifugo.group }}
    - mode: 644
    - makedirs: True
    - formatter: json
    - require:
      - pkg: centrifugo_package
    - watch_in:
      - service: centrifugo_service
