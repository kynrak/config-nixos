{
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    # Keymaps
    keymaps = [
      # Move to window using <ctrl> hjkl keys
      {
        action = "<C-w>h";
        key = "<C-h>";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Go to Left Window";
        };
      }
      {
        action = "<C-w>j";
        key = "<C-j>";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Go to Lower Window";
        };
      }
      {
        action = "<C-w>k";
        key = "<C-k>";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Go to Upper Window";
        };
      }
      {
        action = "<C-w>l";
        key = "<C-l>";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Go to Right Window";
        };
      }
      # Clear search with <esc>
      {
        action = "<cmd>noh<cr><esc>";
        key = "<esc>";
        mode = ["n" "i"];
        options = {
          silent = true;
          desc = "Escape and Clear hlsearch";
        };
      }
      # Save file
      {
        action = "<cmd>w<cr><esc>";
        key = "<C-s>";
        mode = ["n" "i" "x" "s"];
        options = {
          silent = true;
          desc = "Save File";
        };
      }
      # Better Indent
      {
        action = "<gv";
        key = "<";
        mode = "v";
        options = {
          silent = true;
          desc = "Indent Left";
        };
      }
      {
        action = ">gv";
        key = ">";
        mode = "v";
        options = {
          silent = true;
          desc = "Indent Right";
        };
      }
      # Better Quit
      {
        action = "<cmd>qa<cr>";
        key = "<leader>qq";
        mode = "n";
        options = {
          silent = true;
          desc = "Quit All";
        };
      }
      # Exit terminal interface
      {
        action = "<c-\\><c-n>";
        key = ";t";
        mode = "t";
        options = {
          silent = true;
          desc = "Enter normal mode";
        };
      }
      # Windows
      {
        action = "<C-W>p";
        key = "<leader>ww";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Other Window";
        };
      }
      {
        action = "<C-W>c";
        key = "<leader>wd";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Delete Window";
        };
      }
      {
        action = "<C-W>s";
        key = "<leader>-";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Split Window Below";
        };
      }
      {
        action = "<C-W>v";
        key = "<leader>|";
        mode = "n";
        options = {
          silent = true;
          noremap = false;
          desc = "Split Window Right";
        };
      }
      # Better Movements
      {
        action = "<esc>";
        key = "jj";
        mode = "i";
        options = {
          silent = true;
          desc = "Exit insert mode";
        };
      }
      # oil mapping for file tree
      {
        action = ":Oil<CR>";
        key = ";e";
        options = {
          silent = true;
          noremap = true;
          desc = "Oil Mapping";
        };
      }
      # Go to definition
      {
        action = "<Cmd>vim.lsp.buf.definition()<CR>";
        key = "<leader>gd";
        options = {
          silent = true;
          noremap = true;
          desc = "Go to definition";
        };
      }
      # Go to references
      {
        action = "<Cmd>vim.lsp.buf.references()<CR>";
        key = "<leader>gr";
        options = {
          silent = true;
          noremap = true;
          desc = "Go to references";
        };
      }
      # lazy git dashboard
      {
        action = ":LazyGit<CR>";
        key = "<leader>gg";
        options = {
          silent = true;
          noremap = true;
          desc = "Open lazygit";
        };
      }
      # Telescope search (live grep)
      {
        action = ":Telescope live_grep<CR>";
        key = "<leader>fg";
        options = {
          silent = true;
          noremap = true;
          desc = "Search grep";
        };
      }
      # Telescope search buffers
      {
        action = ":Telescope buffers<CR>";
        key = "<leader>fb";
        options = {
          silent = true;
          noremap = true;
          desc = "Search buffers";
        };
      }
      # Telescope buffer
      {
        action = ":Telescope current_buffer_fuzzy_find<CR>";
        key = "<leader>b";
        options = {
          silent = true;
          noremap = true;
          desc = "Search current buffer";
        };
      }
      # Telescope search files
      {
        action = ":Telescope find_files<CR>";
        key = "<leader>ff";
        options = {
          silent = true;
          noremap = true;
          desc = "Search files";
        };
      }
      # Telescope diagnostics
      {
        action = ":Telescope diagnostics<CR>";
        key = "<leader>fd";
        options = {
          silent = true;
          noremap = true;
          desc = "Diagnostics";
        };
      }
      # Telescope quickfixlist
      {
        action = ":Telescope quickfix<CR>";
        key = "<leader>fq";
        options = {
          silent = true;
          noremap = true;
          desc = "Quickfix list";
        };
      }
      # Telescope undo tree
      {
        action = ":Telescope undo<CR>";
        key = "<leader>fu";
        options = {
          silent = true;
          noremap = true;
          desc = "Undo tree";
        };
      }
      # Diffview open comparing in git
      {
        action = ":DiffviewOpen<CR>";
        key = "<leader>do";
        options = {
          silent = true;
          noremap = true;
          desc = "Diffview open";
        };
      }
      # Diffview close comparing in git
      {
        action = ":DiffviewClose<CR>";
        key = "<leader>dp";
        options = {
          silent = true;
          noremap = true;
          desc = "Diffview close";
        };
      }
    ];
  };
}
