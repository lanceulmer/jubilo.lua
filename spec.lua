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