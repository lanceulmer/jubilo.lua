# jubilo.lua #

A tiny, functional lua testing framework. The initial commit contained only 150 lines of code. jubilo.lua supports everything needed to test lua applications. jubilo.lua allows for nested contexts and basic assertions. All results are formatted and printed to the console.

## Functions ##

The following functions are included in the framework:

*	run(function)
	-- Optional function that wraps the tests. This will print a summary as well as all of the test results.
*	context(name, function)
	-- Creates a named context that tests and other contexts can be run under.
*	assert(test, name)
	-- Checks the test case and prints the result.

## Installation ##

Drop jubilo.lua into your project folder and load it in your test file.
    
    local jubilo = require("jubilo")

## Usage ##

### Basic Example ###

    -- load the framework
    local jubilo = require("jubilo")

    -- tests
    local a = true
    assert(a, "Test that a is true")

### Recommended Use ###

jubilo.lua was inspired by [telescope](https://github.com/norman/telescope). This is the telescope example as run in jubilo.lua. It demonstrates contexts and result summary. This is the recommended format to model tests after.

    -- load the framework
    local jubilo = require("jubilo")

    run(function()
        context("A context", function()
            context("A nested context", function()
                assert("ham" ~= "cheese", "A test")
                context("Another nested context", function()
                    assert(2 > 1, "Another test")
                end)
            end)
            assert(3 == 1, "A test in the top-level context")
        end)
    end)

Will Print:
    
    ----------------------------------------------------------------------
    A context:                                                         [f]
      A nested context:                                                [p]
        A test                                                         [p]
        Another nested context:                                        [p]
          Another test                                                 [p]
      A test in the top-level context                                  [f]
    ----------------------------------------------------------------------
    3 assertions, 2 passed, 1 failed

### In Case Of Conflicts With Existing Code ###

To enter no conflict mode, find this line in jubilo.lua and change it to true:

    local NOCONFLICT = false

Now all tests will be forced to use the jubilo namespace.

    -- load the framework
    local jubilo = require("jubilo")

    jubilo.run(function()
        jubilo.context("A context", function()
            jubilo.context("A nested context", function()
                jubilo.assert("ham" ~= "cheese", "A test")
                jubilo.context("Another nested context", function()
                    jubilo.assert(2 > 1, "Another test")
                end)
            end)
            jubilo.assert(3 == 1, "A test in the top-level context")
        end)
    end)