main:
  '*':
    {%- for remote in opts.pillar_roots[saltenv] %}
    {%-   if salt['file.file_exists']('{0}/machine/{1}.sls'.format(remote, grains.machine_id)) %}
    - 'machine.{{ grains['machine_id'] }}'
    {%-   endif %}
    {%- endfor %}
    - netdata
