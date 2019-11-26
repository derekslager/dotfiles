{% from "user_dirs.jinja" import user_dirs with context %}

{% set user = pillar.get('user') %}
{% set downloads = salt['file.join'](user_dirs.home, 'Downloads') %}

# period cleanup of downloads folder
downloads-cleanup:
  cron.present:
    # delete files older than 30d
    - name: find {{ downloads }} -type f -mtime +30 -delete
    - user: {{ user.username }}
    - hour: 0
    - minute: 0
    - identifier: downloads-cleanup
