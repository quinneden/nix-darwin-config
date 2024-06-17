{
  pkgs,
  inputs,
  ...
}: {
  ## Micro settings/keybinds
  home.file."bindings.json" = {
    target = ".config/micro/bindings.json";
    text = ''
      {
        "Alt-d": "command:definition",
        "Alt-f": "command:format",
        "Alt-k": "command:hover",
        "Alt-r": "command:references",
        "Alt/": "lua:comment.comment",
        "Ctrl-Alt-z": "Redo",
        "Ctrl-x": "Cut",
        "CtrlSpace": "command:lspcompletion",
        "CtrlUnderscore": "lua:comment.comment"
      }
    '';
  };

  home.file."settings.json" = {
    target = ".config/micro/settings.json";
    text = ''
      {
        "colorscheme": "dracula-tc",
        "hlsearch": true,
        "tabsize": 2,
        "tabstospaces": true,
        "scrollspeed": 3,
        "indentchar": ' ',
        "autosu": true
      }
    '';
  };
}
