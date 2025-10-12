{pkgs, ...}:

{
  programs.tmux = {
    enable = true;
    clock24 = true;
    shell = "${pkgs.zsh}/bin/zsh";
    extraConfig = ''
      # Enable 257-color and true-color (24-bit) support in tmux
      
      # General
      set -g set-clipboard on         # Use system clipboard
      set -g detach-on-destroy off    # Don't exit from tmux when closing a session
      set -g escape-time 0            # Remove delay for exiting insert mode with ESC in Neovim
      set -g history-limit 1000000    # Increase history size (from 2,000)
      set -g mouse on                 # Enable mouse support
      set -g status-interval 3        # Update the status bar every 3 seconds (default: 15 seconds)
      set -g allow-passthrough on   # Allow programs in the pane to bypass tmux (e.g. for image preview)
      set -g status-position top
      
      # Start windows and panes at 1, not 0
      set -g base-index 1
      set -g pane-base-index 1
      set -g renumber-windows on # Automatically renumber windows when one is closed

      # Remap prefix from 'C-b' to 'C-a'
      unbind C-b
      set-option -g prefix C-a
      bind-key C-a send-prefix

      # Split panes using | and -
      bind | split-window -h -c "#{pane_current_path}"
      bind - split-window -v -c "#{pane_current_path}"
      unbind '"'
      unbind %

     # don't rename windows automatically
      set-option -g allow-rename off

      # enable vi mode keys
      set-window-option -g mode-keys vi
      set -g status-position bottom
      set -g status-left "#{?client_prefix,#[bg=#1E2030 fg=#7aa2f7],#[bg=#1E2030 fg=#9ece6a]} #S"
      set -g status-right "#[fg=#bb9af7,bg=#1E2030] 󰃮 %Y-%m-%d"
      set -g status-justify centre
      set -g status-left-length 200  # default: 10
      set -g status-right-length 200 # default: 10
      set-option -g status-style bg=#1E2030
      set -g window-status-current-format "#[fg=#7aa2f7,bg=default]  #I:#W"
      set -g window-status-format "#[fg=#a9b1d6,bg=default] #I:#W"
      set -g window-status-last-style "fg=#a9b1d6,bg=default"
      set -g message-command-style bg=default,fg=#a9b1d6
      set -g message-style bg=default,fg=#a9b1d6
      set -g mode-style bg=#9ece6a,fg=#565f89
      set -g pane-active-border-style "fg=#565f89,bg=default"
      set -g pane-border-style 'fg=brightblack,bg=default'

      set -g default-terminal "xterm-kitty"
    '';
    plugins = with pkgs; [
      {
        plugin = tmuxPlugins.sensible;
      }
    ];
  };

}
