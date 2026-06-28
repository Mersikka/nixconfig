{
  pkgs,
  pkgs-unstable,
  inputs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };


  programs = {
    zsh.enable = true;
    #uwsm.enable = true;
    hyprland = {
      enable = true;

      package = pkgs-unstable.hyprland;
      portalPackage = pkgs-unstable.xdg-desktop-portal-hyprland;

      #withUWSM = true;
      xwayland.enable = true;
    };
  };

  services.displayManager.ly = {
    enable = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  environment.systemPackages = with pkgs; [
    xdg-utils
    alsa-utils
    home-manager
    bluez # Bluetooth support
    bluez-tools # Bluetooth tools
  ];
}
