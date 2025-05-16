# Makefile

SHELL := /bin/bash
.DEFAULT_GOAL := dotfiles

.PHONY: minimal
minimal: init ohmybash end

.PHONY: dotfiles
dotfiles: init ohmybash vim git tmux gtk end

.PHONY: all
all: dotfiles vscode

.PHONY: init
init:
	@mkdir -p ~/.bak
	@echo "Created ~/.bak directory"

OH_MY_BASH_THEMES_DIR := .oh-my-bash/custom/themes
OH_MY_BASH_COMPLETIONS_DIR := .oh-my-bash/custom/completions

.PHONY: ohmybash
ohmybash:
	bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"

	@cp -r ~/${OH_MY_BASH_THEMES_DIR} ~/.bak/ &> /dev/null | true
	@rm -rf ~/${OH_MY_BASH_THEMES_DIR} &> /dev/null | true
	ln -s ${PWD}/${OH_MY_BASH_THEMES_DIR} ~/${OH_MY_BASH_THEMES_DIR}

	@cp -r ~/${OH_MY_BASH_COMPLETIONS_DIR} ~/.bak/ &> /dev/null | true
	@rm -rf ~/${OH_MY_BASH_COMPLETIONS_DIR} &> /dev/null | true
	ln -s ${PWD}/${OH_MY_BASH_COMPLETIONS_DIR} ~/${OH_MY_BASH_COMPLETIONS_DIR}

	@cp ~/.bashrc ~/.bak/ &> /dev/null | true
	@rm ~/.bashrc &> /dev/null | true
	ln -s ${PWD}/.bashrc ~/.bashrc

.PHONY: gtk
gtk:
	@cp -r ~/.config/gtk-3.0 ~/.bak/ &> /dev/null | true
	@rm -rf ~/.config/gtk-3.0 &> /dev/null | true
	ln -s ${PWD}/.config/gtk-3.0 ~/.config/gtk-3.0

	@cp -r ~/.config/gtk-4.0 ~/.bak/ &> /dev/null | true
	@rm -rf ~/.config/gtk-4.0 &> /dev/null | true
	ln -s ${PWD}/.config/gtk-4.0 ~/.config/gtk-4.0


.PHONY: git
git:
	@cp ~/.gitconfig ~/.bak/ &> /dev/null | true
	@rm ~/.gitconfig &> /dev/null | true
	ln -s ${PWD}/.gitconfig ~/.gitconfig

.PHONY: tmux
tmux:
	@cp ~/.tmux.conf ~/.bak/ &> /dev/null | true
	@rm ~/.tmux.conf &> /dev/null | true
	ln -s ${PWD}/.tmux.conf ~/.tmux.conf

.PHONY: vim
vim:
	@cp ~/.vimrc ~/.bak/ &> /dev/null | true
	@rm ~/.vimrc &> /dev/null | true
	ln -s ${PWD}/.vimrc ~/.vimrc

	@mkdir -p ~/.vim

	@cp -r ~/.vim/colors ~/.bak/ &> /dev/null | true
	@rm -r ~/.vim/colors &> /dev/null | true
	ln -s ${PWD}/.vim/colors ~/.vim/colors

	@cp -r ~/.vim/autoload ~/.bak/ &> /dev/null | true
	@rm -r ~/.vim/autoload &> /dev/null | true
	ln -s ${PWD}/.vim/autoload ~/.vim/autoload

	ln -sf ${PWD}/.vim/shell_header.temp ~/.vim/shell_header.temp

	@rm -rf ~/.vim/bundle/Vundle.vim | true
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall

.PHONY: vscode
vscode:
	@cp ~/.config/Code/User/settings.json ~/.bak/vscode.settings.json &> /dev/null | true
	@rm ~/.config/Code/User/settings.json &> /dev/null | true
	@mkdir -p ~/.config/Code/User
	ln -s ${PWD}/.config/Code/User/settings.json ~/.config/Code/User/settings.json

	code --install-extension redhat.ansible
	code --install-extension streetsidesoftware.code-spell-checker
	code --install-extension ms-azuretools.vscode-containers
	code --install-extension editorconfig.editorconfig
	code --install-extension gitlab.gitlab-workflow
	code --install-extension eamodio.gitlens
	code --install-extension golang.go
	code --install-extension hashicorp.terraform
	code --install-extension isudox.vscode-jetbrains-keybindings
	code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
	code --install-extension lunuan.kubernetes-templates
	code --install-extension yzhang.markdown-all-in-one
	code --install-extension davidanson.vscode-markdownlint
	code --install-extension zhuangtongfa.material-theme
	code --install-extension esbenp.prettier-vscode
	code --install-extension ms-python.vscode-pylance
	code --install-extension ms-python.python
	code --install-extension ms-python.debugpy
	code --install-extension redhat.vscode-yaml

.PHONY: end
end:
	@echo "A copy of the previous dotfiles are available in the '~/.bak' folder."
