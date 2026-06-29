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
      noice.enable = true;
      notify.enable = true;

      web-devicons.enable = true;

      which-key = {
        enable = true;
      };

      treesitter = {
        enable = true;
        settings = {
          highlight.enable = true;
          indent.enable = true;
        };
      };


      telescope = {
        enable = true;

        extensions = {
          fzf-native = {
            enable = true;  # fast sorter
          };
          file-browser = {
            enable = true;
          };
        };

        settings = {
          defaults = {
            layout_strategy = "horizontal";
            layout_config = {
              width = 0.9;
              height = 0.85;
              preview_width = 0.55;
            };

            file_ignore_patterns = [
              "node_modules"
              ".git/"
              "dist/"
              "build/"
            ];

            sorting_strategy = "ascending";
            prompt_prefix = " ";
            selection_caret = "➤ ";

            mappings = {
              i = {
                "<C-j>" = "move_selection_next";
                "<C-k>" = "move_selection_previous";
                "<C-q>" = "send_to_qflist";
              };
            };
          };
        };

        keymaps = {
          "<leader>ff" = "find_files";
          "<leader>fg" = "live_grep";
          "<leader>fb" = "buffers";
          "<leader>fh" = "help_tags";

          # Useful extras
          "<leader>fr" = "oldfiles";
          "<leader>fc" = "commands";
          "<leader>fk" = "keymaps";
          "<leader>fs" = "lsp_document_symbols";

          "<leader>gs" = "git_status";
          "<leader>gc" = "git_commits";
          "<leader>gb" = "git_branches";

          # File browser extension
          "<leader>fe" = "file_browser";
        };
      };

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
        
        capabilities = ''
          capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
        '';

        servers = {
          nixd.enable = true;
          pyrefly = {
            enable = true;
            cmd = [ "pyrefly" "lsp" ];
            filetypes = [ "python" ];
            rootMarkers = [
              "pyrefly.toml"
              "pyproject.toml"
              "setup.py"
              "setup.cfg"
              "requirements.txt"
              ".git"
            ];
          };
        };

        keymaps = {
          silent = true;
          lspBuf = {
            gd = "definition";
            K = "hover";
            gD = "declaration";
            gi = "implementation";
            gr = "references";
            gt = "type_definition";
            "<leader>rn" = "rename";
            "<leader>ca" = "code_action";
          };

          diagnostic = {
            "[d" = "goto_prev";
            "]d" = "goto_next";
            "<leader>e" = "open_float";
          };
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

    diagnostic.settings = {
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

