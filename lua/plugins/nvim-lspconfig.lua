local nvim_lsp = require("lspconfig")

local function has_multi_layer_extension(extensions)
  local full_path = vim.fn.bufname("%")

  if not full_path or full_path == "" then
    return false
  end

  for _, extention in ipairs(extensions) do
    if full_path:sub(-#extention) == extention then
      return true
    end
  end

  return false
end

local function root_pattern(filename)
  return nvim_lsp.util.root_pattern(filename)(vim.fn.getcwd())
end

local function should_enable_deno()
  return has_multi_layer_extension({ ".deno.ts", ".deno.tsx" }) or not root_pattern("package.json")
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    -- make sure mason installs the server
    servers = {
      denols = {
        enabled = should_enable_deno(),
      },
      ts_ls = {
        enabled = not should_enable_deno(),
      },
    },
  },
}
