return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- 아이콘용 (선택사항)
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "catppuccin", -- 현재 colorscheme에 따라 자동 테마
        icons_enabled = true,
        section_separators = { left = "", right = "" },
        component_separators = "|",
        globalstatus = true, -- nvim 0.7 이상에서 전체 창에 상태줄 공유
      },
    })
  end,
}

