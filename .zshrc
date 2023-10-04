#
# ----- Pre ---------------------------------------------
#
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# ${(%):-%n} = whoami
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/usr/local/bin:/usr/bin"

# ZShell plugin manager
autoload -Uz compinit && compinit

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit light ohmyzsh/ohmyzsh
zinit ice depth=1; zinit light romkatv/powerlevel10k
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::encode64
zinit snippet OMZP::tmux
zinit snippet OMZP::rust
zinit snippet OMZP::command-not-found

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#
# ----- Post ---------------------------------------------
#

source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias vim=nvim
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias dotfilesconf="vim $HOME/.dotfiles"

# TMUX
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_CONFIG="${XDG_CACHE_HOME:-$HOME/.config}/tmux/tmux.conf"
ZSH_TMUX_DEFAULT_SESSION_NAME='workspace'

TMUX_CONF="$XDG_CONFIG_HOME/tmux/tmux.conf"
    
# toolbox/bin
export DOTFILES_HOME="/home/ted/.dotfiles"
case ":/home/ted/.local/share/zinit/polaris/bin:/usr/local/bin:/usr/bin:" in
  *"::"*) ;;
  *) export PATH="/bin:/home/ted/.local/share/zinit/polaris/bin:/usr/local/bin:/usr/bin" ;;
esac

# --- ibus configure
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
pgrep ibus-daemon $2>1 || ibus-daemon -dxr

# --- Gcloud ------------------------ 
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/ted/google-cloud-sdk/path.zsh.inc' ]; then . '/home/ted/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/ted/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/ted/google-cloud-sdk/completion.zsh.inc'; fi

# --- .asdf ------------------------
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# --- rust -------------------------
export PATH="$HOME/.cargo/bin:$PATH" 

# --- Ruby -------------------------
export PATH="$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# --- Golang -----------------------
export PATH="$HOME/go/bin:$PATH"

# ---- PNPM ------------------------
export PNPM_HOME="/home/ted/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# ---- Bun -------------------------
[ -s "/home/ted/.bun/_bun" ] && source "/home/ted/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
    
# toolbox/bin
export DOTFILES_HOME="/home/ted/.dotfiles"
case ":/home/ted/.bun/bin:/home/ted/.local/share/pnpm:/home/ted/go/bin:/home/ted/.local/bin:/home/ted/.local/share/gem/ruby/3.0.0/bin:/home/ted/.cargo/bin:/home/ted/.asdf/shims:/home/ted/.asdf/bin:/home/ted/google-cloud-sdk/bin:/bin:/home/ted/.local/share/zinit/polaris/bin:/usr/local/bin:/usr/bin:" in
  *"::"*) ;;
  *) export PATH="/bin:/home/ted/.bun/bin:/home/ted/.local/share/pnpm:/home/ted/go/bin:/home/ted/.local/bin:/home/ted/.local/share/gem/ruby/3.0.0/bin:/home/ted/.cargo/bin:/home/ted/.asdf/shims:/home/ted/.asdf/bin:/home/ted/google-cloud-sdk/bin:/bin:/home/ted/.local/share/zinit/polaris/bin:/usr/local/bin:/usr/bin" ;;
esac
    
# toolbox/bin
export DOTFILES_HOME="/home/ted/.dotfiles"
case ":/home/ted/.bun/bin:/home/ted/.local/share/pnpm:/home/ted/go/bin:/home/ted/.local/bin:/home/ted/.local/share/gem/ruby/3.0.0/bin:/home/ted/.cargo/bin:/home/ted/.asdf/shims:/home/ted/.asdf/bin:/home/ted/google-cloud-sdk/bin:/bin:/home/ted/.local/share/zinit/polaris/bin:/usr/local/bin:/usr/bin:" in
  *"::"*) ;;
  *) export PATH="/bin:/home/ted/.bun/bin:/home/ted/.local/share/pnpm:/home/ted/go/bin:/home/ted/.local/bin:/home/ted/.local/share/gem/ruby/3.0.0/bin:/home/ted/.cargo/bin:/home/ted/.asdf/shims:/home/ted/.asdf/bin:/home/ted/google-cloud-sdk/bin:/bin:/home/ted/.local/share/zinit/polaris/bin:/usr/local/bin:/usr/bin" ;;
esac
