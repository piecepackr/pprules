# pprules: **p**iece**p**ack **rules**

[![R-CMD-check](https://github.com/piecepackr/pprules/actions/workflows/R-CMD-check.yaml/badge.svg?branch=main)](https://github.com/piecepackr/pprules/actions)
[![Coverage Status](https://codecov.io/github/piecepackr/pprules/branch/main/graph/badge.svg)](https://app.codecov.io/github/piecepackr/pprules?branch=main)
[![Project Status: WIP -- Initial development is in progress, but there has not yet been a stable, usable release suitable for the public.](http://www.repostatus.org/badges/latest/wip.svg)](http://www.repostatus.org/#wip)

### Table of Contents

* [Overview](#overview)
* [Installation](#installation)
* [Examples](#examples)
* [FAQ](#faq)
* [Related links](#links)

## <a name="overview">Overview</a>

* `{pprules}` is an [R](https://www.r-project.org/) package with functions
that help generate custom [piecepack](http://www.ludism.org/ppwiki/HomePage) rulesets and books.
* `save_ruleset()` supports saving rulesets in a variety of file formats via `pandoc`
  while `save_pamphlet()` supports saving rulesets in a compact tri-fold pamphlet format.
* `save_rulebook()` supports saving a rulebook.  Currently only supports "The Historical Piecepacker".
* This is an extraction and refinement of functionality originally contained in the experimental [{ppgames}](https://www.github.com/piecepackr/ppgames) package.

## <a name="installation">Installation</a>

To install the `{pprules}` R package use the following commands in
[R](https://www.r-project.org/):

``` {.r}
install.packages("remotes")
remotes::install_github("piecepackr/pprules")
```

If you want to make rulebooks you\'ll need `xelatex` and if you want to
make rulesets you\'ll need a recent version of `pandoc`. The following
instructions should work on Ubuntu:

``` {.bash}
sudo apt install texlive-xetex
sudo apt install cabal-install
cabal update # add $HOME/.cabal/bin to $PATH
cabal install pandoc
```

## <a name="examples">Examples</a>

```r
library("pprules")
gk <- game_kit()
save_pamphlet("tablut", gk=gk)
save_ruleset("nine-mens-morris", gk=gk)
save_rulebook("the-historical-piecepacker", gk=gk)
```

## <a name="faq">FAQ</a>

### What is the license?

Unless otherwise specified the rulesets and rulebooks in the
`inst` directory are licensed under the [CC BY-SA 4.0
license](https://creativecommons.org/licenses/by-sa/4.0/). The code in
the `R`, `man`, and `tests` directories are dual-licensed under
the [MIT license](https://opensource.org/licenses/MIT).

### What games can we generate piecepack rulesets for?

* alquerque
* american checkers
* awithlaknannai mosona
* backgammon
* chaturaji
* cribbage
* four field kono
* international chess
* ludo
* nine men's morris
* pass the food
* shogi
* speedy towers
* tablut
* twelve men's morris
* xiangqi

## <a name="links">Related links</a>

### R packages

* [{piecepackr}](https://github.com/piecepackr/piecepackr)
* [{ppdf}](https://github.com/piecepackr/ppdf)
* [{xmpdf}](https://github.com/trevorld/xmpdf)

### Downloadable piecepack rulesets

* [piecepack.net](https://piecepack.net/games)
* [Piecepack wiki](https://ludism.org/ppwiki/Games)
* pre-generated {pprules}' [Rulesets](https://trevorldavis.com/piecepackr/pages/rulesets.html)
