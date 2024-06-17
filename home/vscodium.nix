{pkgs, ...}: {
  programs.vscode = {
    # enable = true;
    # package = pkgs.vscodium;
    mutableExtensionsDir = true;
    extensions = with pkgs.vscode-extensions; [
      # Docker
      ms-azuretools.vscode-docker
      # nix language
      bbenoist.nix
      # nix-shell suport
      arrterian.nix-env-selector
      ms-python.python
      # Color theme
      # dracula-theme.theme-dracula
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
    userSettings = {
      # "update.mode" = "none";
      "extensions.autoUpdate" = true; # This stuff fixes vscode freaking out when theres an update
      "window.titleBarStyle" = "custom"; # needed otherwise vscode crashes, see https://github.com/NixOS/nixpkgs/issues/246509
      "window.menuBarVisibility" = "toggle";
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont', 'monospace', monospace";
      "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font', 'SymbolsNerdFont'";
      "editor.fontSize" = 16;
      "terminal.integrated.fontSize" = 14;
      "terminal.integrated.fontWeight" = 300;
      "terminal.integrated.fontWeightBold" = 500;
      "workbench.colorTheme" = "Catppuccin Mocha";
      "workbench.iconTheme" = "catppuccin-mocha";
      "vsicons.dontShowNewVersionMessage" = true;
      "explorer.confirmDragAndDrop" = false;
      "editor.fontLigatures" = false;
      "editor.minimap.enabled" = false;
      # "workbench.startupEditor" = "none";
      "window.newWindowDimensions" = "inherit";
      "window.restoreFullscreen" = true;
      "editor.formatOnSave" = true;
      "editor.formatOnType" = true;
      "editor.formatOnPaste" = true;
      "editor.indentSize" = "tabSize";
      "editor.tabSize" = 2;
      "workbench.layoutControl.type" = "menu";
      "workbench.editor.limit.enabled" = true;
      "workbench.editor.limit.value" = 3;
      "workbench.editor.limit.perEditorGroup" = true;
      # "workbench.editor.showTabs" = "single";
      "files.autoSave" = "onWindowChange";
      "explorer.openEditors.visible" = 0;
      "breadcrumbs.enabled" = false;
      "editor.renderControlCharacters" = false;
      "workbench.activityBar.location" = "bottom";
      "workbench.statusBar.visible" = true;
      "editor.scrollbar.verticalScrollbarSize" = 2;
      "editor.scrollbar.horizontalScrollbarSize" = 2;
      "editor.scrollbar.vertical" = "hidden";
      "editor.scrollbar.horizontal" = "hidden";
      "workbench.layoutControl.enabled" = true;
      "editor.mouseWheelZoom" = false;
      "C_Cpp.autocompleteAddParentheses" = true;
      "C_Cpp.formatting" = "vcFormat";
      "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyFunction" = true;
      "C_Cpp.vcFormat.newLine.closeBraceSameLine.emptyType" = true;
      "C_Cpp.vcFormat.space.beforeEmptySquareBrackets" = true;
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.block" = "sameLine";
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.function" = "sameLine";
      "C_Cpp.vcFormat.newLine.beforeElse" = false;
      "C_Cpp.vcFormat.newLine.beforeCatch" = false;
      "C_Cpp.vcFormat.newLine.beforeOpenBrace.type" = "sameLine";
      "C_Cpp.vcFormat.space.betweenEmptyBraces" = true;
      "C_Cpp.vcFormat.space.betweenEmptyLambdaBrackets" = true;
      "C_Cpp.vcFormat.indent.caseLabels" = true;
      "C_Cpp.intelliSenseCacheSize" = 2048;
      "C_Cpp.intelliSenseMemoryLimit" = 2048;
      "C_Cpp.default.browse.path" = [''''${workspaceFolder}/**''];
      "C_Cpp.default.cStandard" = "gnu11";
      "C_Cpp.inlayHints.parameterNames.hideLeadingUnderscores" = false;
      "C_Cpp.intelliSenseUpdateDelay" = 500;
      "C_Cpp.workspaceParsingPriority" = "medium";
      "C_Cpp.clang_format_sortIncludes" = true;
      "C_Cpp.doxygen.generatedStyle" = "/**";
    };
    # Keybindings
    keybindings = [
      {
        key = "ctrl+/";
        command = "editor.action.commentLine";
        when = "editorTextFocus && !editorReadonly";
      }
      {
        key = "ctrl+s";
        command = "workbench.action.files.saveFiles";
      }
      {
        key = "meta+shift+w";
        command = "workbench.action.terminal.new";
        when = "terminalProcessSupported || terminalWebExtensionContributedProfile";
      }
      {
        key = "meta+w";
        command = "";
      }
    ];
  };

  # home.file."product.json" = {
  #   target = "Library/Application\ Support/VSCodium/product.json";
  #   text = ''
  #   {
  #     "extensionsGallery": {
  #       "serviceUrl": "https://marketplace.visualstudio.com/_apis/public/gallery",
  #       "itemUrl": "https://marketplace.visualstudio.com/items",
  #       "cacheUrl": "https://vscode.blob.core.windows.net/gallery/index",
  #       "controlUrl": ""
  #     }
  #   }
  #   '';
  # };
}
