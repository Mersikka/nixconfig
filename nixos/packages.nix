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
    alsa-utils
    inputs.rose-pine-hyprcursor.packages.${pkgs.system}.default
    bitwarden-desktop
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
    helix
    home-manager
    inputs.helium.packages.x86_64-linux.default
    git
    brightnessctl
    pavucontrol # PulseAudio Volume Control
    pamixer # Command-line mixer for PulseAudio
    bluez # Bluetooth support
    bluez-tools # Bluetooth tools
  ];
}
