{ config, lib, ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      directory = {
        truncation_length = 0;
        truncate_to_repo = false;
      };

      character = {
        success_symbol = ">";
        error_symbol = ">";
      };

      hostname = {
        ssh_symbol = " ";
      };

      git_branch = {
        symbol = " ";
      };

      python = {
        symbol = " ";
      };

      nix_shell = {
        symbol = "󱄅 ";
      };

      format = lib.concatStrings [
        "$hostname"
        "$directory"
        "$git_branch"
        "$git_status"
        "$python"
        "$line_break"
        "$character"
      ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableZshIntegration = true;
    silent = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    initContent = ''
      bindkey -e
    '';

    shellAliases = {
      vi = "nvim";
      cd = "z";
      ls = "eza -s type -1";
      ll = "eza -alh";
      tree = "eza --tree";
      tt = "~/.config/tmux/script.sh";

    };
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };
}
