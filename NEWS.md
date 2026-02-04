pprules 0.1.2 (development)
===========================

* The `game` argument of `save_pamphlet()` and `save_ruleset()` can now be a character vector of games when the target output is a pdf file (#1).
* `save_pamphlet()`, `save_rulebook()`, and `save_ruleset()` now return the path to the generated file silently.
* Improved `xelatex` error handling when generating pdf files in
  `save_pamphlet()`, `save_rulebook()`, and `save_ruleset()`.

pprules 0.1.1
=============

Generate customizable rulesets and rulebooks:

* `save_ruleset()` saves individual rulesets in a variety of formats.
* `save_pamphlet()` saves a tri-fold pamphlet.
* `save_rulebook()` saves a rulebook.
* `names_rulesets()` returns a character vector of all the piecepack games we can generate rulesets for.

Developer utilities:

* `game_kit()` game kit object.
* `save_promo_image()` Saves a promo image of a game.
