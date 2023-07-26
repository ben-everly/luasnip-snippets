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
	))
}
