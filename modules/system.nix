{ pkgs, ... }:

{

  system = {
    # activationScripts are executed every time you boot the system or run `nixos-rebuild` / `darwin-rebuild`.
    activationScripts.postUserActivation.text = ''
      # activateSettings -u will reload the settings from the database and apply them to the current session,
      # so we do not need to logout and login again to make the changes take effect.
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      # customize dock
      dock = {
        autohide = true;
        show-recents = false;
      };

      # customize finder
      finder = {
        _FXShowPosixPathInTitle = false;  # show full path in finder title
        AppleShowAllExtensions = true;  # show all file extensions
        FXEnableExtensionChangeWarning = false;  # disable warning when changing file extension
        QuitMenuItem = true;  # enable quit menu item
        ShowPathbar = true;  # show path bar
        ShowStatusBar = true;  # show status bar
      };

      # customize settings that not supported by nix-darwin directly
      # Incomplete list of macOS `defaults` commands :
      #   https://github.com/yannbertrand/macos-defaults
      NSGlobalDomain = {
        # "com.apple.swipescrolldirection" = true;  # enable natural scrolling(default to true)
        # "com.apple.sound.beep.feedback" = 1;  # disable beep sound when pressing volume up/down key
        AppleInterfaceStyle = "Dark";  # dark mode
        # AppleKeyboardUIMode = 3;  # Mode 3 enables full keyboard control.
        ApplePressAndHoldEnabled = true;  # enable press and hold

        # If you press and hold certain keyboard keys when in a text area, the key’s character begins to repeat.
        # This is very useful for vim users, they use `hjkl` to move cursor.
        # sets how long it takes before it starts repeating.
        InitialKeyRepeat = 15;  # normal minimum is 15 (225 ms), maximum is 120 (1800 ms)
        # sets how fast it repeats once it starts. 
        KeyRepeat = 3;  # normal minimum is 2 (30 ms), maximum is 120 (1800 ms)

        NSAutomaticCapitalizationEnabled = false;  # disable auto capitalization(自动大写)
        NSAutomaticDashSubstitutionEnabled = false;  # disable auto dash substitution(智能破折号替换)
        NSAutomaticPeriodSubstitutionEnabled = false;  # disable auto period substitution(智能句号替换)
        NSAutomaticQuoteSubstitutionEnabled = false;  # disable auto quote substitution(智能引号替换)
        NSAutomaticSpellingCorrectionEnabled = false;  # disable auto spelling correction(自动拼写检查)
        NSNavPanelExpandedStateForSaveMode = true;  # expand save panel by default(保存文件时的路径选择/文件名输入页)
        NSNavPanelExpandedStateForSaveMode2 = true;
      };

      # https://github.com/rgcr/m-cli
      CustomUserPreferences = {
        ".GlobalPreferences" = {
          # automatically switch to a new space when switching to the application
          AppleSpacesSwitchOnActivate = true;
        };
        NSGlobalDomain = {
          # Add a context menu item for showing the Web Inspector in web views
          WebKitDeveloperExtras = true;
        };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = true;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = true;
          ShowRemovableMediaOnDesktop = true;
          _FXSortFoldersFirst = true;
          # When performing a search, search the current folder by default
          FXDefaultSearchScope = "SCcf";
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        "com.apple.spaces" = {
          "spans-displays" = 0; # Display have seperate spaces
        };
        "com.apple.WindowManager" = {
          EnableStandardClickToShowDesktop = 0; # Click wallpaper to reveal desktop
          StandardHideDesktopIcons = 0; # Show items on desktop
          HideDesktop = 0; # Do not hide items on desktop & stage manager
          StageManagerHideWidgets = 1;
          StandardHideWidgets = 0;
        };
        "com.apple.screensaver" = {
          askForPassword = 1;
          askForPasswordDelay = 15;
        };
        "com.apple.screencapture" = {
          location = "~/Desktop";
          type = "png";
        };
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        # Prevent Photos from opening automatically when devices are plugged in
        "com.apple.ImageCapture".disableHotPlug = true;
      };

      loginwindow = {
        GuestEnabled = false;  # disable guest user
        SHOWFULLNAME = false;  # show full name in login window
      };
    };

    keyboard = {
      enableKeyMapping = true;  # enable key mapping so that we can use `option` as `control`
      swapLeftCommandAndLeftAlt = false;  
    };
  };

  # Add ability to used TouchID for sudo authentication
  security.pam.enableSudoTouchIdAuth = true;

  # Set your time zone.
  # comment this due to the issue:
  #   https://github.com/LnL7/nix-darwin/issues/359
  # time.timeZone = "America/Los_Angeles";

  # Fonts
  fonts = {
    # will be removed after this PR is merged:
    #   https://github.com/LnL7/nix-darwin/pull/754
    # fontDir.enable = true;

    # will change to `fonts.packages` after this PR is merged:
    #   https://github.com/LnL7/nix-darwin/pull/754
    fonts = with pkgs; [
    # packages = with pkgs; [
      # icon fonts
      material-design-icons
      # font-awesome

      # nerdfonts
      # https://github.com/NixOS/nixpkgs/blob/nixos-23.11/pkgs/data/fonts/nerdfonts/shas.nix
      (nerdfonts.override {
        fonts = [
          # symbols icon only
          "NerdFontsSymbolsOnly"
          # Characters
          "FiraCode"
          "JetBrainsMono"
          "Iosevka"
        ];
      })
    ];
  };
}
