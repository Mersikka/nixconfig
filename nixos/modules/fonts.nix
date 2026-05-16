{
  pkgs,
  ...
}:

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    geist-font
    font-awesome
    font-awesome_5
  ];
}
