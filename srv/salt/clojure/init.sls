{% from "user_dirs.jinja" import user_dirs with context %}

{% set dotlein = salt['file.join'](user_dirs.home, '.lein') %}
{% set dotclojure = salt['file.join'](user_dirs.home, '.clojure') %}

{% set user = pillar['user'] %}

# deps.edn
{{ salt['file.join'](dotclojure, 'deps.edn') }}:
  file.symlink:
    - target: {{ salt['file.join'](user_dirs.dotfiles, 'srv/salt/clojure/deps.edn') }}
    - user: {{ user.username }}
    - makedirs: True

# leiningen
{{ salt['file.join'](dotlein, 'profiles.clj') }}:
  file.symlink:
    - target: {{ salt['file.join'](user_dirs.dotfiles, 'srv/salt/clojure/profiles.clj') }}
    - user: {{ user.username }}
    - makedirs: True
