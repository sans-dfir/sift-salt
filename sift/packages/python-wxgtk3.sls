include:
  - sift.packages.python3

sift-package-python-wxgtk3:
  pkg.installed:
    - name: python-wxgtk3.0
    - require:
      - sls: sift.packages.python3