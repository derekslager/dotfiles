{% from "user_dirs.jinja" import user_dirs with context %}

{% set user = pillar.get('user') %}
{% set awext = salt['file.join'](user_dirs.home, 'Applications') %}
{% set awversion = 'v0.8.3' %}
{% set awhome = salt['file.join'](awext, 'activitywatch', awversion) %}

# install activitywatch
download-activitywatch:
  archive.extracted:
    - source: "https://github.com/ActivityWatch/activitywatch/releases/download/{{ awversion }}/activitywatch-{{ awversion }}-macos-x86_64.zip"
    - source_hash: "sha1=2c75e11a9e204304bdac45498bc440809a1dd341"
    - name: {{ awhome }}
    - user: {{ user.username }}

run-on-startup:
  file.managed:
    - name: {{ user_dirs.home }}/Library/LaunchAgents/net.activitywatch.aw-qt.plist
    - source: salt://osx/net.activitywatch.aw-qt.plist
    - mode: 644
    - template: jinja
    - defaults:
        awhome: {{ awhome }}/activitywatch

# start once interactively to make sure it's working (./aw-qt from awhome)

# now you can launch:
# $ launchctl start net.activitywatch.aw-qt
