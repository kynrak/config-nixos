{
  programs.kitty = {
    font = { 
      name = "JetBrainsMono Nerd Font Mono";
      size = 12;
    };
    settings = { 
      background_opacity = "1"; 
      background_blur = 1;
      enable_audio_bell = "no"; 
      autohide_time = 3000; 
      vi_mode_cursor_shape = "block"; 
      scrollback_always_clear = "no"; 
      scroll_wheel_multiplier = 5;
    };
    keybindings = { 
      "ctrl+c" = "copy_to_clipboard"; 
      "ctrl+v" = "paste_from_clipboard"; 
      "ctrl+f" = "search_start"; 
    };
  };
}
