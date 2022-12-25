local semantic_tokens = {
	["@function"] = { fg = C.base.blue },
	["@method"] = { fg = C.base.green },
	["@readonly"] = { fg = C.base.magenta },
	["@local"] = { fg = C.base.white },
	["@modifier"] = { fg = C.base.red, italic = true },
	["@namespace"] = { fg = C.base.red, italic = true },
	["@interface"] = { fg = C.base.cyan, italic = true },
}

return semantic_tokens
