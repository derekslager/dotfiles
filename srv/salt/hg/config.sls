{% from "hg/map.jinja" import hg_config with context %}

{% set user = pillar['user'] %}

{{ hg_config.file }}:
  file.managed:
    - user: {{ user.username }}

hgrc_base:
  ini.options_present:
    - name: {{ hg_config.file }}
    - sections:
        ui:
          username: {{ user.fullname }} <{{ user.email }}>
        diff:
          git: '1'
        extdiff:
          cmd.kdiff3: ''
        defaults:
          qimport: --git
          qnew: --git
          qrefresh: --git
        extensions:
          hgext.bookmarks: ''
          hgext.extdiff: ''
          hgext.transplant: ''
          hgext.churn: ''
          hgext.convert: ''
          hgext.graphlog: ''
          hgext.mq: ''
          hgext.hgk: ''
          hgext.parentrevspec: ''
          hgext.fetch: ''
          hgext.record: ''
          hgext.purge: ''
          hgext.rebase: ''
          hgext.zeroconf: ''
          color: ''
        alias:
          tipr: tip --template "{node|short}"
          {% for i in range(2, 10) %}
          log{{ i }}: log -l {{ i }}
          {% endfor %}
