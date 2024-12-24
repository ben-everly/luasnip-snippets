local ls = require 'luasnip'
local fmt = require 'luasnip.extras.fmt'.fmt

return {
	ls.snippet('class', fmt(
		[[
			<?php

			namespace {};

			class {}{}
			{{
				{}
			}}
		]],
		{
			ls.function_node(require 'luasnip-snippets.php-helpers'.getNamespaceForFile),
			ls.function_node(require 'luasnip-snippets.php-helpers'.getClassnameForFile),
			ls.choice_node(1, {
				ls.text_node(''),
				ls.snippet_node(nil, {
					ls.text_node(' extends '),
					ls.insert_node(1),
				}),
				ls.snippet_node(nil, {
					ls.text_node(' implements '),
					ls.insert_node(1),
				}),
			}),
			ls.insert_node(0),
		}
	)),
	ls.snippet('public', fmt(
		[[
			public function {}({}) : {}
			{{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'name'),
			ls.insert_node(2, 'int $param'),
			ls.insert_node(3, 'void'),
			ls.insert_node(0, 'return'),
		}
	)),
	ls.snippet('protected', fmt(
		[[
			protected function {}({}) : {}
			{{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'name'),
			ls.insert_node(2, 'int $param'),
			ls.insert_node(3, 'void'),
			ls.insert_node(0, 'return'),
		}
	)),
	ls.snippet('private', fmt(
		[[
			private function {}({}) : {}
			{{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'name'),
			ls.insert_node(2, 'int $param'),
			ls.insert_node(3, 'void'),
			ls.insert_node(0, 'return'),
		}
	)),
	ls.snippet('function', fmt(
		[[
			function ({}) : {}
			{{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'int $param'),
			ls.insert_node(2, 'void'),
			ls.insert_node(0, 'return'),
		}
	)),
	ls.snippet('fn', fmt(
		[[
			fn ({}) : {} => {};
		]],
		{
			ls.insert_node(1, 'int $param'),
			ls.insert_node(2, 'void'),
			ls.insert_node(0, ''),
		}
	)),
	ls.snippet('if', fmt(
		[[
			if (${}) {{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'cond'),
			ls.insert_node(0, ''),
		}
	)),
	ls.snippet('foreach', fmt(
		[[
			foreach (${} as ${} => ${}) {{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'array'),
			ls.insert_node(2, 'key'),
			ls.insert_node(3, 'value'),
			ls.insert_node(0, ''),
		}
	)),
	ls.snippet('for', fmt(
		[[
			for (${}; ${}; ${}) {{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'init'),
			ls.insert_node(2, 'cond'),
			ls.insert_node(3, 'step'),
			ls.insert_node(0, ''),
		}
	)),
	ls.snippet('while', fmt(
		[[
			while (${}) {{
				{}
			}}
		]],
		{
			ls.insert_node(1, 'cond'),
			ls.insert_node(0, ''),
		}
	)),
	ls.snippet('do', fmt(
		[[
			do {{
				{}
			}} while (${});
		]],
		{
			ls.insert_node(1, ''),
			ls.insert_node(0, 'cond'),
		}
	)),
}
