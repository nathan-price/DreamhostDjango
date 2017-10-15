import os
import sys

# set these
project_name = '{{name}}'
python_dir = '{{dir}}'

# the rest of the file should not need to be changed
cwd = os.getcwd()
env_dir = os.path.join(cwd, 'env')
project_dir = os.path.join(cwd, project_name)

INTERP = os.path.join(env_dir, 'bin', 'python3')
if sys.executable != INTERP:
    os.execl(INTERP, INTERP, *sys.argv)

sys.path.insert(0, os.path.join(env_dir, 'bin'))
sys.path.insert(0, os.path.join(env_dir, 'lib', python_dir, 'site-packages'))
sys.path.append(project_dir)

os.environ['DJANGO_SETTINGS_MODULE'] = project_name + '.settings'

from django.core.wsgi import get_wsgi_application
application = get_wsgi_application()
