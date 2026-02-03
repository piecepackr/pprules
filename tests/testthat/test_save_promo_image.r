test_that("`save_promo_image()`", {
	skip_if_not_installed("systemfonts")
	gk <- game_kit()
	test_promo <- function(game) {
		f <- tempfile(fileext = ".png")
		on.exit(unlink(f))
		save_promo_image(game, gk = gk, file = f)
		expect_true(file.size(f) > 1e3)
	}

	# Special promo images
	for (game in c(
		"nine_mens_morris",
		"pass_the_food",
		"speedy_towers",
		"tablut",
		"twelve_mens_morris"
	)) {
		test_promo(game)
	}

	# Default promo image
	test_promo("ludo")
})
