{%- from "centrifugo/map.jinja" import centrifugo with context %}

{%- set osfamily   = salt['grains.get']('os_family') %}
{%- set os         = salt['grains.get']('os') %}
{%- set osrelease  = salt['grains.get']('osrelease') %}
{%- set oscodename = salt['grains.get']('oscodename') %}

include:
  - centrifugo.install

{%- if centrifugo.manage_repo %}
  {%- if osfamily == 'Debian' %}
centrifugo_repo_pkg:
  pkg.installed:
    - pkgs: 
      - apt-transport-https 
      - gnupg
    - require_in:
      - pkgrepo: centrifugo_repo
  {%- endif %}
  
  {%- if 'repo' in centrifugo and centrifugo.repo is mapping %}
centrifugo_repo:
  pkgrepo.managed:
    {%- for k, v in centrifugo.repo.iteritems() %}
    - {{k}}: {{v}}
    - require_in:
      - pkg: centrifugo_package
    {%- endfor %}
  {%- endif %}
{%- endif %}
