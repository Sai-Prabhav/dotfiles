local ls = require 'luasnip'
local s = ls.snippet
local t = ls.text_node
local f = ls.function_node -- Import the function node

-- Uses vimtex to check if the cursor is inside a LaTeX math environment
local function in_mathzone()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
local function concat_arrays(t1, t2)
  local result = {}
  for i = 1, #t1 do
    result[i] = t1[i]
  end
  for i = 1, #t2 do
    result[#t1 + i] = t2[i]
  end
  return result
end

local function add_snippets(list, prefix, description_label)
  local out = {}
  for _, name in ipairs(list) do
    table.insert(
      out,
      s({
        trig = '([^\\a-zA-Z])' .. prefix .. name .. '([^a-zA-Z])', -- Capture prefix and suffix

        regTrig = true, -- Enable regex
        wordTrig = false, -- Disable wordTrig since we're using regex
        snippetType = 'autosnippet',

        dscr = description_label .. ': \\' .. name,
        condition = in_mathzone,
      }, {
        f(function(_, snip)
          return snip.captures[1] .. '\\' .. name .. snip.captures[2]
        end),
      })
    )
  end
  return out
end
-- Greek letters used frequently in mathematical notation
local greek = {
  'alpha',
  'beta',
  'gamma',
  'Gamma',
  'delta',
  'Delta',
  'epsilon',
  'varepsilon',
  'zeta',
  'eta',
  'theta',
  'vartheta',
  'Theta',
  'iota',
  'kappa',
  'lambda',
  'Lambda',
  'mu',
  'nu',
  'xi',
  'omicron',
  'pi',
  'rho',
  'varrho',
  'sigma',
  'Sigma',
  'tau',
  'upsilon',
  'Upsilon',
  'phi',
  'varphi',
  'Phi',
  'chi',
  'psi',
  'omega',
  'Omega',
}

-- Common math symbols (binary operators, logic, set theory, etc.)
local symbols = {
  'gra',
  'pmod',
  'mid',
  'nmid',
  'parallel',
  'perp',
  'partial',
  'nabla',
  'hbar',
  'ell',
  'infty',
  'oplus',
  'ominus',
  'otimes',
  'oslash',
  'square',
  'star',
  'dagger',
  'vee',
  'wedge',
  'subseteq',
  'subset',
  'supseteq',
  'supset',
  'emptyset',
  'exists',
  'nexists',
  'forall',
  'implies',
  'impliedby',
  'iff',
  'setminus',
  'neg',
  'lor',
  'land',
  'bigcup',
  'bigcap',
  'cdot',
  'times',
  'simeq',
  'approx',
  'peq',
  'fa',
  'RR',
  'CC',
  'not',
  'notin',
  'gcd',
  'NN',
  'where',
  'disc',
  'mat',
  'if',
  'or',
  'so',
  'then',
  'st',
  're',
  'im',
  'exp',
  'log',
  'ln',
}

-- Extended set of math symbols and operators
local more_symbols = {
  'leq',
  'geq',
  'neq',
  'gg',
  'll',
  'equiv',
  'sim',
  'propto',
  'rightarrow',
  'leftarrow',
  'Rightarrow',
  'Leftarrow',
  'leftrightarrow',
  'to',
  'mapsto',
  'cap',
  'cup',
  'in',
  'sum',
  'prod',
  'exp',
  'ln',
  'log',
  'det',
  'dots',
  'vdots',
  'ddots',
  'pm',
  'mp',
  'int',
  'iint',
  'iiint',
  'oint',
}
require('nvim-autopairs').get_rule('('):with_pair(function(opts)
  return not require('luasnip').session.current_nodes[opts.buf]
end)
-- Combine and return all snippet groups with descriptive labels

return concat_arrays(
  add_snippets(symbols, '', 'Symbol'),
  concat_arrays(add_snippets(more_symbols, '', 'Extended symbol'), add_snippets(greek, '', 'Greek letter'))
)
