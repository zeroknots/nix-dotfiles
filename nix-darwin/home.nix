# home.nix
# home-manager switch 

{ config, pkgs, ... }:

{
  home.username = "ops";
  home.homeDirectory = "/Users/ops";
  home.stateVersion = "23.05"; # Please read the comment before changing.

# Makes sense for user specific applications that shouldn't be available system-wide
  home.packages = [
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/nvim".source = ~/dotfiles/neovim;
    ".config/gh-dash".source = ~/dotfiles/gh-dash;
    ".config/nix".source = ~/dotfiles/nix;
    ".config/nix-darwin".source = ~/dotfiles/nix-darwin;
    ".config/tmux".source = ~/dotfiles/tmux;
    ".tmux".source = ~/dotfiles/tmux-plugins;
    ".config/alacritty".source = ~/dotfiles/alacritty;
    ".config/fish".source = ~/dotfiles/fish;
    ".config/starship.toml".source = ~/dotfiles/starship.toml;
    ".config/sketchybar".source = ~/dotfiles/sketchybar;
    ".config/bin".source = ~/dotfiles/bin;
    ".aerospace.toml".source = ~/dotfiles/aerospace/aerospace.toml;
  };

  home.sessionVariables = {
    SSH_AUTH_SOCK = "~/Library/Group\ Containers/2BA8C4S2C.com.1password/t/agent.sock";
  };

  home.sessionPath = [
      "/run/current-system/sw/bin"
      "$HOME/.nix-profile/bin"
  ];
  programs.home-manager.enable = true;
  programs.fish = {
    enable = true;

  };
    #initExtra = ''
      ## Add any additional configurations here
      #eval "$(/opt/homebrew/bin/brew shellenv)"
      #export PATH=/run/current-system/sw/bin:$HOME/.nix-profile/bin:$PATH
      #export PATH=$HOME/.config/bin:$PATH
      #if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
        #. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
      #fi
    #'';
}
