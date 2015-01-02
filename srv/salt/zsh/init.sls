{% from "user_dirs.jinja" import user_dirs with context %}

{% set user = pillar['user'] %}
{% set omz_dir = salt['file.join'](user_dirs.home, '.oh-my-zsh') %}
{% set zshrc = salt['file.join'](user_dirs.home, '.zshrc') %}

https://github.com/robbyrussell/oh-my-zsh.git:
  git.latest:
    - target: {{ omz_dir }}
    - user: {{ user.username }}

{{ zshrc }}:
  file.copy:
    - source: {{ salt['file.join'](omz_dir, 'templates', 'zshrc.zsh-template') }}
    - preserve: True

zsh_theme:
  file.replace:
    - name: {{ zshrc }}
    - pattern: ZSH_THEME="robbyrussell"
    - repl: ZSH_THEME="pure"
