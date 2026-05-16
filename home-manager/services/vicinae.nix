{
  services.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true;
      environment = {
        USE_LAYER_SHELL = 1;
      };
    };
    settings = {
      theme = {
        name = "catppuccin-mocha";
        iconTheme = "Papirus-Dark";
      };
    };
  };
}
