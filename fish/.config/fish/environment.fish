# Environment variables
#----------------------
# set -gx PATH /home/dtcristo/bin /home/dtcristo/.yarn/bin $PATH
set -gx EDITOR nvim
set -gx VISUAL nvim
# CPATH: Path for C/C++ headers
set -gx CPATH /home/dtcristo/dev/crystal/cray/raylib/src:/home/dtcristo/dev/c/raygui/src
# LIBRARY_PATH: Path to find static libraries
set -gx LIBRARY_PATH /home/dtcristo/dev/crystal/crsfml/voidcsfml:/home/dtcristo/dev/crystal/cray
# LD_LIBRARY_PATH: Path to find dynamic libraries
set -gx LD_LIBRARY_PATH $LIBRARY_PATH

# chruby, ruby version switcher
#------------------------------
set -gx CHRUBY_ROOT /usr
source /usr/local/share/chruby/chruby.fish
source /usr/local/share/chruby/auto.fish
