-- plugins/lsp.lua
return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- LSP diagnostic UI 설정
      vim.diagnostic.config({
        virtual_text = true,
        underline = true,
        signs = true,
        update_in_insert = false,
      })

      -- pyright만 연결
      require("lspconfig").pyright.setup({
        on_attach = function(client, bufnr)
          -- 여기에 on_attach 설정을 추가할 수도 있어요.
          print("Pyright LSP server attached!")
        end,
      })
    end,
  },
}

