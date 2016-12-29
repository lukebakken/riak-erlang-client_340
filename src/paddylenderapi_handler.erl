-module (paddylenderapi_handler).
-export ([init/3]).
-export ([handle/2]).
-export ([terminate/3]).


init(_Transport, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{ok, Req2} = cowboy_req:reply(200, [], <<"Welcome to Paddy Lender API">>, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.