return {
	s('class', fmt(
		[[
			<?php

			namespace {};

			class {}
			{{
				{}
			}}
		]],
		{
			f(require 'luasnip-snippets.php-helpers'.getNamespaceForFile),
			f(require 'luasnip-snippets.php-helpers'.getClassnameForFile),
			i(0),
		}
	)),
	s('public', fmt(
		[[
			public function {}({}) : {}
			{{
				{}
			}}
		]],
		{
			i(1, 'name'),
			i(2, 'int $param'),
			i(3, 'void'),
			i(0, 'return'),
		}
	)),
	s('protected', fmt(
		[[
			protected function {}({}) : {}
			{{
				{}
			}}
		]],
		{
			i(1, 'name'),
			i(2, 'int $param'),
			i(3, 'void'),
			i(0, 'return'),
		}
	)),
	s('private', fmt(
		[[
			private function {}({}) : {}
			{{
				{}
			}}
		]],
		{
			i(1, 'name'),
			i(2, 'int $param'),
			i(3, 'void'),
			i(0, 'return'),
		}
	)),
	s('function', fmt(
		[[
			function ({}) : {}
			{{
				{}
			}}
		]],
		{
			i(1, 'int $param'),
			i(2, 'void'),
			i(0, 'return'),
		}
	)),
	s('fn', fmt(
		[[
			fn ({}) : {} => {};
		]],
		{
			i(1, 'int $param'),
			i(2, 'void'),
			i(0, ''),
		}
	)),
	s('if', fmt(
		[[
			if (${}) {{
				{}
			}}
		]],
		{
			i(1, 'cond'),
			i(0, ''),
		}
	)),
	s('foreach', fmt(
		[[
			foreach (${} as ${} => ${}) {{
				{}
			}}
		]],
		{
			i(1, 'array'),
			i(2, 'key'),
			i(3, 'value'),
			i(0, ''),
		}
	)),
	s('for', fmt(
		[[
			for (${}; ${}; ${}) {{
				{}
			}}
		]],
		{
			i(1, 'init'),
			i(2, 'cond'),
			i(3, 'step'),
			i(0, ''),
		}
	)),
	s('while', fmt(
		[[
			while (${}) {{
				{}
			}}
		]],
		{
			i(1, 'cond'),
			i(0, ''),
		}
	)),
	s('do', fmt(
		[[
			do {{
				{}
			}} while (${});
		]],
		{
			i(1, ''),
			i(0, 'cond'),
		}
	)),
}
