#!/usr/bin/env fish

if status is-interactive
    fastfetch
end

set -gx PYENV_ROOT $HOME/.pyenv
set -gx PATH $PYENV_ROOT/bin $PATH

# Load pyenv into the shell
set -U fish_user_paths $HOME/.pyenv/bin $fish_user_paths
status --is-interactive; and source (pyenv init --path | psub)
status --is-interactive; and source (pyenv init - | psub)
status --is-interactive; and source (pyenv virtualenv-init - | psub)

set -e LC_ALL
alias protontricks='flatpak run com.github.Matoking.protontricks'
alias protontricks-launch='flatpak run --command=protontricks-launch com.github.Matoking.protontricks'
set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH /home/skillp/go/bin

set -gx PATH /usr/local/cuda-12.9/bin $PATH
set -gx LD_LIBRARY_PATH /usr/local/cuda-12.9/lib64 $LD_LIBRARY_PATH