{
  config,
  pkgs,
  inputs,
  ...
}:

{
  home.username = "mio";
  home.homeDirectory = "/home/mio";

  home.stateVersion = "25.11";

  programs.kitty.enable = true;
  wayland.windowManager.hyprland.enable = true;

  imports = [
    inputs.vicinae.homeManagerModules.default
    ./programs
    ./services
  ];

  programs.home-manager.enable = true;
}
