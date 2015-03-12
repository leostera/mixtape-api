-module(tape_resource).
-export([
         init/1,
         allowed_methods/2,
         content_types_provided/2,
         process_post/2,
         to_json/2
        ]).

-include_lib("webmachine/include/webmachine.hrl").

init(Config) ->
    {{trace, "/tmp"}, Config}. %% debug
    %%{ok, Config}.

allowed_methods(ReqData, Context) ->
    { ['GET', 'HEAD', 'POST'], ReqData, Context}.

content_types_provided(ReqData, Context) ->
    {[
      {"application/json", to_json}
     ], ReqData, Context}.

to_json(ReqData, Context) ->
    {"Hello, new tape", ReqData, Context}.

process_post(ReqData, Context) ->
    {"New tape", ReqData, Context}.
