{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;
  };
}

