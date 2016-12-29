-module (usersrepository).
-export([saveuser/2, getuser/2]).
-include("records.hrl").


saveuser(ClientPid, User) ->
    RUser = riakc_obj:new(?USER_BUCKET,
                          list_to_binary(User#user.username),
                          User),
    riakc_pb_socket:put(ClientPid, RUser).

getuser(ClientPid, UserName) ->
    {ok, RUser} = riakc_pb_socket:get(ClientPid,
                                      ?USER_BUCKET,
                                      list_to_binary(UserName)),
    binary_to_term(riakc_obj:get_value(RUser)).