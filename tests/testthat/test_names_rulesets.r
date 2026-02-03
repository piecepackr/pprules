test_that("`names_rulesets()`", {
	expect_equal(length(names_rulesets()), 16L)
	expect_equal(length(names_rulesets("the historical piecepacker")), 13L)
})
