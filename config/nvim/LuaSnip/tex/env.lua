local ls = require 'luasnip'
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

return {
  s({
    trig = 'clm;',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'claim evironment',
  }, {
    t '\\begin{claim}[',
    i(1),
    t { ']', '' },
    i(2),
    t { '', '\\end{claim}' },
  }),
  s({
    trig = 'axm;',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'axiom evironment',
  }, {
    t '\\begin{axiom}[',
    i(1),
    t { ']', '' },
    i(2),
    t { '', '\\end{axiom}' },
  }),
  s({
    trig = 'exmp;',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'exmp evironment',
  }, {
    t '\\begin{example}[',
    i(1),
    t { ']', '' },
    i(2),
    t { '', '\\end{example}' },
  }),
  s({
    trig = 'cor;',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'corollary evironment',
  }, {
    t '\\begin{corollary}[',
    i(1),
    t { ']', '' },
    i(2),
    t { '', '\\end{corallary}' },
  }),
  s({
    trig = 'thm;',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'theorem evironment',
  }, {
    t '\\begin{theorem}[',
    i(1),
    t { ']', '' },
    i(2),
    t { '', '\\end{theorem}' },
  }),
  s({
    trig = 'def;',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'definition evironment',
  }, {
    t '\\begin{definition}[',
    i(1),
    t { ']', '' },
    i(2),
    t { '', '\\end{definition}' },
  }),
  s({
    trig = 'rmk;',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'Remark evironment',
  }, {
    t '\\begin{remark}[',
    i(1),
    t { ']', '' },
    i(2),
    t { '', '\\end{remark}' },
  }),
}
