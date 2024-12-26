local ls = require 'luasnip'
local fmt = require 'luasnip.extras.fmt'.fmt

return {
	ls.snippet('pest', fmt(
		[[
			<?php
			{}
			it('{}', function () {{
				{}
			}});
		]],
		{
			ls.choice_node(1, {
				ls.text_node(''),
				ls.snippet_node(nil, {
					ls.text_node({'', 'beforeEach(function () {', ''}),
					ls.insert_node(1),
					ls.text_node({'', '});', ''}),
				}),
			}),
			ls.insert_node(2),
			ls.insert_node(0),
		}
	)),
}
