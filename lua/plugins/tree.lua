return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
  config = function()
    -- netrw 완전 끄기
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- 디렉토리 열면 자동으로 Neo-tree 실행
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        -- 파일이 디렉토리면 네오트리 열기
        local directory = vim.fn.isdirectory(data.file) == 1
        if directory then
          -- 현재 버퍼를 삭제하고 네오트리로 교체
          vim.cmd("enew") -- 빈 버퍼 하나 새로 열고
          vim.cmd("bwipeout #") -- 이전 버퍼 지우기
          require("neo-tree.command").execute({ dir = data.file, reveal = true })
        end
      end,
    })
  end
}
