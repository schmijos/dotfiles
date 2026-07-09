source /opt/homebrew/etc/profile.d/autojump.sh
source ~/.antigen.zshrc
source ~/.fzf.zsh

source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
source <(nctl completions -c zsh)

export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GPG_TTY="tty"
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export PUPPETEER_EXECUTABLE_PATH=`which chromium`
export OPENBLAS="$(brew --prefix openblas)"
export PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/ghostscript-x11/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export EDITOR="nvim"
export BETTER_ERRORS_EDITOR="rubymine"

alias ll="ls -lha"
alias gsf='git checkout $(git branch | fzf)'
alias renuo="ASDF_RUBY_VERSION=4.0.2 renuo"

safe() {
    case "$PWD/" in
      "$HOME/p"/*) ;;
      *)
        printf 'Not under %s (PWD=%s). Continue? [y/N] ' "$HOME/p" "$PWD"
        read -r reply
        [[ "$reply" == [yY]* ]] || return 1
        ;;
    esac
	
  safehouse \
    --workdir="$PWD" \
    --add-dirs-ro="$HOME/p" \
    --add-dirs-ro="$HOME/.gitconfig" \
    --add-dirs-ro="$HOME/.gitignore" \
    --enable=kubectl -- "$@";
}
claude()   { safe claude --permission-mode auto "$@"; }
codex()    { safe codex --dangerously-bypass-approvals-and-sandbox "$@"; }
amp()      { safe amp --dangerously-allow-all "$@"; }
gemini()   { NO_BROWSER=true safe gemini --yolo "$@"; }

function mktouch() {
  mkdir -p -- "$(dirname -- "$1")" && touch -- "$1"
}

function quickfix() {
  git grep -n "$1" | vim -q /dev/stdin -c "let @/='$1'" -c "set hlsearch" -c "copen"
}

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/josua/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
eval "$(mise activate zsh)"

# Added by Antigravity
export PATH="/Users/josua/.antigravity/antigravity/bin:$PATH"

#alias deploio="/Users/josua/p/deploio-cli/bin/deploio"
#eval "$(deploio completion)"

