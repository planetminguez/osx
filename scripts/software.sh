#!/bin/sh

# DESCRIPTION
# Installs and configures OSX software.

# USAGE
# ./software.sh

# SETTINGS
export RUBY_VERSION=1.9.3-p194
export POSTGRESQL_VERSION=9.1.3
export REDIS_VERSION=2.4.11
export VIRTUAL_BOX_URL=http://download.virtualbox.org/virtualbox/4.1.12
export VIRTUAL_BOX_FILE=VirtualBox-4.1.12-77245-OSX.dmg
export DROPBOX_URL=https://ddr3luum8vl5r.cloudfront.net
export DROPBOX_FILE=Dropbox%201.2.52.dmg
export KNOX_URL=https://d13itkw33a7sus.cloudfront.net/dist/K
export KNOX_FILE=Knox-2.1.15.zip
export ITERM_URL=http://iterm2.googlecode.com/files
export ITERM_FILE=iTerm2_v1_0_0.zip
export SUBLIME_TEXT_URL=http://c758482.r82.cf2.rackcdn.com
export SUBLIME_TEXT_FILE=Sublime%20Text%202%20Build%202181.dmg
export ALFRED_URL=http://rwc.cachefly.net
export ALFRED_FILE=alfred_1.2_220.dmg
export PATH_FINDER_URL=http://get.cocoatech.com
export PATH_FINDER_FILE=PathFinderSL6.dmg
export FIREFOX_URL=http://mozilla.c3sl.ufpr.br/releases//firefox/releases/12.0/mac/en-US
export FIREFOX_FILE=Firefox%2012.0.dmg
export CHROME_URL=https://dl.google.com/chrome/mac/stable/GGRO
export CHROME_FILE=googlechrome.dmg
export OPERA_URL=http://get3.opera.com/pub/opera/mac/1162
export OPERA_FILE=Opera_11.62_Setup_Intel.dmg
export OMNIDAZZLE_URL=http://downloads.omnigroup.com/software/MacOSX/10.4
export OMNIDAZZLE_FILE=OmniDazzle-1.1.1.dmg
export EXPANDRIVE_URL=http://downloads.expandrive.com/expandrive/v2-3-1_published_2012-03-07_at_15_18_52
export EXPANDRIVE_FILE=ExpanDrive.zip
export ISTATS_URL=http://s3.amazonaws.com/bjango/files/istatmenus3
export ISTATS_FILE=istatmenus3.21.zip
export PASTEBOT_SYNC_URL=http://tapbots.net/pastebot
export PASTEBOT_SYNC_FILE=PastebotSync.dmg
export GITHUB_URL=https://github-central.s3.amazonaws.com
export GITHUB_FILE=mac%2FGitHub%20for%20Mac%201.2.6.zip
export SNIPPETS_URL=http://www.snippetsapp.com/download
export SNIPPETS_FILE=Snippets-1.4.zip
export ESPRESSO_URL=http://macrabbit.com/espresso/downloads
export ESPRESSO_FILE=Espresso%202.0.1.dmg
export CODEKIT_URL=http://incident57.com/codekit/files
export CODEKIT_FILE=codekit-6166.zip
export DOUBLETAKE_URL=http://echoone.com/doubletake
export DOUBLETAKE_FILE=DoubleTake.dmg
export IMAGE_OPTIM_URL=http://imageoptim.com
export IMAGE_OPTIM_FILE=ImageOptim.tbz2
export IMAGE_ALPHA_URL=http://pngmini.com
export IMAGE_ALPHA_FILE=ImageAlpha1.2.3.tar.bz2
export VLC_URL=http://superb-dca2.dl.sourceforge.net/project/vlc/2.0.1/macosx/
export VLC_FILE=vlc-2.0.1.dmg
export PG_ADMIN_URL=http://ftp.postgresql.org/pub/pgadmin3/release/v1.14.2/osx
export PG_ADMIN_FILE=pgadmin3-1.14.2.dmg
export MONEYWELL_URL=http://downloads.nothirst.com
export MONEYWELL_FILE=MoneyWell_17.zip
export DELICIOUS_LIBRARY_URL=http://www.delicious-monster.com/downloads
export DELICIOUS_LIBRARY_FILE=DeliciousLibrary2.zip
export OPEN_OFFICE_URL=http://voxel.dl.sourceforge.net/project/openofficeorg.mirror/stable/3.3.0
export OPEN_OFFICE_FILE=OOo_3.3.0_MacOS_x86_install_en-US.dmg
export SKYPE_URL=http://download.skype.com/macosx
export SKYPE_FILE=Skype_5.7.59.1037.dmg

