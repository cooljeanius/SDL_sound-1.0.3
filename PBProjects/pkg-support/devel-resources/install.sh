#!/bin/sh
# finish up the installation
# this script should be executed using the sudo command
# this file is copied to SDL_sound.post_install and SDL_sound.post_upgrade
# inside the .pkg bundle
echo "Running post-install script"
umask 022

ROOT=/Developer/Documentation/SDL

echo "Moving SDL_sound.framework to ~/Library/Frameworks"
# move SDL to its proper home, so the target stationary works
mkdir -p ~/Library/Frameworks
/Developer/Tools/CpMac -r $ROOT/SDL_sound.framework ~/Library/Frameworks
rm -rf $ROOT/SDL_sound.framework

echo "Precompiling Header"
# precompile header for speedier compiles
/usr/bin/cc -I $HOME/Library/Frameworks/SDL.framework/Headers -precomp ~/Library/Frameworks/SDL_sound.framework/Headers/SDL_sound.h -o ~/Library/Frameworks/SDL_sound.framework/Headers/SDL_sound.p
