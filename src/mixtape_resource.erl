-module(mixtape_resource).
-export([
    init/1,
    to_json/2
]).

-include_lib("webmachine/include/webmachine.hrl").

-spec init(list()) -> {ok, term()}.
init([]) ->
    {ok, undefined}.

-spec to_json(wrq:reqdata(), term()) -> {iodata(), wrq:reqdata(), term()}.
to_json(ReqData, State) ->
    {"<html><body>Hello, new world</body></html>", ReqData, State}.

