#
# ███████╗██╗███████╗██╗  ██╗
# ██╔════╝██║██╔════╝██║  ██║
# █████╗  ██║███████╗███████║
# ██╔══╝  ██║╚════██║██╔══██║
# ██║     ██║███████║██║  ██║
# ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝
# A smart and user-friendly command line
# https://fishshell.com/

eval (/opt/homebrew/bin/brew shellenv)
starship init fish | source # https://starship.rs/
zoxide init fish | source # 'ajeetdsouza/zoxide'

set -U fish_greeting # disable fish greeting
set -U fish_key_bindings fish_vi_key_bindings
# set -U LANG en_US.UTF-8
# set -U LC_ALL en_US.UTF-8
fish_vi_key_bindings

set -Ux BAT_THEME  "base16"
set -Ux EDITOR nvim # 'neovim/neovim' text editor
set -Ux FZF_DEFAULT_COMMAND "fd -H -E '.git'"
set -Ux PAGER "less" # 'lucc/nvimpager'
set -Ux VISUAL nvim
set -Ux FONT "Hack Nerd Font"
set SSH_AUTH_SOCK "~/.1password/agent.sock"
set -x GITHUB_TOKEN "op://rhinestone/environment/github/password"
set -x DEPLOYER_KEY "op://rhinestone/environment/deployerkey/password"
set -x PRIVATE_KEY "op://rhinestone/environment/deployerkey/password"
set -x API_KEY_ALCHEMY "op://rhinestone/environment/alchemy/password"
set -x API_KEY_INFURA "op://rhinestone/environment/infura/password"
set -x ETHERSCAN_KEY "op://rhinestone/environment/etherscan/password"
set -x ETHERSCAN_API_KEY "op://rhinestone/environment/etherscan/password"

#source ~/.config/fzf/shell/key-bindings.fish
#source ~/.keys.sh
# golang - https://golang.google.cn/
#set -Ux GOPATH (go env GOPATH)
#fish_add_path $GOPATH/bin

# fish_add_path $HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path $HOME/.config/bin
fish_add_path $HOME/dotfiles/.cargo/bin
fish_add_path $HOME/.cargo/bin

export PATH="$PATH:/Users/ops/.foundry/bin"
export PATH="$PATH:/Users/ops/.local/share/nvim/mason/bin"
