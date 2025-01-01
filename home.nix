{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./nvim/keymaps.nix
    ./nvim/options.nix
    ./nvim/plugins.nix
    ./nvim/completion.nix
    ./kitty/kitty.nix
    ./thunderbird/thunderbird.nix
    ./zsh/zsh.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "luketeo";
  home.homeDirectory = "/home/luketeo";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changinga

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    firefox-devedition
    # Unix Tools
    ncdu
    ripgrep
    fd
    tree
    fzf
    eza
    bat
    memtester

    # Network
    nmap

    # LSP
    nixd
    alejandra
    gopls
    gofumpt
    golangci-lint
    golines
    goimports-reviser
    pyright
    python312Packages.python-lsp-server
    biome
    vtsls
    lua-language-server

    # Dev Tools
    bun
    nodejs
    go
    gcc
    go-task
    python3

    # Nerd Fonts
    nerd-fonts.terminess-ttf
    nerd-fonts.jetbrains-mono
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".ssh/allowed_signers".text = "${config.programs.git.userEmail} ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIMOb+kdNBe1dgJktgI4gqokCbNf3J/yzwyQ5qA857fkS";
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/luketeo/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # programs.firefox.enable = true;
  programs.nixvim.enable = true;
  programs.kitty.enable = true;
  programs.lazygit.enable = true;
  programs.thunderbird.enable = true;
  programs.zsh.enable = true;
  programs.chromium = {
    enable = true;
    package = pkgs.brave;
  };
  programs.git = {
    enable = true;
    userEmail = "67887422+lukteo@users.noreply.github.com";
    userName = "luke-teo";
    extraConfig = {
      commit.gpgsign = true;
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
      user.signingkey = "~/.ssh/id_ed25519.pub";
    };
  };

  fonts.fontconfig.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
