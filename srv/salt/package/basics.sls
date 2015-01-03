{% from 'package/map.jinja' import package_names with context %}

package_basics:
  pkg.installed:
    - pkgs:
      - {{ package_names.ack }}
      - {{ package_names.ag }}
      - dos2unix
      - joe
      - lynx
      - tree
      - w3m
      - wget
