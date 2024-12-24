{
  programs.zsh = {
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      lg = "lazygit";
      ll = "ls -l";
      ns = "sudo nixos-rebuild switch --flake /home/luketeo/Repositories/config-nixos#default";
      nc = "nix-env --delete-generations 3d && nix-store --gc";
    };
  };
}
