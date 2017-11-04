# Environment
#------------
source $HOME/.config/fish/environment.fish

# Interactive shell
#------------------
if status --is-interactive
  source $HOME/.config/fish/interactive.fish
end

# Login shell
#------------
if status --is-login
  source $HOME/.config/fish/login.fish
end
