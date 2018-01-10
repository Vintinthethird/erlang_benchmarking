-module(list).
-export([list_delete/1, list_sort/1, list_all/0]).

list_all() ->
    TestNum = [1,10,100,1000,10000,50000,100000,500000,1000000,500000,1000000, 5000000, 10000000],
    FunList = [fun list_delete/1, fun list_sort/1],
    FunList2 = lists:map(fun(Func) -> {erlang:fun_info(Func,name), lists:map(fun (Num) -> {Num, Func(Num)} end, TestNum)} end,FunList),
    FunList2.

list_delete(N) ->
    TestList = list_init(N), 
    benchmark_tools:runtime(fun lists:delete/2, {N, TestList}).

list_sort(N) ->
    TestList = list_init(N),
    benchmark_tools:runtime(fun lists:sort/1, TestList).




list_init(N) ->
    List = list_init(N, []),
    List.

list_init(0, List) ->
    List;
list_init(N, List) ->
    list_init(N-1, [N|List]).