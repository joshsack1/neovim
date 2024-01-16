local ls = require"luasnip"
ls.config.set_config {
    vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true}),
    vim.keymap.set({"i", "s"}, "<Tab>", function() ls.jump( 1) end, {silent = true}),
    vim.keymap.set({"i", "s"}, "<S-Tab>", function() ls.jump(-1) end, {silent = true}),
}

require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})
