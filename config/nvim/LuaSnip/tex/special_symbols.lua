local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node -- Import the function node
local i = ls.insert_node
local fmta = require('luasnip.extras.fmt').fmta

local function in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {
  s({
    trig = '->',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\to',
    condition = in_mathzone,
  }, {
    t ' \\to ',
  }),
  s({
    trig = '=>',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\implies',
    condition = in_mathzone,
  }, {
    t ' \\implies ',
  }),
  s({
    trig = '=<',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\impliedby',
    condition = in_mathzone,
  }, {
    t ' \\impliedby ',
  }),
  s({
    trig = '>=',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\geq',
    condition = in_mathzone,
  }, {
    t ' \\geq ',
  }),
  s({
    trig = '<=',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\leq',
    condition = in_mathzone,
  }, {
    t ' \\leq ',
  }),
  s({
    trig = '!>',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\mapsto',
    condition = in_mathzone,
  }, {
    t ' \\mapsto ',
  }),
  s({
    trig = '<>',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\leftrightarrow',
    condition = in_mathzone,
  }, {
    t ' \\leftrightarrow ',
  }),
}
