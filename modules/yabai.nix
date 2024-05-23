{ pkgs, ... }: {

  services.yabai = {
    enable = true;
    enableScriptingAddition = true;
    package = pkgs.yabai;
    config = {
      focus_follows_mouse = "autoraise";
      mouse_follows_focus = "off";
      window_placement = "second_child";
      window_opacity = "off";
      window_opacity_duration = "0.0";
      window_border = "on";
      window_border_placement = "inset";
      window_border_width = 2;
      window_border_radius = 3;
      active_window_border_topmost = "off";
      window_topmost = "on";
      window_shadow = "float";
      active_window_border_color = "0xff5c7e81";
      normal_window_border_color = "0xff505050";
      insert_window_border_color = "0xffd75f5f";
      active_window_opacity = "1.0";
      normal_window_opacity = "1.0";
      split_ratio = "0.50";
      auto_balance = "on";
      mouse_modifier = "fn";
      mouse_action1 = "move";
      mouse_action2 = "resize";
      layout = "bsp";
      top_padding = 36;
      bottom_padding = 10;
      left_padding = 10;
      right_padding = 10;
      window_gap = 10;
    };
  };

  services.spacebar = {
    enable = true;
    package = pkgs.spacebar;
    config = {
      clock_format = "%R";
      space_icon_strip = "   ";
      text_font = ''"JetBrainsMono Nerd Font:Normal:12.0"'';
      icon_font = ''"FontAwesome:Regular:12.0"'';
      background_color = "0xff202020";
      foreground_color = "0xffa8a8a8";
      power_icon_strip = " ";
      space_icon = "";
      clock_icon = "";
    };
  };

  services.skhd = {
    enable = true;
    package = pkgs.skhd;
    skhdConfig = ''
    # focus window
    alt - j : yabai -m window --focus west
    alt - k : yabai -m window --focus south
    alt - i : yabai -m window --focus north
    alt - l : yabai -m window --focus east
    
    # swap window
    shift + alt - j : yabai -m window --swap west
    shift + alt - k : yabai -m window --swap south
    shift + alt - i : yabai -m window --swap north
    shift + alt - l : yabai -m window --swap east
    
    # move window
    shift + cmd - j : yabai -m window --warp west
    shift + cmd - k : yabai -m window --warp south
    shift + cmd - i : yabai -m window --warp north
    shift + cmd - l : yabai -m window --warp east
    
    # balance size of windows
    shift + alt - 0 : yabai -m space --balance
    
    # make floating window fill screen
    shift + alt - up     : yabai -m window --grid 1:1:0:0:1:1
    
    # make floating window fill left-half of screen
    shift + alt - left   : yabai -m window --grid 1:2:0:0:1:1
    
    # make floating window fill right-half of screen
    shift + alt - right  : yabai -m window --grid 1:2:1:0:1:1
    
    # destroy desktop
    cmd + alt - w : yabai -m space --destroy
    
    # fast focus desktop
    cmd + alt - x : yabai -m space --focus recent
    cmd + alt - z : yabai -m space --focus prev
    cmd + alt - c : yabai -m space --focus next
    cmd - 1 : yabai -m space --focus 1
    cmd - 2 : yabai -m space --focus 2
    cmd - 3 : yabai -m space --focus 3
    cmd - 4 : yabai -m space --focus 4
    cmd - 5 : yabai -m space --focus 5
    cmd - 6 : yabai -m space --focus 6
    cmd - 7 : yabai -m space --focus 7
    cmd - 8 : yabai -m space --focus 8
    cmd - 9 : yabai -m space --focus 9
    cmd - 0 : yabai -m space --focus 10
    
    # send window to desktop and follow focus
    shift + cmd - x : yabai -m window --space recent; yabai -m space --focus recent
    shift + cmd - z : yabai -m window --space prev; yabai -m space --focus prev
    shift + cmd - c : yabai -m window --space next; yabai -m space --focus next
    shift + cmd - 1 : yabai -m window --space  1; yabai -m space --focus 1
    shift + cmd - 2 : yabai -m window --space  2; yabai -m space --focus 2
    shift + cmd - 3 : yabai -m window --space  3; yabai -m space --focus 3
    shift + cmd - 4 : yabai -m window --space  4; yabai -m space --focus 4
    shift + cmd - 5 : yabai -m window --space  5; yabai -m space --focus 5
    shift + cmd - 6 : yabai -m window --space  6; yabai -m space --focus 6
    shift + cmd - 7 : yabai -m window --space  7; yabai -m space --focus 7
    shift + cmd - 8 : yabai -m window --space  8; yabai -m space --focus 8
    shift + cmd - 9 : yabai -m window --space  9; yabai -m space --focus 9
    shift + cmd - 0 : yabai -m window --space 10; yabai -m space --focus 10
    
    # focus monitor
    #ctrl + alt - x  : yabai -m display --focus recent
    #ctrl + alt - z  : yabai -m display --focus prev
    #ctrl + alt - c  : yabai -m display --focus next
    #ctrl + alt - 1  : yabai -m display --focus 1
    #ctrl + alt - 2  : yabai -m display --focus 2
    #ctrl + alt - 3  : yabai -m display --focus 3
    
    
    # move window
    shift + ctrl - a : yabai -m window --move rel:-20:0
    shift + ctrl - s : yabai -m window --move rel:0:20
    shift + ctrl - w : yabai -m window --move rel:0:-20
    shift + ctrl - d : yabai -m window --move rel:20:0
    
    # increase window size
    shift + alt - a : yabai -m window --resize left:-20:0
    shift + alt - s : yabai -m window --resize bottom:0:20
    shift + alt - w : yabai -m window --resize top:0:-20
    shift + alt - d : yabai -m window --resize right:20:0
    
    # decrease window size
    #shift + cmd - a : yabai -m window --resize left:20:0
    #shift + cmd - s : yabai -m window --resize bottom:0:-20
    #shift + cmd - w : yabai -m window --resize top:0:20
    #shift + cmd - d : yabai -m window --resize right:-20:0
    
    # set insertion point in focused container
    #ctrl + alt - h : yabai -m window --insert west
    #ctrl + alt - j : yabai -m window --insert south
    #ctrl + alt - k : yabai -m window --insert north
    #ctrl + alt - l : yabai -m window --insert east
    
    # rotate tree
    alt - r : yabai -m space --rotate 90
    
    # mirror tree y-axis
    alt - y : yabai -m space --mirror y-axis
    
    # mirror tree x-axis
    alt - x : yabai -m space --mirror x-axis
    
    # toggle desktop offset
    alt - a : yabai -m space --toggle padding; yabai -m space --toggle gap
    
    # toggle window parent zoom
    alt - d : yabai -m window --toggle zoom-parent
    
    # toggle window fullscreen zoom
    alt - f : yabai -m window --toggle zoom-fullscreen
    
    # toggle window native fullscreen
    shift + alt - f : yabai -m window --toggle native-fullscreen
    
    # toggle window border
    shift + alt - b : yabai -m window --toggle border
    
    # toggle window split type
    alt - e : yabai -m window --toggle split
    
    # float / unfloat window and center on screen
    alt - t : yabai -m window --toggle float;\
              yabai -m window --grid 4:4:1:1:2:2
    
    # toggle sticky (show on all spaces)
    alt - s : yabai -m window --toggle sticky
    
    # toggle topmost (keep above other windows)
    alt - o : yabai -m window --toggle topmost
    
    # toggle sticky, topmost and resize to picture-in-picture size
    alt - p : yabai -m window --toggle sticky;\
              yabai -m window --toggle topmost;\
              yabai -m window --grid 5:5:4:0:1:1
    
    # change layout of desktop
    ctrl + alt - a : yabai -m space --layout bsp
    ctrl + alt - d : yabai -m space --layout float
    
    # Custom stuff
    :: passthrough
    ctrl + cmd - p ; passthrough
    passthrough < ctrl + cmd - p ; default
    
    ctrl + cmd - s : bash -c 'source ~/.bash.d/darwin && pass-choose' 
    
    ctrl + cmd - b : bash -c 'source ~/.bash.d/functions && battpop'
    ctrl + cmd - d : bash -c 'source ~/.bash.d/functions && timepop'
    
    cmd - space : bash -c "source ~/.bash.d/darwin && choose-launcher"
    cmd - b : bash -c "source ~/.bash.d/darwin && choose-buku"
    cmd + shift - k : bash -c "source ~/.bash.d/darwin && snippets"
    
    #ctrl - 0x29 : bash -c "~/Applications/keynav.app/Contents/MacOS/XEasyMotion"
    
    ## Control mouse with keyboard
    ctrl - k : cliclick "m:+0,-20" #up
    ctrl - j : cliclick "m:+0,+20" #down
    ctrl - l : cliclick "m:+20,+0" #right
    ctrl - h : cliclick "m:-20,+0" #left
    
    ctrl + shift - k : cliclick "m:+0,-40" #up
    ctrl + shift - j : cliclick "m:+0,+40" #down
    ctrl + shift - l : cliclick "m:+40,+0" #right
    ctrl + shift - h : cliclick "m:-40,+0" #left

    ctrl - 0x21 : cliclick ku:ctrl c:. # click
    ctrl - 0x1E : cliclick ku:ctrl rc:.  # right click
    '';
  };
}