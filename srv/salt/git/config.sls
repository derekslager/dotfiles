{% set user = pillar.get('user') %}
{% from "user_dirs.jinja" import user_dirs with context %}

{% set global_ignore = salt['file.join'](user_dirs.home, '.config') + '/git/ignore' %}

user.name:
  git.config_set:
    - value: {{ user.fullname }}
    - user: {{ user.username }}
    - global: True

user.email:
  git.config_set:
    - value: {{ user.email }}
    - user: {{ user.username }}
    - global: True

push.default:
  git.config_set:
    - value: simple
    - user: {{ user.username }}
    - global: True

credential.helper:
  git.config_set:
    - value: store
    - user: {{ user.username }}
    - global: True

{{ global_ignore }}:
  file.managed:
    - source: salt://git/.gitignore
    - user: {{ user.username }}
    - makedirs: True
