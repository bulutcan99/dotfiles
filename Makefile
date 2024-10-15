install:
	# curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# brew
	brew install tmux
	brew install httpie
	brew install lazydocker
	brew install lazygit
	brew install ripgrep
	brew tap hashicorp/tap
	brew install hashicorp/tap/terraform
	brew install neovim
	brew install lua-language-server
	brew install llvm
	brew install jesseduffield/lazygit/lazygit
	brew install fd
	brew install zoxide
	brew install --cask kitty
	brew install yazi	
	brew install thefuck
	brew install eza
	brew install fzf

	# rust
	rustup component add rust-analyzer
