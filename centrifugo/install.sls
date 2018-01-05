{%- from "centrifugo/map.jinja" import centrifugo with context %}

include:
  centrifugo.repo

centrifugo_package:
  pkg.installed:
    - name: {{ centrifugo.pkg }}
    - require:
      - sls: centrifugo.repo