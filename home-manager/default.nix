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

  wayland.windowManager.hyprland.enable = true;

  imports = [
    inputs.vicinae.homeManagerModules.default
    inputs.catppuccin.homeModules.catppuccin
    inputs.nixvim.homeModules.nixvim
    ./programs
    ./services
  ];

  programs.home-manager.enable = true;
}
