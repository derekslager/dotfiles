{% from "user_dirs.jinja" import user_dirs with context %}

{% set user = pillar.get('user') %}
{% set awext = salt['file.join'](user_dirs.home, 'Downloads') %}
{% set awhome = salt['file.join'](awext, 'activitywatch') %}

# install activitywatch
download-activitywatch:
  archive.extracted:
    - source: "https://github.com/ActivityWatch/activitywatch/releases/download/v0.8.0b7/activitywatch-v0.8.0b7-macos-x86_64.zip"
    - source_hash: "sha1=172ea603eb14dc2ed41cb0da9e25c49534d1987a"
    - name: {{ awext }}
    - user: {{ user.username }}

run-on-startup:
  file.managed:
    - name: {{ user_dirs.home }}/Library/LaunchAgents/net.activitywatch.aw-qt.plist
    - source: salt://osx/net.activitywatch.aw-qt.plist
    - mode: 644
    - template: jinja
    - defaults:
        awhome: {{ awhome }}

# now you can launch:
# $ launchctl start net.activitywatch.aw-qt
