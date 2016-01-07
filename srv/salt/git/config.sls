{% set user = pillar.get('user') %}
{% from "user_dirs.jinja" import user_dirs with context %}

{% set global_ignore = salt['file.join'](user_dirs.home, '.config') + '/git/ignore' %}

user.name:
  git.config:
    - value: {{ user.fullname }}
    - user: {{ user.username }}
    - is_global: True

user.email:
  git.config:
    - value: {{ user.email }}
    - user: {{ user.username }}
    - is_global: True

push.default:
  git.config:
    - value: simple
    - user: {{ user.username }}
    - is_global: True

credential.helper:
  git.config:
    - value: cache
    - user: {{ user.username }}
    - is_global: True

{{ global_ignore }}:
  file.managed:
    - source: salt://git/.gitignore
    - user: {{ user.username }}
    - makedirs: True
