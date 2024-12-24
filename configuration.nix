# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
  ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Network configuration
  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # System Settings
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Gnome DE settings
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.libinput.enable = true; # Touch pad

  # Docker configuration
  virtualisation.docker.enable = true;
  virtualisation.docker.rootless = {
    enable = true;
    setSocketVariable = true;
  };

  # User account
  users.users.luketeo = {
    isNormalUser = true;
    home = "/home/luketeo";
    description = "Luke Teo";
    extraGroups = ["wheel" "networkmanager" "docker"];
    shell = pkgs.zsh;
  };

  # Home Manager setup
  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users = {
      "luketeo" = import ./home.nix;
    };
  };

  # Must have system packages
  environment.systemPackages = with pkgs; [
    vim
    nano
    neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    git
    htop
  ];

  # General Programs to have -- rest should be managed by home manager
  programs.firefox.enable = true;
  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
}
