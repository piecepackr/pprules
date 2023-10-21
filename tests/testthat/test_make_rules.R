skip_if_not_installed("systemfonts")
gk <- game_kit()
dir <- tempfile()
on.exit(unlink(dir))
dir.create(dir)
test_that("game rules work as expected", {
    skip_if(Sys.which("pandoc") == "", "Doesn't have pandoc binary")
    skip_if(Sys.which("xelatex") == "", "Doesn't have xelatex binary")

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
test_that("game books work as expected", {
    skip_if(Sys.which("xelatex") == "", "Doesn't have xelatex binary")

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
