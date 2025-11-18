local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

-- Ensure autosnippets are enabled globally
ls.config.set_config({
    enable_autosnippets = true,
})


require("nvim-autopairs").get_rule("(")
    :with_pair(function(opts)
        return not opts.line:match("\\left%($")
    end)
