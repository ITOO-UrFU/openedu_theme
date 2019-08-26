#!/bin/bash


cd /edx/app/edxapp/themes/openedu_theme 
sudo git pull origin prod


sudo /edx/bin/supervisorctl restart edxapp:lms
