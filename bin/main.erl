%Erlang 10.6.4
%dont change first 3 lines

-module(main).
	-export([max_Divide/2,is_Ugly/2,get_Nth_Ugly_No/3,start/0]).

    max_Divide(A,B) when A rem B == 0 -> max_Divide(trunc(A/B), B);
    max_Divide(A,B) -> A.

    is_Ugly(A,B) when B == 0 -> is_Ugly(max_Divide(A, 2), 2);
    is_Ugly(A,B) when B == 2 -> is_Ugly(max_Divide(A, 3), 3);
    is_Ugly(A,B) when B == 3 -> is_Ugly(max_Divide(A, 5), 5);
    is_Ugly(A,B) -> A == 1.

    get_Nth_Ugly_No(A,B,C) when C > A -> B-1;
    get_Nth_Ugly_No(A,B,C) ->
        case is_Ugly(B,0) of
            true -> get_Nth_Ugly_No(A,B+1,C+1);
            false -> get_Nth_Ugly_No(A,B+1,C)
        end.

	start() ->
        A = 10,
		    io:fwrite("[INPUT] ~w\n", [A]),
        B = get_Nth_Ugly_No(A,1,1),
        io:fwrite("[OUTPUT] ~w\n", [B]).
