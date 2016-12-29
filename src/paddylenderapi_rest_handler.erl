-module (paddylenderapi_rest_handler).

-export([init/3]).
-export([rest_init/2]).
-export([rest_terminate/2]).
-export([content_types_provided/2]).
-export([get_json/2]).

-include("records.hrl").
%-include ("usersrepository.erl").

init({tcp, http}, Req, Opts) ->
    {upgrade, protocol, cowboy_rest}.

rest_init(Req, State) ->
	{ok, Req, State}.

rest_terminate(Req, State) ->
	ok.

allowed_methods(Req, State) ->  
    {['HEAD', 'GET', 'PUT', 'POST', 'DELETE'], Req, State}.  

content_types_accepted(Req, State) ->  
    {[{{<<"application">>, <<"json">>, []}, put_json}], Req, State}.  

content_types_provided(Req, State) ->  

   {[{{<<"application">>, <<"json">>, []}, get_json}], Req, State}.


%%====================================================================
%% User defined functions
%%====================================================================

get_json(Req, State) ->
	{ok, Pid} = riakc_pb_socket:start_link("127.0.0.1", 8087),
	Body = riakc_pb_socket:is_connected(Pid),
	%% User = usersrepository:getuser(Pid, "lashman"),
	%% Body = <<"{\"rest\": \"Hello World!\"}">>,
	%% Body = io:format("{\"username\":\"~s\"}", [User#user.username]),
	{Body, Req, State}.