# EXECUTION
# Homebrew
/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
brew update

# Git
brew install git

# GitHub
brew install hub

# Node
brew install node

# ImageMagick
brew install imagemagick

# Graphviz
brew install graphviz

# Ruby
brew install rbenv
brew install --HEAD ruby-build
rbenv install $RUBY_VERSION
rbenv global $RUBY_VERSION

# Dotfiles
git clone git://github.com/bkuhlmann/dotfiles.git
cd dotfiles
ruby install.rb
cd $HOME
rm -rf dotfiles
exec $SHELL

# Ruby Gems
git clone git://github.com/bkuhlmann/ruby_gem_setup.git
cd ruby_gem_setup
ruby setup.rb
cd $HOME
rm -rf ruby_gem_setup

# Pow
curl get.pow.cx | sh

# PostgreSQL
brew install postgresql
cp /usr/local/Cellar/postgresql/$POSTGRESQL_VERSION/org.postgresql.postgres.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/org.postgresql.postgres.plist

# Redis
brew install redis
cp /usr/local/Cellar/redis/$REDIS_VERSION/io.redis.redis-server.plist ~/Library/LaunchAgents/
launchctl load -w ~/Library/LaunchAgents/io.redis.redis-server.plist

# VirtualBox
install_dmg_pkg $VIRTUAL_BOX_URL $VIRTUAL_BOX_FILE "VirtualBox"

# Dropbox
install_dmg_app $DROPBOX_URL $DROPBOX_FILE "Dropbox Installer"

# Knox
install_zip_app $KNOX_URL $KNOX_FILE

# iTerm
install_zip_app $ITERM_URL $ITEM_FILE

# Sublime Text 2
install_dmg_app $SUBLIME_TEXT_URL $SUBLIME_TEXT_FILE "Sublime Text 2"

# Alfred
install_dmg_app $ALFRED_URL $ALFRED_FILE "Alfred.app"

# Path Finder
install_dmg_app $PATH_FINDER_URL $PATH_FINDER_FILE "Path Finder"

# Firefox
install_dmg_app $FIREFOX_URL $FIREFOX_FILE "Firefox"

# Google Chrome
install_dmg_app $CHROME_URL $CHROME_FILE "Google Chrome"

# Opera
install_dmg_app $OPERA_URL $OPERA_FILE "Opera"

# OmniDazzle
install_dmg_app $OMNIDAZZLE_URL $OMNIDAZZLE_FILE "OmniDazzle"

# ExpanDrive
install_zip_app $EXPANDRIVE_URL $EXPANDRIVE_FILE

# iStat Menus (the app is the installer)
download_only $ISTATS_URL $ISTATS_FILE

# Pastebot Sync (preference pane)
download_only $PASTEBOT_SYNC_URL $PASTEBOT_SYNC_FILE

# GitHub
install_zip_app $GITHUB_URL $GITHUB_FILE

# Snippets
install_zip_app $SNIPPETS_URL $SNIPPETS_FILE

# Espresso
install_dmg_app $ESPRESSO_URL $ESPRESSO_FILE "Espresso 2.0.1"

# CodeKit
install_zip_app $CODEKIT_URL $CODEKIT_FILE

# DoubleTake
install_dmg_app $DOUBLETAKE_URL $DOUBLETAKE_FILE "DoubleTake"

# ImageOptim
install_tar_app $IMAGE_OPTIM_URL $IMAGE_OPTIM_FILE "-xjvf"

# ImageAlpha
install_tar_app $IMAGE_ALPHA_URL $IMAGE_ALPHA_FILE "-xjvf"

# VLC
install_dmg_app $VLC_URL $VLC_FILE "vlc-2.0.1"

# PG Admin
install_dmg_app $PG_ADMIN_URL $PG_ADMIN_FILE "pgAdmin3"

# MoneyWell
install_zip_app $MONEYWELL_URL $MONEYWELL_FILE

# Delicious Library
install_zip_app $DELICIOUS_LIBRARY_URL $DELICIOUS_LIBRARY_FILE

# OpenOffice
install_dmg_app $OPEN_OFFICE_URL $OPEN_OFFICE_FILE "OpenOffice.org 3.3"

# Skype
install_dmg_app $SKYPE_URL $SKYPE_FILE "Skype"
