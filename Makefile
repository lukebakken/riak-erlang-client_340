.PHONY: deps compile

REBAR ?= ./rebar

all: deps compile

deps:
	$(REBAR) get-deps

compile:
	$(REBAR) compile

clean:
	$(REBAR) clean

distclean: clean
	$(REBAR) delete-deps

test: compile
	$(REBAR) eunit skip_deps=true
