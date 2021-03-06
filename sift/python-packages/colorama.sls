include:
  - sift.packages.python3-pip
  - sift.packages.python2-pip

sift-python-packages-colorama:
  pip.installed:
    - name: colorama
    - bin_env: /usr/bin/python2
    - upgrade: True
    - require:
      - sls: sift.packages.python2-pip
