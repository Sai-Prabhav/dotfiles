local ls = require 'luasnip'
local s = ls.snippet
local f = ls.function_node
local t = ls.text_node
local i = ls.insert_node

-- Uses vimtex to check if the cursor is inside a LaTeX math environment
local function in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
local function one_arg_commands(com, priority)
  priority = priority or 200
  return s({
    trig = com,
    snippetType = 'autosnippet',
    priority = priority,
    dscr = 'Insert \\' .. com .. '{}',
    condition = in_mathzone,
  }, {
    t(' \\' .. com .. '{'),
    i(1),
    t '}',
    i(0),
  })
end
local function sumlike(com, priority)
  priority = priority or 200
  return s({
    trig = com,
    snippetType = 'autosnippet',
    priority = priority,
    dscr = 'Insert \\' .. com .. '^{}_{}',
    condition = in_mathzone,
  }, {
    t('\\' .. com .. '_{'),
    i(1),
    t '}^{',
    i(2),
    t '} ',
    i(0),
  })
end

require('nvim-autopairs').get_rule('('):with_pair(function(opts)
  return not require('luasnip').session.current_nodes[opts.buf]
end)
-- Return a table of snippets
return {
  -- Text-related snippets
  one_arg_commands 'hat',
  one_arg_commands 'norm',
  sumlike('int', 100),
  sumlike('oint', 200),
  sumlike('sum', 200),

  sumlike('lim', 200),

  s({
    trig = '...',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'Insert \\cdots',
    condition = in_mathzone,
  }, {
    t '\\cdots ',
  }),

  s({
    trig = 'xxx',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'Insert \\times',
    condition = in_mathzone,
  }, {
    t '\\times ',
  }),
  s({
    trig = 'par',
    snippetType = 'autosnippet',
    priority = 100,
    dscr = 'Insert \\partial{}',
    condition = in_mathzone,
  }, {
    t '\\partial{',
    i(1),
    t '}',
    i(0),
  }),

  s({
    trig = 'dpar',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\partial{}',
    condition = in_mathzone,
  }, {
    t '\\frac{\\partial{',
    i(1),
    t '}}{\\partial{',
    i(2),
    t '}}',

    i(0),
  }),
  s({
    trig = 'vec',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\vec{}',
    condition = in_mathzone,
  }, {
    t '\\vec{',
    i(1),
    t '}',
    i(0),
  }),
  s({
    trig = 'text',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\text{}',
    condition = in_mathzone,
  }, {
    t '\\text{',
    i(1),
    t '}',
    i(0),
  }),
  s({
    trig = '"',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\text{}',
    condition = in_mathzone,
  }, {
    t '\\text{',
    i(1),
    t '}',
    i(0),
  }),

  -- Math-related snippets
  s({
    trig = '([a-zA-Z][a-zA-Z]*)([0-9]) ', -- Regex trigger
    trigEngine = 'pattern', -- Use pattern-based trigger engine
    regTrig = true, -- Enable regex
    wordTrig = false, -- Disable wordTrig since we're using regex
    snippetType = 'autosnippet',
    priority = 1, -- Set priority
    dscr = 'Auto letter subscript',
    condition = in_mathzone, -- Only trigger in math zones
  }, {
    f(function(_, snip)
      local letter = snip.captures[1] -- Second capture group (letters)
      local subscript = snip.captures[2] -- Third capture group (digits)
      return letter .. '_{' .. subscript .. '} '
    end),
  }),
  s({
    trig = 'ey;',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'unit vector y',
    condition = in_mathzone,
  }, {
    t ' \\hat{e}_{y} ',
    i(0),
  }),
  s({
    trig = 'ez;',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'unit vector z',
    condition = in_mathzone,
  }, {
    t ' \\hat{e}_{z} ',
    i(0),
  }),
  s({
    trig = 'yii',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'x_i',
    condition = in_mathzone,
  }, {
    t ' y_{i} ',
    i(0),
  }),
  s({
    trig = 'yjj',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'y_j',
    condition = in_mathzone,
  }, {
    t ' y_{j} ',
    i(0),
  }),
  s({
    trig = 'xjj',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'x_j',
    condition = in_mathzone,
  }, {
    t ' x_{j} ',
    i(0),
  }),
  s({
    trig = 'xii',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'x_i',
    condition = in_mathzone,
  }, {
    t ' x_{i} ',
    i(0),
  }),

  s({
    trig = 'ex;',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'unit vector x',
    condition = in_mathzone,
  }, {
    t ' \\hat{e}_{x} ',
    i(0),
  }),
  s({
    trig = 'mRR',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = '\\RR^{m}',
    condition = in_mathzone,
  }, {
    t ' \\RR^{m} ',
    i(0),
  }),
  s({
    trig = 'nRR',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = '\\RR^{n}',
    condition = in_mathzone,
  }, {
    t ' \\RR^{n} ',
    i(0),
  }),
  s({
    trig = '+RR',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Positive real numbers',
    condition = in_mathzone,
  }, {
    t ' \\RR^{+} ',
    i(0),
  }),
  s({
    trig = 'RR',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'real numbers',
    condition = in_mathzone,
  }, {
    t ' \\RR ',
    i(0),
  }),
  s({
    trig = '-RR',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Negative real numbers',
    condition = in_mathzone,
  }, {
    t ' \\RR^{-} ',
    i(0),
  }),
  s({
    trig = '+ZZ',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Positive integers',
    condition = in_mathzone,
  }, {
    t '\\ZZ^{+}',
    i(0),
  }),
  s({
    trig = '-ZZ',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Negative integers',
    condition = in_mathzone,
  }, {
    t '\\ZZ^{-}',
    i(0),
  }),
  s({
    trig = 'sr',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Superscript 2',
    condition = in_mathzone,
  }, {
    t '^{2} ',
    i(0),
  }),
  s({
    trig = 'cb',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Superscript 3',
    condition = in_mathzone,
  }, {
    t '^{3} ',
    i(0),
  }),
  s({
    trig = '^',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert superscript',
    condition = in_mathzone,
  }, {
    t '^{',
    i(1),
    t '} ',
    i(0),
  }),
  s({
    trig = '_',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert subscript',
    condition = in_mathzone,
  }, {
    t '_{',
    i(1),
    t '} ',
    i(0),
  }),
  s({
    trig = 'sq',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert square root',
    condition = in_mathzone,
  }, {
    t '\\sqrt{',
    i(1),
    t '}',
    i(0),
  }),
  s({
    trig = '/',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert fraction',
    condition = in_mathzone,
  }, {
    t '\\frac{',
    i(1),
    t '}{',
    i(2),
    t '}',
    i(0),
  }),
  s({
    trig = 'ee',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert e^{}',
    condition = in_mathzone,
  }, {
    t 'e^{',
    i(1),
    t '}',
    i(0),
  }),
  s({
    trig = 'invs',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert inverse superscript',
    condition = in_mathzone,
  }, {
    t '^{-1}',
    i(0),
  }),
  s({
    trig = 'conj',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert conjugate superscript',
    condition = in_mathzone,
  }, {
    t '^{*}',
    i(0),
  }),
  s({
    trig = 'mk',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert math mode',
  }, {
    t '\\(',
    i(1),
    t '\\)',
    i(0),
  }),
  s({
    trig = 'dm',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert math mode',
  }, {
    t { '\\[', '    ' },
    i(1),
    t { '', '\\]' },
    i(0),
  }),

  -- Formatting-related snippets
  s({
    trig = 'bf',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert \\mathbf{}',
    condition = in_mathzone,
  }, {
    t '\\mathbf{',
    i(1),
    t '}',
    i(0),
  }),
  s({
    trig = 'bb',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert \\mathbb{}',
    condition = in_mathzone,
  }, {
    t '\\mathbb{',
    i(1),
    t '}',
    i(0),
  }),
  s({
    trig = 'cal',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert \\mathcal{}',
    condition = in_mathzone,
  }, {
    t '\\mathcal{',
    i(1),
    t '}',
    i(0),
  }),
  s({
    trig = 'rm',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert \\mathrm{}',
    condition = in_mathzone,
  }, {
    t '\\mathrm{',
    i(1),
    t '}',
    i(0),
  }),

  -- Left-right delimiters snippets
  s({
    trig = 'lr[]',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\left[ ... \\right]',
    condition = in_mathzone,
  }, {
    t '\\left[ ',
    i(1),
    t ' \\right] ',
    i(0),
  }),
  s({
    trig = 'lr<',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\left< ... \\right>',
    condition = in_mathzone,
  }, {
    t '\\left< ',
    i(1),
    t ' \\right> ',
    i(0),
  }),
  s({
    trig = 'lr()',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\left( ... \\right)',
    condition = in_mathzone,
  }, {
    t '\\left( ',
    i(1),
    t ' \\right) ',
    i(0),
  }),
  s({
    trig = 'lr{}',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\left{ ... \\right}',
    condition = in_mathzone,
  }, {
    t '\\left\\{ ',
    i(1),
    t ' \\right\\} ',
    i(0),
  }),

  s({
    trig = 'lr|',
    snippetType = 'autosnippet',
    priority = 200,
    dscr = 'Insert \\left| ... \\right|',
    condition = in_mathzone,
  }, {
    t '\\left| ',
    i(1),
    t ' \\right| ',
    i(0),
  }),

  s({
    trig = 'lrc',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert \\left \\lceil ... \\right \\rceil',
    condition = in_mathzone,
  }, {
    t '\\left\\lceil ',
    i(1),
    t ' \\right\\rceil ',
    i(0),
  }),

  s({

    trig = 'lrf',
    snippetType = 'autosnippet',
    priority = 50,
    dscr = 'Insert \\left \\lfloor ... \\right \\rfloor',
    condition = in_mathzone,
  }, {
    t '\\left\\lfloor ',
    i(1),
    t ' (\right\\rfloor ',
    i(0),
  }),
}
