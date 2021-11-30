#! /bin/bash
ENV = $1
sh build_scripts/build.sh
sh deploy_scripts/deploy.sh $ENV
