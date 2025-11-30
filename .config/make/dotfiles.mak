## —— dotfiles -------------------------------------------------------------------------------------

.PHONY: backup-dir
backup-dir: ## Creates backup directory ins Users's Home
	@echo "## —— Create Backup Dir ----------------------------------------------------------------------------"
	@mkdir -p ~/.dotfiles.backup
	@echo "Created ~/.dotfiles.backup directory"

OH_MY_BASH_THEMES_DIR := .oh-my-bash/custom/themes
OH_MY_BASH_COMPLETIONS_DIR := .oh-my-bash/custom/completions

.PHONY: oh-my-bash
oh-my-bash: backup-dir ## Install and Configure oh-my-bash, and links .bashrc
	@echo "## —— installing and configuring oh-my-bash --------------------------------------------------------"
	@rm -rf ~/.oh-my-bash | true
	@OSH_THEME="powerline" bash -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended

	@cp -r ~/${OH_MY_BASH_THEMES_DIR} ~/.dotfiles.backup/ &> /dev/null | true
	@rm -rf ~/${OH_MY_BASH_THEMES_DIR} &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/${OH_MY_BASH_THEMES_DIR} ~/${OH_MY_BASH_THEMES_DIR}

	@cp -r ~/${OH_MY_BASH_COMPLETIONS_DIR} ~/.dotfiles.backup/ &> /dev/null | true
	@rm -rf ~/${OH_MY_BASH_COMPLETIONS_DIR} &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/${OH_MY_BASH_COMPLETIONS_DIR} ~/${OH_MY_BASH_COMPLETIONS_DIR}

	@cp ~/.bashrc ~/.dotfiles.backup/ &> /dev/null | true
	@rm ~/.bashrc &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.bashrc ~/.bashrc

.PHONY: gnome-gtk
gnome-gtk: backup-dir ## Links gtk-3 and gtk-4 configs in ~/.config/gtk-3,4
	@echo "## —— Gnome GTK CSS and Configs --------------------------------------------------------------------"
	@cp -r ~/.config/gtk-3.0 ~/.dotfiles.backup/ &> /dev/null | true
	@rm -rf ~/.config/gtk-3.0 &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.config/gtk-3.0 ~/.config/gtk-3.0

	@cp -r ~/.config/gtk-4.0 ~/.dotfiles.backup/ &> /dev/null | true
	@rm -rf ~/.config/gtk-4.0 &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.config/gtk-4.0 ~/.config/gtk-4.0

.PHONY: git-config
git-config: backup-dir ## Links .gitconfig to ~/.gitconfig
	@echo "## —— .gitconfig -----------------------------------------------------------------------------------"
	@cp ~/.gitconfig ~/.dotfiles.backup/ &> /dev/null | true
	@rm ~/.gitconfig &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.gitconfig ~/.gitconfig

.PHONY: tmux
tmux: backup-dir ## Links .tmux.conf to ~/.tmux.conf
	@echo "## —— tmux -----------------------------------------------------------------------------------------"
	@cp ~/.tmux.conf ~/.dotfiles.backup/ &> /dev/null | true
	@rm ~/.tmux.conf &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.tmux.conf ~/.tmux.conf

.PHONY: vim
vim: backup-dir ## Links .vimrc to ~/.vimrc and install vim plugins
	@echo "## —— vim ------------------------------------------------------------------------------------------"
	@cp ~/.vimrc ~/.dotfiles.backup &> /dev/null | true
	@rm ~/.vimrc &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.vimrc ~/.vimrc

	@mkdir -p ~/.vim

	@cp -r ~/.vim/colors ~/.dotfiles.backup/ &> /dev/null | true
	@rm -r ~/.vim/colors &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.vim/colors ~/.vim/colors

	@cp -r ~/.vim/autoload ~/.dotfiles.backup/ &> /dev/null | true
	@rm -r ~/.vim/autoload &> /dev/null | true
	ln -fs ${DOTFILES_DIR_PATH}/.vim/autoload ~/.vim/autoload

	ln -fs ${DOTFILES_DIR_PATH}/.vim/shell_header.temp ~/.vim/shell_header.temp

	@rm -rf ~/.vim/bundle/Vundle.vim | true
	@git clone --quiet https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	@vim +PluginInstall +qall

	@curl -fSsLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@vim +PlugInstall +qall
