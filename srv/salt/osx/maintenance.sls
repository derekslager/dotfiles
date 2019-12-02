{% from "user_dirs.jinja" import user_dirs with context %}

{% set user = pillar.get('user') %}
{% set downloads = salt['file.join'](user_dirs.home, 'Downloads') %}

# Catalina+: drag /usr/sbin/cron into `Full Disk Access' under
# Security & Privacy > Privacy

# period cleanup of downloads folder
downloads-cleanup:
  cron.present:
    # delete files older than 30d
    - name: find {{ downloads }} -type f -mtime +30 -delete
    - user: {{ user.username }}
    - hour: 17
    - minute: 0
    - identifier: downloads-cleanup
