#!/bin/bash

# Create the public webroot if necessary
PUBLIC_DIR=/www/public
if [[ ! -e $PUBLIC_DIR ]]; then
  mkdir $PUBLIC_DIR;
elif [[ ! -d $PUBLIC_DIR ]]; then
  echo "$PUBLIC_DIR already exists but is not a directory" 1>&2;
fi

# Install TYPO3
if [[ ! -f "/www/composer.json" ]]; then
  cd "/www" || exit 1;
  composer require typo3/minimal "${TYPO3_VERSION}" \
    typo3/cms-belog \
    typo3/cms-beuser \
    typo3/cms-filemetadata \
    typo3/cms-fluid-styled-content \
    typo3/cms-form \
    typo3/cms-linkvalidator \
    typo3/cms-lowlevel \
    typo3/cms-reports \
    typo3/cms-rte-ckeditor \
    typo3/cms-scheduler \
    typo3/cms-setup \
    typo3/cms-t3editor \
    typo3/cms-tstemplate \
    typo3/cms-viewpage \
    || exit 2;
  #    fluidtypo3/vhs
  #    tollwerk/tw-base \

  # Install Fractal
#  if [[ "${FRACTAL}" == "1" ]]; then
#    composer require tollwerk/tw-componentlibrary
#  fi
  touch public/FIRST_INSTALL;
fi

#fluidtypo3/flux

env

exec "$@"
