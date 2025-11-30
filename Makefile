# Makefile
.PHONY: all SHELL

.DEFAULT_GOAL := help
.EXPORT_ALL_VARIABLES:
MAKEFLAGS += "-j$(NUM_CORES) -l$(NUM_CORES)"
SHELL:= /bin/bash
.SHELLFLAGS = -eu -o pipefail -c

# Makefile colors config
bold := $(shell tput bold)
normal := $(shell tput sgr0)
errorTitle := $(shell tput setab 1 && tput bold && echo '\n')
recommendation := $(shell tput setab 4)
underline := $(shell tput smul)
reset := $(shell tput -Txterm sgr0)
black := $(shell tput setaf 0)
red := $(shell tput setaf 1)
green := $(shell tput setaf 2)
yellow := $(shell tput setaf 3)
blue := $(shell tput setaf 4)
magenta := $(shell tput setaf 5)
cyan := $(shell tput setaf 6)
white := $(shell tput setaf 7)

define HEADER
How to use me:
	# To install and configure all targets
	${bold}make all${reset}

	# To install and configure one target
	${bold}make ${cyan}<target>${reset}

endef
export HEADER

-include $(addsuffix /*.mak, $(shell find .config/make -type d))

DOTFILES_DIR_PATH := ${PWD}/home

.PHONY: dotfiles
dotfiles: oh-my-bash \
	gnome-gtk git-config \
	tmux vim \
	vscode-configs \

# Final target that runs last and only if everything succeeded
done: dotfiles
	@echo ""
	@echo "ALL DONE – everything succeeded!"
	@echo "dotfiles are now customized"
	@exec bash
