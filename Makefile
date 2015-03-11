ERL ?= erl
APP := mixtape

.PHONY: deps clean distclean docs start

all: deps
	@./rebar compile
	@echo "App built \n"

start: deps
	@./start.sh

deps:
	@./rebar get-deps

clean:
	@./rebar clean

distclean: clean
	@./rebar delete-deps

docs:
	@erl -noshell -run edoc_run application '$(APP)' '"."' '[]'
