{% from "user_dirs.jinja" import user_dirs with context %}

{% set dotlein = salt['file.join'](user_dirs.home, '.lein') %}

{% set user = pillar['user'] %}

# leiningen
{{ salt['file.join'](dotlein, 'profiles.clj') }}:
  file.managed:
    - source: salt://clojure/profiles.clj
    - user: {{ user.username }}
    - makedirs: True
