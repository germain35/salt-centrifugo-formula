{%- from "centrifugo/map.jinja" import centrifugo with context %}

{%- if centrifugo.manage_repo %}
include:
  - centrifugo.repo
{%- endif %}

centrifugo_package:
  pkg.installed:
    - name: {{ centrifugo.pkg }}