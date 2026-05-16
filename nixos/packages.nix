{
  pkgs,
  inputs,
  ...
}:

{
  nixpkgs.config.allowUnfree = true;

  programs = {
    zsh.enable = true;
    hyprland.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    kdePackages.qtsvg
    kdePackages.dolphin
    fastfetch
    nixfmt-tree
    tree
    wget
    geteduroam
    telegram-desktop
    vesktop
    spotify
    firefox
    neovim
    helix
    home-manager
    inputs.helium.packages.x86_64-linux.default
    git
  ];
}
