{
  programs.kitty = {
    font = {
      name = "BigBlueTermPlus Nerd Font";
      size = 10;
    };
    settings = {
      background_opacity = "1";
      background_blur = 1;
      enable_audio_bell = "no";
      autohide_time = 3000;
      vi_mode_cursor_shape = "block";
      scrollback_always_clear = "no";
      scroll_wheel_multiplier = 5;
      tab_bar_edge = "top";
      tab_bar_style = "slant";
      tab_title_template = "{index} {title}";
    };
    keybindings = {
      "ctrl+c" = "copy_to_clipboard";
      "ctrl+v" = "paste_from_clipboard";
      "ctrl+f" = "search_start";
    };
  };
}
