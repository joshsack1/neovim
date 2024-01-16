-- Set up shorthand
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
-- Set up Snippet table for equation things 
return {
    s(
        {-- Table 1: snippet parameters
            trig = "env",
            descr = "Create generalized environment",
        },
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1), -- this node repeeats itse
            }
        )
    ),
}
