{%- if grains['oscodename'] == "bionic" %}
include:
  - sift.packages.software-properties-common
  
sift-repo-noobslab-themes:
  pkgrepo.managed:
    - name: noobslab-themes
    - ppa: noobslab/themes
    - refresh_db: true
    - require:
      - sls: sift.packages.software-properties-common

sift-repo-noobslab-icons:
  pkgrepo.managed:
    - name: noobslab-icons
    - ppa: noobslab/icons
    - refresh_db: true
    - require:
      - sls: sift.packages.software-properties-common
{%- else %}
sift-repo-noobslab:
  test.nop
{%- endif %}