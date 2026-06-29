{
  xdg = {
    enable = true;

    desktopEntries.nvim-terminal = {
      name = "Neovim";
      genericName = "Text Editor";
      exec = "kitty -e nvim %F";
      terminal = false;
      type = "Application";
      categories = [ "Utility" "TextEditor" ];
      mimeType = [
        "text/plain"
        "text/x-shellscript"
        "application/x-shellscript"
      ];
    };

    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/plain" = [ "nvim-terminal.desktop" ];
        "text/x-shellscript" = [ "nvim-terminal.desktop" ];
        "application/x-shellscript" = [ "nvim-terminal.desktop" ];
      };
    };
  };
}
