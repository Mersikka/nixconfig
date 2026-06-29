{
  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
    };
    settings = {
      theme = {
        name = "catppuccin-mocha";
        iconTheme = "Papirus-Dark";
      };
    };
  };
}
