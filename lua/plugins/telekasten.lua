return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      home = vim.fn.expand("~/zettelkasten"),
      template_new_daily = vim.fn.expand("~/zettelkasten/template/daily.md"),
    },
  },
}
