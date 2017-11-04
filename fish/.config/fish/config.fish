# Environment
#------------
source $HOME/.config/fish/environment.fish

# Interactive shell
#------------------
if status --is-interactive
  echo "Interactive fish"
  source $HOME/.config/fish/interactive.fish
end

# Login shell
#------------
if status --is-login
  echo "Login fish"
  source $HOME/.config/fish/login.fish
end
