{
  pkgs,
  ...
}:

{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    colorschemes.catppuccin.enable = true;
    plugins = {
      lualine.enable = true;
      nix.enable = true;
      cmp = {
        enable = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
          ];
        };
      };

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
        };
      };
    };

    opts = {
      # Line numbers
      number = true;
      relativenumber = true;

      # Enable more colors (24-bit)
      termguicolors = true;

      # Have a better completion experience
      completeopt = [
        "menuone"
        "noselect"
        "noinsert"
      ];

      # Always show the signcolumn, otherwise text would be shifted when displaying error icons
      signcolumn = "yes";

      # Enable mouse
      mouse = "a";

      # Search
      ignorecase = true;
      smartcase = true;

      # Configure how new splits should be opened
      splitright = true;
      splitbelow = true;

      list = true;
      # Note: .__raw here means that this field is raw lua code
      listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;

      # Set encoding
      encoding = "utf-8";
      fileencoding = "utf-8";

      # Save undo history
      undofile = true;
      swapfile = true;
      backup = false;
      autoread = true;

      # Highlight the current line for cursor
      cursorline = true;

      # Show line and column when searching
      ruler = true;

      # Global substitution by default
      gdefault = true;

      # Start scrolling when the cursor is X lines away from the top/bottom
      scrolloff = 5;
    };

    diagnostics = {
      update_in_insert = true;
      severity_sort = true;
      float = {
        border = "rounded";
      };
      jump = {
        severity.__raw = "vim.diagnostic.severity.WARN";
      };
    };

#    userCommands = {
#      Q.command = "q";
#      Q.bang = true;
#      Wq.command = "q";
#      Wq.bang = true;
#      WQ.command = "q";
#      WQ.bang = true;
#      W.command = "q";
#      W.bang = true;
#    };

    globals.mapleader = " ";

    highlight = {
      Comment.fg = "#ff00ff";
      Comment.bg = "#000000";
      Comment.underline = true;
      Comment.bold = true;
    };
  };
}

