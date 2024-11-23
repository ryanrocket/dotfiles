# Homebrew Initialization
eval "$(/opt/homebrew/bin/brew shellenv)"

# PATH Configuration
export PATH="$HOME/.elan/bin:$PATH"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="$HOME/.pyenv/bin:$PATH"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

# Visual and Color Settings
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
LS_COLORS="fi=01;37:di=01;34:ex=01;32:ln=37\
:or=01;30:mi=00:mh=31\
:pi=33:so=43;30:do=35\
:bd=35;01:cd=35\
:su=37;41:sg=30;43:ca=30;41\
:tw=07;34:ow=30;44:st=30;44"
export LS_COLORS

# Shell Prompt Configuration
if [ "$TERM_PROGRAM" != "Apple_Terminal" ] && [ "$TERM_PROGRAM" != "Terminus-Sublime" ] && [ "$TERM_PROGRAM" != "Konsole" ]; then
  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/capr4n.omp.json)"
else
  export PS1="%n@%1~ > "
fi

# Aliases
alias ls="ls -G"
alias python='$(pyenv which python)'
alias pip='$(pyenv which pip)'
# alias vim="nvim -u $XDG_DATA_HOME/nvim/init.vim"

# Google Cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/path.zsh.inc"
fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then
  . "$HOME/google-cloud-sdk/completion.zsh.inc"
fi

# chruby Configuration
source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
source /opt/homebrew/opt/chruby/share/chruby/auto.sh
chruby ruby-3.1.3

# pyenv Initialization
eval "$(pyenv init -)"

# macOS SDK Configuration
export MACOSX_DEPLOYMENT_TARGET=14.0
export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX15.sdk"

# XDG Base Directory Configuration
export XDG_DATA_HOME="$HOME/.local/share"

# Custom Functions
function check_home_dir() {
  if [ "$HOME" = "$PWD" ]; then
    echo "(home)"
  else
    echo "$PWD"
  fi
}
export check_home_dir

ft() {
  gfortran -Os "$1" -o "${1%.*}"
  strip "${1%.*}"
}

readme() {
  pandoc -t plain "$1" | less
}

code() { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$@" ;}

# Change command + arrow behavior
bindkey '^[[1;1D' backward-word  # Command+Left Arrow
bindkey '^[[1;1C' forward-word   # Command+Right Arrow


