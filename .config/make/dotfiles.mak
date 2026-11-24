## —— dotfiles -------------------------------------------------------------------------------------

OH_MY_BASH_THEMES_DIR := .oh-my-bash/custom/themes
OH_MY_BASH_COMPLETIONS_DIR := .oh-my-bash/custom/completions
OH_MY_BASH_ALIASES_DIR := .oh-my-bash/custom/aliases

.PHONY: oh-my-bash
oh-my-bash: ## Install and Configure oh-my-bash, and links .bashrc
	@echo "## —— installing and configuring oh-my-bash --------------------------------------------------------"

	@rm -rf ~/.oh-my-bash | true
	@OSH_THEME="powerline" bash -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)" --unattended

	@rm -rf ~/${OH_MY_BASH_THEMES_DIR} &> /dev/null | true
	@rm -rf ~/${OH_MY_BASH_COMPLETIONS_DIR} &> /dev/null | true
	@rm -rf ~/${OH_MY_BASH_ALIASES_DIR} &> /dev/null | true

	ln -fs ${DOTFILES_DIR_PATH}/${OH_MY_BASH_THEMES_DIR} ~/${OH_MY_BASH_THEMES_DIR}
	ln -fs ${DOTFILES_DIR_PATH}/${OH_MY_BASH_COMPLETIONS_DIR} ~/${OH_MY_BASH_COMPLETIONS_DIR}
	ln -fs ${DOTFILES_DIR_PATH}/${OH_MY_BASH_ALIASES_DIR} ~/${OH_MY_BASH_ALIASES_DIR}
	ln -fs ${DOTFILES_DIR_PATH}/.bashrc ~/.bashrc

.PHONY: gnome-gtk
gnome-gtk: ## Links gtk-3 and gtk-4 configs in ~/.config/gtk-3,4
	@echo "## —— Gnome GTK CSS and Configs --------------------------------------------------------------------"

	@rm -rf ~/.config/gtk-3.0 &> /dev/null | true
	@rm -rf ~/.config/gtk-4.0 &> /dev/null | true

	ln -fs ${DOTFILES_DIR_PATH}/.config/gtk-3.0 ~/.config/gtk-3.0
	ln -fs ${DOTFILES_DIR_PATH}/.config/gtk-4.0 ~/.config/gtk-4.0

.PHONY: git-config
git-config: ## Links .gitconfig to ~/.gitconfig
	@echo "## —— .gitconfig -----------------------------------------------------------------------------------"
	ln -fs ${DOTFILES_DIR_PATH}/.gitconfig ~/.gitconfig

.PHONY: tmux
tmux: ## Links .tmux.conf to ~/.tmux.conf
	@echo "## —— tmux -----------------------------------------------------------------------------------------"
	ln -fs ${DOTFILES_DIR_PATH}/.tmux.conf ~/.tmux.conf

.PHONY: vim
vim: ## Links .vimrc and installs Vim plugins with vim-plug
	@echo "## —— vim ------------------------------------------------------------------------------------------"
	@mkdir -p ~/.vim

	ln -fs ${DOTFILES_DIR_PATH}/.vim/shell_header.temp ~/.vim/shell_header.temp
	ln -fs ${DOTFILES_DIR_PATH}/.vimrc ~/.vimrc

	@curl -fSsLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@vim +PlugInstall\ --sync +qa
