-module(tape_resource).
-export([
         init/1,
         allowed_methods/2,
         content_types_provided/2,
         content_types_accepted/2,
         post_is_create/2,
         create_path/2,
         process_post/2,
         to_json/2,
         from_json/2
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

content_types_accepted(ReqData, Context) ->
    {[
      {"application/json", from_json}
     ], ReqData, Context}.

to_json(ReqData, Context) ->
    {"Hello, new tape", ReqData, Context}.

from_json(ReqData, Context) ->
    {true, ReqData, Context}.

%
% POST /tape/:id
%

post_is_create(ReqData, Context) ->
    {true, ReqData, Context}.

create_path(ReqData, Context) ->
    Path = "/tape/" ++ integer_to_list(mnesia:table_info(tape, size)+1),
    {Path, ReqData, Context}.

process_post(ReqData, Context) ->
    %% create record
    {true, ReqData, Context}.
