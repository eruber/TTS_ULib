project='TTS_ULib'
title='TTS_ULib Documentation'
description='TTS_ULib 1.0.0'
full_description='The documentation is available at @{01-intro.md|here}.'
-- format = 'markdown|discount|lunamark|plain|backticks'
format='luamark'
-- style='!fixed'
file='../TTS_ULib/'
dir='api'
use_markdown_titles = true
sort_modules=true
topics = 'manual'
examples = {'../examples'}
add_language_extension('ttslua','lua')
prettify_files=true
kind_names={topic='Manual'}
-- Tag Aliases...
alias("p", "param")
not_luadoc = true
wrap = true
sort = true
