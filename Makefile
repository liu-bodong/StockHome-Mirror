.PHONY: test check

build:
	dune build

code:
	-dune build
	code .
	! dune build --watch

utop:
	OCAMLRUNPARAM=b dune utop src

dependencies:
	pip3 install yahoo_fin
	pip3 install --force-reinstall -v "pandas==1.5.3"
	opam install bogue

test-daysum:
	OCAMLRUNPARAM=b dune exec test/daysum_test/daysum_test.exe

test-api:
	OCAMLRUNPARAM=b dune exec test/api_test/api_test.exe -- -runner sequential

test-date:
	OCAMLRUNPARAM=b dune exec test/date_test/date_test.exe

test-parser:
	OCAMLRUNPARAM=b dune exec test/parser_test/parser_test.exe

test-portfolio:
	OCAMLRUNPARAM=b dune exec test/portfolio_test/portfolio_test.exe

test-stock:
	OCAMLRUNPARAM=b dune exec test/stock_test/stock_test.exe

test-slice:
	OCAMLRUNPARAM=b dune exec test/slice_test/slice_test.exe

test-save-write:
	OCAMLRUNPARAM=b dune exec test/savewrite_test/savewrite_test.exe -- -runner sequential

test:
	make test-parser
	make test-portfolio
	make test-stock
	make test-slice
	make test-save-write
	make test-api
	make test-daysum
	make test-date

display:
	OCAMLRUNPARAM=b dune exec bin/display/display.exe

gui:
	OCAMLRUNPARAM=b dune exec bin/gui/gui.exe

zip:
	rm -f stocks.zip
	zip -r stocks.zip .

clean:
	dune clean
	rm -f stocks.zip
	
lines:
	make clean
	cloc --by-file --include-lang=OCaml .

