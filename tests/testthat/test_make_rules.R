skip_if_not_installed("systemfonts")
gk <- game_kit()
dir <- tempfile()
on.exit(unlink(dir))
dir.create(dir)

test_that("game rules work as expected", {
	skip_if_not(nzchar(Sys.which("pandoc")), "Doesn't have pandoc binary")

	output <- file.path(dir, "backgammon.pdf")
	save_ruleset("backgammon", gk, output, quietly = TRUE)
	expect_true(file.size(output) > 1e3)

	output <- file.path(dir, "shogi.html")
	save_ruleset("shogi", gk, output, quietly = TRUE)
	expect_true(file.size(output) > 1e3)

	output <- file.path(dir, "tablut.pdf")
	save_pamphlet("tablut", gk, output, quietly = TRUE)
	expect_true(file.size(file.path(dir, "tablut.pdf")) > 1e3)

	output <- file.path(dir, "ludo.pdf")
	save_pocketmod("ludo", gk, output, quietly = TRUE)
	expect_true(file.size(file.path(dir, "tablut.pdf")) > 1e3)
})

test_that("concatenating multiple rules works as expected", {
	skip_if_not(has_xelatex(), "Doesn't have suitable xelatex setup")
	skip_if_not(xmpdf::supports_get_docinfo())
	skip_if_not(xmpdf::supports_get_bookmarks())
	skip_if_not(xmpdf::supports_set_bookmarks())

	output <- file.path(dir, "pamphlets.pdf")
	save_pamphlet(c("Alice Chess", "Speedy Towers"), gk, output, quietly = TRUE)
	expect_true(file.size(output) > 1e3)
	expect_equal(nrow(xmpdf::get_bookmarks(output)[[1L]]), 2L)
	expect_equal(xmpdf::n_pages(output)[[1L]], 4L)

	output <- file.path(dir, "pocketmods.pdf")
	save_pocketmod(c("Alice Chess", "Speedy Towers"), gk, output, quietly = TRUE)
	expect_true(file.size(output) > 1e3)
	expect_equal(nrow(xmpdf::get_bookmarks(output)[[1L]]), 2L)
	expect_equal(xmpdf::n_pages(output)[[1L]], 2L)

	output <- file.path(dir, "rulesets.pdf")
	save_ruleset(c("Alice Chess", "Speedy Towers"), gk, output, quietly = TRUE)
	expect_true(file.size(output) > 1e3)
	expect_equal(nrow(xmpdf::get_bookmarks(output)[[1L]]), 2L)
})

test_that("game books work as expected", {
	skip_if_not(has_xelatex(), "Doesn't have suitable xelatex setup")

	output <- file.path(dir, "the-historical-piecepacker.pdf")
	save_rulebook("the historical piecepacker", gk, output, quietly = TRUE)
	expect_true(file.exists(output))
})

test_that("rule utils work as expected", {
	expect_equal(clean_n_players(2), "2")
	expect_equal(clean_n_players(c(2, 4)), "2, 4")
	expect_equal(clean_n_players(1:4), "1--4")
	expect_equal(clean_n_players(c(2:4, 6)), "2--4, 6")
})

test_that("xmpdf inform messages work", {
	expect_message(inform_get_docinfo(), class = "piecepackr_embed_metadata")
	expect_message(inform_set_bookmarks(), class = "piecepackr_embed_metadata")
	expect_message(inform_set_xmp(), class = "piecepackr_embed_metadata")
})
