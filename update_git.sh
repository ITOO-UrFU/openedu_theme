#!/bin/bash


cd /edx/app/edxapp/themes/openedu_theme 
sudo git pull origin master


sudo /edx/bin/supervisorctl restart edxapp:lms
