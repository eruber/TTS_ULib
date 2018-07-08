# LDoc Markup Tags #

These notes assimilated from reading [LDoc Documentation](https://stevedonovan.github.io/ldoc/manual/doc.md.html "Go to LDoc Documentation") which is quite thorough; but, complete tagging info is scattered throughout the document.

## LDoc Parses Doc Comments ##
LDoc parses **doc comments** which can be specified in Lua source code in two ways using a single line Lua comment:

- Start a comment line with THREE hyphens
- A comment line with at least THREE hyphens at the beginning

All **doc comments** start with a summary sentence optionally followed by more description comments which are followed by comments containing one or more **tags** as in:

	--- THIS IS THE SUMMARY SENTENCE.
	-- Followed by more description comment line or lines
	-- @tag1 parameters of the first tag
	-- @tag2 parameters of the second tag

The tags basically add all the detail that cannot be derived from the source code automatically.

## List of All Tags Parsed by LDoc ##

**@module** A Lua module containing functions and tables, which may be inside sections

**@classmod** Like **@module** but describing a class

**@submodule** A file containing definitions that you wish to put into the named master module

**@script** A Lua program

**@author** (multiple), copyright, **@license**, **@release** only used for project-level tags like **@module**

**@function**, **@lfunction** Functions inside a module

**@param** formal arguments of a function (multiple)

**@tparam** formal arguments of a function that specify argument type first, then arg name

**@return** returned values of a function (multiple)

**@treturn** returned values of a function that specify type first

**@raise** unhandled error thrown by this function

**@local** explicitly marks a function as not being exported (unless --all)

**@see** reference other documented items

**@usage** give an example of a function’s use. (Has a somewhat different meaning when used with @module)

**@table** a Lua table

**@field** a named member of a table

**@section** starting a named section for grouping functions or tables together

**@type** a section which describes a class

**@within** puts the function or table into an implicit section

**@fixme**, **@todo** and **@warning** are annotations, which are doc comments that occur inside a function body.

## Tag @module ##

The first thing in your API module should be a name and a description. This is how a module is commonly done in Lua 5.2 with a **@module** tag at the top which introduces the name:


	--- a test module
	-- @module test
	
	local test = {}
	
	function test.my_module_function_1()
	    ...
	end
	
	...

	return test

## Tag @function ##

Functions in a module can be documented as such:

	--- foo explodes text.
	-- It is a specialized splitting operation on a string.
	-- @param text the string
	-- @return a table of substrings
	function foo (text)
	....
	end

Notice there is NO **@function** TAG, why not?? The function name is extracted from the source, so the **@function** tag is not necessary unless you wish to name the function something else in the documentation. Then it would be inserted before the first **@param** tag.

The tag **@lfunction** is for documenting local functions.

## Tag @param, @tparam ##

## Tag @classmod ##

##  Tag @submodule ##
##  Tag @script ##
##  Tag @author, @copyright, @license, @release ##
##  Tag @return ##
##  Tag @raise ##
##  Tag @local ##
##  Tag @see ##
##  Tag @usage ##
##  Tag @table ##
##  Tag @section ##
##  Tag @type ##
##  Tag @within ##
##  Tag @fixme, @todo, @warning ##
