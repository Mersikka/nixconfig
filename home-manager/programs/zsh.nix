{
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      plugins = [
        "sudo"
      ];
    };
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history.size = 10000;

    sessionVariables = {
      SSH_AUTH_SOCK = "$HOME/.bitwarden-ssh-agent.sock";
    };
  };
}

