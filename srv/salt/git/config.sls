{% set user = pillar.get('user') %}

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
