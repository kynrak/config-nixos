{
  programs.nixvim.plugins = {
    # General
    web-devicons.enable = true;
    which-key.enable = true;
    indent-blankline.enable = true;

    # Editting
    comment.enable = true;
    todo-comments.enable = true;
    nvim-autopairs.enable = true;
    nvim-surround.enable = true;
    lsp = {
      enable = true;
      servers = {
        lua_ls.enable = true;
        vtsls.enable = true;
        biome.enable = true;
        gopls.enable = true;
        golangci_lint_ls.enable = true;
        pyright.enable = false;
        pylsp.enable = false;
        ruff.enable = true;
        nixd.enable = true;
      };
      keymaps = {
        diagnostic = {
          "[d" = {
            action = "goto_prev";
            desc = "Go to prev diagnostic";
          };
          "]d" = {
            action = "goto_next";
            desc = "Go to next diagnostic";
          };
          "<leader>cd" = {
            action = "open_float";
            desc = "Show Line Diagnostics";
          };
        };

        lspBuf = {
          "<leader>ca" = {
            action = "code_action";
            desc = "Code Actions";
          };
          "<leader>rn" = {
            action = "rename";
            desc = "Rename Symbol";
          };
          "<leader>f" = {
            action = "format";
            desc = "Format";
          };
          "gd" = {
            action = "definition";
            desc = "Goto definition (assignment)";
          };
          "gD" = {
            action = "declaration";
            desc = "Goto declaration (first occurrence)";
          };
          "gy" = {
            action = "type_definition";
            desc = "Goto Type Defition";
          };
          "gi" = {
            action = "implementation";
            desc = "Goto Implementation";
          };
          "<leader>K" = {
            action = "hover";
            desc = "Hover";
          };
          "<leader>sh" = {
            action = "signature_help";
            desc = "Signature Help";
          };
          "<leader>gr" = {
            action = "references";
            desc = "References to thing";
          };
          "<leader>vws" = {
            action = "workspace_symbol";
            desc = "Workspace symbol";
          };
        };
      };
    };
    conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          lua = ["stylua"];
          go = ["goimports" "gofumpt" "goimports-reviser" "golines"];
          typescriptreact = ["biome-check"];
          javascript = ["biome-check"];
          python = ["ruff_format"];
          cpp = ["clang-format"];
          cmake = ["cmake_format"];
          nix = ["alejandra"];
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };
        format_on_save =
          # Lua
          ''
            function(bufnr)
                return { timeout_ms = 200, lsp_fallback = true }, on_format
             end
          '';
        log_level = "warn";
        notify_on_error = true;
        notify_no_formatters = true;
      };
    };
    treesitter = {
      enable = true;
      nixvimInjections = true;
      folding = true;
      settings = {
        indent.enable = true;
        highlight.enable = true;
        auto_install = true;
      };
    };
    treesitter-refactor = {
      enable = true;
      highlightDefinitions = {
        enable = true;
        clearOnCursorMove = false;
      };
    };
    hmts.enable = true;

    # Navigation
    oil = {
      enable = true;
      settings = {
        skip_confirm_for_simple_edits = true;
        default_file_explorer = true;
        delete_to_trash = true;
        view_options = {
          show_hidden = true;
          natural_order = true;
        };
        win_options = {
          wrap = true;
          winblend = 0;
        };
        keymaps = {
          "<C-c>" = false;
          "q" = "actions.close";
        };
      };
    };
    telescope.enable = true;

    # Git
    gitsigns.enable = true;
    gitblame.enable = true;
    lazygit.enable = true;

    # Nix
    nix.enable = true;
  };
}
