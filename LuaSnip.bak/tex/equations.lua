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
    -- Set up first snippet, beq -> equation 
    s(
        { -- Table 1: snippet parameters
            trig="beq",
            descr="An snippet to expand beq into an equation in latex",
        },
        {-- Table 2: snippet nodes
            t("\\begin{equation} \\label{"),
            i(1), -- insert node 1
            t("}"),
            t({ -- Using a table for a multiline string
                "",
                "\t"
            }),
            i(2),
            t({
                "",
                "\\end{equation}"
            })
        }
    ),
    s(
        { -- Table 1: snippet parameters
            trig="seq",
            descr="A snippet to create a subequation environment",
        },
        {-- Table 2: snippet nodes
            t("\\begin{subequations} \\label{"),
            i(1), -- insert node 1
            t("}"),
            t({ -- Using a table for a multiline string
                "",
                "\t"
            }),
            i(2),
            t({
                "",
                "\\end{subequations}"
            })
        }
    ),
    s(
        {-- Table 1: snippet parameters
            trig="spl",
            descr="A snippet to create a split environment",
        },
        {-- Table 2: snippet nodes
            t({"\\begin{split}"}, "\t"),
            i(1),
            t({"", "\\end{split}"})
        }
    ),
    s(
        {-- Table 1: snippet parameters
            trig="lr",
            descr="A snippet to create a left right environment",
        },
        {-- Table 2: snippet nodes
            t("\\left"),
            i(1),
            t("\\right"),
        }
    )
}
