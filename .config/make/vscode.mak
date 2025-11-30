.PHONY: vscode-configs
vscode-configs: backup-dir # Links code user settings, and install vscode extensions
	@cp ~/.config/Code/User/settings.json ~/.dotfiles.backup/vscode.settings.json &> /dev/null | true
	@rm ~/.config/Code/User/settings.json &> /dev/null | true
	@echo "## —— vscode config --------------------------------------------------------------------------------"
	@mkdir -p ~/.config/Code/User
	ln -fs ${DOTFILES_DIR_PATH}/.config/Code/User/settings.json ~/.config/Code/User/settings.json

# 	code --install-extension davidanson.vscode-markdownlint
# 	code --install-extension docker.docker
# 	code --install-extension eamodio.gitlens
# 	code --install-extension editorconfig.editorconfig
# 	code --install-extension esbenp.prettier-vscode
# 	code --install-extension gitlab.gitlab-workflow
# 	code --install-extension golang.go
# 	code --install-extension hashicorp.terraform
# 	code --install-extension isudox.vscode-jetbrains-keybindings
# 	code --install-extension lunuan.kubernetes-templates
# 	code --install-extension ms-azuretools.vscode-containers
# 	code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
# 	code --install-extension ms-python.debugpy
# 	code --install-extension ms-python.python
# 	code --install-extension ms-python.vscode-pylance
# 	code --install-extension ms-python.vscode-python-envs
# 	code --install-extension ms-vscode.makefile-tools
# 	code --install-extension redhat.ansible
# 	code --install-extension redhat.vscode-yaml
# 	code --install-extension streetsidesoftware.code-spell-checker
# 	code --install-extension vscodevim.vim
# 	code --install-extension yzhang.markdown-all-in-one
# 	code --install-extension zhuangtongfa.material-theme
