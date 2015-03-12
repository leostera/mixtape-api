ERL ?= erl
APP := mixtape

.PHONY: clean distclean docs start install

all:
	@./rebar compile
	@echo "App built\n"

install: 
	@./rebar get-deps

start: install
	@./start.sh

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'
