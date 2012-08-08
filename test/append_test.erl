-module(append_test).
-include_lib("triq/include/triq.hrl").

prop_append() ->
    ?FORALL({Xs,Ys},{list(int()),list(int())},
            lists:reverse(Xs++Ys) == lists:reverse(Ys) ++ lists:reverse(Xs)).
