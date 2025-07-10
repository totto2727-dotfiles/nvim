-- https://zenn.dev/kawarimidoll/articles/2b57745045b225

local nvim_lsp = require("lspconfig")
local is_node_dir = function()
  return nvim_lsp.util.root_pattern("package.json")(vim.fn.getcwd())
end

local deno_opts = {}
deno_opts.on_attach = function(client)
  if is_node_dir() then
    client.stop(true)
  end
end
nvim_lsp.denols.setup(deno_opts)

return {}
