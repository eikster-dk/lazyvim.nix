-- customize mason plugins
local suggested_packages = {}

local disable_auto_install = function(_, opts)
  local data_dir = vim.fn.stdpath("data")
  for _, v in pairs(opts.ensure_installed or {}) do
    vim.notify(string.format("%s: %s", key, vim.inspect(value)))
    table.insert(suggested_packages, v)
  end

  local f = io.open(data_dir .. "/suggested-pkgs.json", "w")
  f:write(vim.fn.json_encode(suggested_packages))
  f:close()

  opts.ensure_installed = {}
end

return {
  -- use mason-lspconfig to configure LSP installations
  {
    "williamboman/mason-lspconfig.nvim",
    -- overrides `require("mason-lspconfig").setup(...)`
    opts = disable_auto_install,
  },
  -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
  {
    "jay-babu/mason-null-ls.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    opts = disable_auto_install,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    -- overrides `require("mason-nvim-dap").setup(...)`
    opts = disable_auto_install,
  },
}
