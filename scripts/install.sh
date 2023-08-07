#!/usr/bin/env bash

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
ROOT_DIR=$(cd "$SCRIPT_DIR/.." && pwd)

# shellcheck disable=SC1091
source "$ROOT_DIR/bin/shell-progress/spinner.sh"

zsh() {
	start_spinner "  zsh"
	sleep 0.1
	stop_spinner $?
}

oh_my_zsh() {
	start_spinner "  oh_my_zsh"
	sleep 0.1
	stop_spinner $?
}

alacritty() {
	start_spinner "  alacritty"
	test -d "$HOME/.config/alacritty" || mkdir -p "$HOME/.config/alacritty"
	ln -Fs "$ROOT_DIR/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
	sleep 0.1
	stop_spinner $?
}

gitconfig() {
	start_spinner "  git"
	ln -Fs "$ROOT_DIR/git/.gitconfig" "$HOME/.gitconfig"
	sleep 0.1
	stop_spinner $?
}

tmux() {
	local tmux_path="$ROOT_DIR/tmux"
	start_spinner "  oh-my-tmux"
	test -d "$tmux_path/oh-my-tmux" || git clone https://github.com/gpakosz/.tmux.git "$tmux_path/oh-my-tmux" &>/dev/null
	cd "$tmux_path/oh-my-tmux" && git pull &>/dev/null

	# test -d "$HOME/.config/tmux" || mkdir -p "$HOME/.config/tmux"
	# ln -fs "$TMUX_PATH/oh-my-tmux/.tmux.conf" "$HOME/.config/tmux/tmux.conf"
	# ln -fs "$TMUX_PATH/tmux.conf.local" "$HOME/.config/tmux/tmux.conf.local"

	ln -Fs "$tmux_path/oh-my-tmux/.tmux.conf" "$HOME/.tmux.conf"
	ln -Fs "$tmux_path/tmux.conf.local" "$HOME/.tmux.conf.local"
	stop_spinner $?
}

nvim() {
	start_spinner "  nvim"
	test -d "$HOME/.config/nvim" || git clone https://github.com/ted-vo/nvim.git "$HOME/.config/nvim" &>/dev/null
	cd "$HOME/.config/nvim" && git pull origin main &>/dev/null
	stop_spinner $?
}

toolbox() {
	start_spinner "  toolbox/bin"
	cat >>~/.zshrc <<EOF # toolbox/bin
export PATH="$(
		printf '%s:$%s' "$ROOT_DIR/bin" "PATH"
	)"
EOF
	sleep 0.1
	stop_spinner $?
}
all() {
	zsh
	oh_my_zsh
	alacritty
	gitconfig
	tmux
	nvim
	toolbox
}

main() {
	case $1 in
	zsh)
		zsh
		exit
		;;
	oh_my_zsh)
		oh_my_zsh
		exit
		;;
	alacritty)
		alacritty
		exit
		;;
	gitconfig)
		gitconfig
		exit
		;;
	tmux)
		tmux
		exit
		;;
	nvim)
		nvim
		exit
		;;
	toolbox)
		toolbox
		exit
		;;
	all)
		all
		exit
		;;
	*)
		echo "Not support!"
		exit
		;;
	esac
}

main $@
