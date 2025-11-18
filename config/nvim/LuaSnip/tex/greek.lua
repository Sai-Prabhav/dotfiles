local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node


return {
	s({ trig = "@a", wordTrig = true, snippetType = "autosnippet" }, t("\\alpha")),
	s({ trig = "@b", wordTrig = true, snippetType = "autosnippet" }, t("\\beta")),
	s({ trig = "@g", wordTrig = true, snippetType = "autosnippet" }, t("\\gamma")),
	s({ trig = "@d", wordTrig = true, snippetType = "autosnippet" }, t("\\delta")),
	s({ trig = "@e", wordTrig = true, snippetType = "autosnippet" }, t("\\epsilon")),
	s({ trig = "@z", wordTrig = true, snippetType = "autosnippet" }, t("\\zeta")),
	s({ trig = "@h", wordTrig = true, snippetType = "autosnippet" }, t("\\eta")),
	s({ trig = "@t", wordTrig = true, snippetType = "autosnippet" }, t("\\theta")),
	s({ trig = "@i", wordTrig = true, snippetType = "autosnippet" }, t("\\iota")),
	s({ trig = "@k", wordTrig = true, snippetType = "autosnippet" }, t("\\kappa")),
	s({ trig = "@l", wordTrig = true, snippetType = "autosnippet" }, t("\\lambda")),
	s({ trig = "@m", wordTrig = true, snippetType = "autosnippet" }, t("\\mu")),
	s({ trig = "@n", wordTrig = true, snippetType = "autosnippet" }, t("\\nu")),
	s({ trig = "@x", wordTrig = true, snippetType = "autosnippet" }, t("\\xi")),
	s({ trig = "@p", wordTrig = true, snippetType = "autosnippet" }, t("\\pi")),
	s({ trig = "@r", wordTrig = true, snippetType = "autosnippet" }, t("\\rho")),
	s({ trig = "@s", wordTrig = true, snippetType = "autosnippet" }, t("\\sigma")),
	s({ trig = "@u", wordTrig = true, snippetType = "autosnippet" }, t("\\tau")),
	s({ trig = "@f", wordTrig = true, snippetType = "autosnippet" }, t("\\phi")),
	s({ trig = "@c", wordTrig = true, snippetType = "autosnippet" }, t("\\chi")),
	s({ trig = "@y", wordTrig = true, snippetType = "autosnippet" }, t("\\psi")),
	s({ trig = "@w", wordTrig = true, snippetType = "autosnippet" }, t("\\omega")),

	-- uppercase
	s({ trig = "@G", wordTrig = true, snippetType = "autosnippet" }, t("\\Gamma")),
	s({ trig = "@D", wordTrig = true, snippetType = "autosnippet" }, t("\\Delta")),
	s({ trig = "@T", wordTrig = true, snippetType = "autosnippet" }, t("\\Theta")),
	s({ trig = "@L", wordTrig = true, snippetType = "autosnippet" }, t("\\Lambda")),
	s({ trig = "@X", wordTrig = true, snippetType = "autosnippet" }, t("\\Xi")),
	s({ trig = "@P", wordTrig = true, snippetType = "autosnippet" }, t("\\Pi")),
	s({ trig = "@S", wordTrig = true, snippetType = "autosnippet" }, t("\\Sigma")),
	s({ trig = "@F", wordTrig = true, snippetType = "autosnippet" }, t("\\Phi")),
	s({ trig = "@Y", wordTrig = true, snippetType = "autosnippet" }, t("\\Psi")),
	s({ trig = "@W", wordTrig = true, snippetType = "autosnippet" }, t("\\Omega")),
}
