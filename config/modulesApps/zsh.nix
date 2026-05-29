{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.zsh;

  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    shellInit = ''
      # Alias keren
      alias ls="eza --icons --group-directories-first"
      alias ll="eza -lah --icons"
      alias la="eza -a --icons"
      alias cat="bat"
      alias grep="rg"

      # Fastfetch hanya untuk interactive shell
      if [[ -o interactive ]]; then
        fastfetch
      fi
    '';
  };

  programs.starship = {
    enable = true;

    settings = {
      add_newline = true;

      format = "$username$hostname$directory$git_branch$git_status$cmd_duration$line_break$character";

      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[✗](bold red)";
      };

      directory = {
        style = "bold cyan";
        truncation_length = 3;
      };

      git_branch = {
        symbol = " ";
        style = "bold purple";
      };

      git_status = {
        style = "bold yellow";
      };

      cmd_duration = {
        style = "bold green";
      };

      username = {
        style_user = "bold blue";
        show_always = true;
      };

      hostname = {
        style = "bold dimmed white";
      };
    };
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages = with pkgs; [
    starship
    fzf
    bat
    eza
    ripgrep
    fd
    jq
    fastfetch
  ];
}
