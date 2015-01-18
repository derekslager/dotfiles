{% set user = pillar.get('user') %}
{% set tmp_file = '/tmp/set_defaults.sh' %}

{{ tmp_file }}:
  file.managed:
    - source: salt://osx/defaults.sh
    - mode: 755

set_defaults:
  cmd.run:
    - name: {{ tmp_file }}
    - user: {{ user.username }}

remove_tmp_file:
  file.absent:
    - name: {{ tmp_file }}
