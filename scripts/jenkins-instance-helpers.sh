#! user/bin/env bash

sudo usermod -a -G root jenkins
sudo service jenkins restart