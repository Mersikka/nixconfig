{ pkgs, ... }:

{
  users.users.mio = {
    isNormalUser = true;
    description = "Mio Argillander";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
