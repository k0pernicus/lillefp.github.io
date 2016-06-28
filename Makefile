.PHONY: all

all:
	elm-make src/Front.elm --output=build/front.js

debug:
	elm-make src/Front.elm --output=build/debug.html
