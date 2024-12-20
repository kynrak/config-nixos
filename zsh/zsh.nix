{ 
  programs.zsh = { 
    enableCompletion = true; 
    autosuggestion.enable = true; 
    syntaxHighlighting.enable = true; 

    shellAliases = { 
      lg = "lazygit"; 
      ll = "ls -l"; 
      ns = "sudo nixos-rebuild switch --flake ~/dev/cfg/config-nixos#default"; 
      nc = "nix-env --delete-generations 3d && nix-store --gc"; 
    }; 
  };
} 
