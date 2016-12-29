-define(USER_BUCKET, <<"Users">>).
-define(BORROW_BUCKET, <<"BorrowRequests">>).

-record(user, {id, username, password, firstname, middlename, lastname, mobile, email}).
-record(borrow_request, {id, userid, amount, rate, duration, status, date}).