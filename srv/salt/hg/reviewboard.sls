{% from "hg/map.jinja" import hg_config with context %}

{% set environment = pillar['environment'] %}
{% set reviewboard = pillar['reviewboard'] %}

https://derekslager@bitbucket.org/mdelagra/mercurial-reviewboard:
  hg.latest:
    - target: {{ salt['file.join'](environment.repo_cache, 'mercurial-reviewboard') }}

hgrc_reviewboard:
  ini.options_present:
    - name: {{ hg_config.file }}
    - sections:
        reviewboard:
          server: {{ reviewboard.server }}
          user: {{ reviewboard.user }}
          password: {{ reviewboard.password }}
          launch_webbrowser: 'true'
