{ pkgs, inputs, ...}:

{
  ## Micro settings/keybinds
  home.file."bindings.json" = {
    target = ".config/micro/";
    text = ''
    {
      "Alt-d": "command:definition",
      "Alt-f": "command:format",
      "Alt-k": "command:hover",
      "Alt-r": "command:references",
      "Alt/": "lua:comment.comment",
      "Ctrl-Alt-z": "Redo",
      "Ctrl-Meta-z": "Redo",
      "Ctrl-x": "Cut",
      "CtrlSpace": "command:lspcompletion",
      "CtrlUnderscore": "lua:comment.comment",
      "Meta-s": "Save"
    }
    '';
  };

  home.file."settings.json" = {
    target = ".config/micro/";
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
