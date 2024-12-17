{
  programs.nixvim.plugins= {
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
	keymaps = { 
	    silent = true; 
	    diagnostic = { 
	        "<leader>k" = "goto_prev"; 
		"<leader>j" = "goto_next"; 
	    };
	    lspBuf = { 
	    	gd = "definitions"; 
		gD = "references"; 
		gt = "type_definition"; 
		gi = "implementation"; 
		K = "hover"; 
		"<F2>" = "rename"; 
	    };
	}; 
	servers = { 
	    lua_ls.enable = true; 
	    vtsls.enable = true; 
	    biome.enable = true; 
	    gopls.enable = true; 
	    golangci_lint_ls.enable = true; 
	    pyright.enable = true; 
	    pylsp.enable = true; 
	    ruff.enable = true; 
	}; 
    };
    conform-nvim = { 
        enable = true; 
	settings = { 
	    formatters_by_ft = { 
	    	lua = [ "stylua" ]; 
		go = [ "goimports" "gofumpt" "goimports-reviser" "golines" ]; 
		typescriptreact = [ "biome-check" ]; 
		javascript = [ "biome-check" ]; 
		python = [ "ruff_format" ]; 
		cpp = [ "clang-format" ]; 
		cmake = [ "cmake_format" ]; 
		"_" = [ 
		    "squeeze_blanks"
		    "trim_whitespace" 
		    "trim_newlines"
		];
	    }; 
	    format_on_save = # Lua
                ''
                    function(bufnr)
                        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                            return
                        end

                        if slow_format_filetypes[vim.bo[bufnr].filetype] then
                            return
                        end

                        local function on_format(err)
                            if err and err:match("timeout$") then
                                slow_format_filetypes[vim.bo[bufnr].filetype] = true
                            end
                        end

                        return { timeout_ms = 200, lsp_fallback = true }, on_format
                     end
               '';
	    format_after_save = # Lua
	      ''
		function(bufnr)
		  if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
		    return
		  end

		  if not slow_format_filetypes[vim.bo[bufnr].filetype] then
		    return
		  end

		  return { lsp_fallback = true }
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
