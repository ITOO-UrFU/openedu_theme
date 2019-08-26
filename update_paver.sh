#!/bin/bash


#cd /edx/app/edxapp/themes/openedu_theme/
#sudo git pull origin master

sudo -H -u edxapp bash << EOF
source /edx/app/edxapp/edxapp_env
cd /edx/app/edxapp/edx-platform
paver update_assets cms --settings=aws
paver update_assets lms --settings=aws

python manage.py cms --settings=aws collectstatic --noinput
python manage.py lms --settings=aws collectstatic --noinput

#paver update_assets cms --settings=aws
#python manage.py cms --settings=aws collectstatic --noinput
EOF


sudo /edx/bin/supervisorctl restart edxapp:
sudo /edx/bin/supervisorctl restart edxapp_worker:

