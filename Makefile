.PHONY: deps test

REBAR := ./rebar3

all:
	@$(REBAR) compile
	@$(REBAR) xref skip_deps=true
	@$(REBAR) eunit skip_deps=true
compile:
	@$(REBAR) compile skip_deps=true
xref:
	@$(REBAR) xref skip_deps=true
eunit:
	@$(REBAR) eunit skip_deps=true
typer:
	typer --plt $(PLT_FILE) -I include/ -r src/
doc: compile
	@$(REBAR) doc
clean:
	@$(REBAR) clean skip_deps=true
	@rm -rf c_src/*.o
distclean:
	@$(REBAR) clean
	@rm -rf c_src/*.o
	@rm -rf _build/ priv/ blocks/ .eunit/ rebar.lock
