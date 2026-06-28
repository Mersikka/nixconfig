{
  inputs,
  ...
}:

{
  home.username = "mio";
  home.homeDirectory = "/home/mio";

  home.stateVersion = "25.11";

  imports = [
    inputs.catppuccin.homeModules.catppuccin
    inputs.nixvim.homeModules.nixvim
    ./packages.nix
    ./programs
    ./services
  ];

  programs.home-manager.enable = true;
}
