{
  description = "My Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
        url = "github:nix-community/home-manager";
        inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, nixpkgs, home-manager}:
  let
    configuration = { pkgs, ... }: {
      # List packages installed in system profile. To search by name, run:
      # $ nix-env -qaP | grep wget
      environment.systemPackages =
        [ 
          pkgs.vim
          pkgs.neovim
          pkgs.coreutils
          pkgs.rustup
          pkgs.cargo
          pkgs.rustfmt
          pkgs.rustPackages.clippy
          pkgs.fzf
          pkgs.zoxide
          pkgs.wakatime
          pkgs.starship
          #pkgs.sketchybar
          pkgs.bat
          pkgs.fish
          pkgs.sesh
          pkgs.nerdfonts
          pkgs.wget
          pkgs.nodejs_23
          pkgs.pnpm
          pkgs.gcc
          pkgs.cmake
          pkgs.fd
          pkgs.yq
        ];
      services.nix-daemon.enable = true;
      #services.sketchybar.enable = true;

      # Necessary for using flakes on this system.
      nix.settings.experimental-features = "nix-command flakes";

      fonts.packages = [
        (pkgs.nerdfonts.override { fonts = ["JetBrainsMono" "Hack"];})
      ];

      # Enable alternative shell support in nix-darwin.
      programs.fish.enable = true;

      # Set Git commit hash for darwin-version.
      system.configurationRevision = self.rev or self.dirtyRev or null;
      system.keyboard.enableKeyMapping = true;
      system.keyboard.remapCapsLockToControl = true;
      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      system.stateVersion = 5;

      # The platform the configuration will be used on.
      nixpkgs.hostPlatform = "aarch64-darwin";
      users.users.ops.home = "/Users/ops";
      users.users.ops.shell = pkgs.fish;
      nix.useDaemon = true;
      system.defaults = {
        dock.autohide = true;
        dock.mru-spaces = false;
        finder.AppleShowAllExtensions = true;
        finder.FXPreferredViewStyle = "clmv";
        loginwindow.LoginwindowText = "devops-toolbox";
        screencapture.location = "~/screenshots";
        screensaver.askForPasswordDelay = 10;
        NSGlobalDomain.NSWindowShouldDragOnGesture = true;
        NSGlobalDomain._HIHideMenuBar = false;
        NSGlobalDomain.InitialKeyRepeat = 20;
        NSGlobalDomain.KeyRepeat = 4;
      };

      
      # Homebrew needs to be installed on its own!
      homebrew.enable = true;
      homebrew.casks = [
        "google-chrome"
        "arc"
        "raycast"
        "nikitabobko/tap/aerospace"
        "alacritty"
        "vial"
        "vlc"
        "the-unarchiver"
        "1password"
        "1password-cli"
      ];
      homebrew.brews = [
      "ripgrep"
      "lazygit"
      "sqlite"
      "lsd"
      ];
    };
  in
  {
    # Build darwin flake using:
    # $ darwin-rebuild build --flake .#opss-MacBook-Pro
    darwinConfigurations."opss-MacBook-Pro" = nix-darwin.lib.darwinSystem {
      modules = [ 
       configuration 
       home-manager.darwinModules.home-manager {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ops = import ./home.nix;
            }
        ];

      };

    # Expose the package set, including overlays, for convenience.
    darwinPackages = self.darwinConfigurations."opss-MacBook-Pro".pkgs;
  };
}
