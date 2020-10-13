# source=https://github.com/hiddenillusion/AnalyzePE/
# license=unknown

{% set commit = "9c76ecbc3ac417bc07439c244f2d5ed19af06578" -%}
{% set hash = "sha256=0c4e2a8916df3de0bde67ef47543db6f6068b267fa2b665667a52bc6002e6529" -%}

include:
  - sift.packages.python2
  - sift.python-packages.pefile
  - sift.python-packages.pydasm
  - sift.python-packages.python-magic
  - sift.python-packages.yara-python

sift-scripts-pescanner:
  file.managed:
    - name: /usr/local/bin/pescanner.py
    - source: https://raw.githubusercontent.com/hiddenillusion/AnalyzePE/{{ commit }}/pescanner.py
    - source_hash: {{ hash }}
    - mode: 755
    - require:
      - sls: sift.packages.python2
      - sls: sift.python-packages.pefile
      - sls: sift.python-packages.pydasm
      - sls: sift.python-packages.python-magic
      - sls: sift.python-packages.yara-python

sift-scripts-pescanner-shebang:
  file.replace:
    - name: /usr/local/bin/pescanner.py
    - pattern: '#!/usr/bin/env python\n'
    - repl: '#!/usr/bin/env python2\n'
    - count: 1
    - watch:
      - file: sift-scripts-pescanner
