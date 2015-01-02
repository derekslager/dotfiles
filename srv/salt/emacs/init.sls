{% from "user_dirs.jinja" import user_dirs with context %}

{% set dotemacs = salt['file.join'](user_dirs.home, '.emacs') %}
{% set dotemacsd = dotemacs + '.d' %}

{% set user = pillar['user'] %}

# .emacs
{{ dotemacs }}:
  file.symlink:
    - target: {{ salt['file.join'](user_dirs.dotfiles, 'emacs') }}
    - user: {{ user.username }}

# .emacs.d
{{ dotemacsd }}:
  file.symlink:
    - target: {{ salt['file.join'](user_dirs.dotfiles, 'emacs.d') }}
    - user: {{ user.username }}
