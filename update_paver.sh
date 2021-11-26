#!/bin/bash


cd /edx/app/edxapp/themes/openedu_theme/
sudo git pull origin prod

sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env
cd /edx/app/edxapp/edx-platform
paver update_assets cms --settings=production
paver update_assets lms --settings=production

python manage.py cms --settings=production collectstatic --noinput
python manage.py lms --settings=production collectstatic --noinput

#paver update_assets cms --settings=aws
#python manage.py cms --settings=aws collectstatic --noinput
EOF


sudo /edx/bin/supervisorctl restart lms
sudo /edx/bin/supervisorctl restart cms
sudo /edx/bin/supervisorctl restart edxapp_worker:

