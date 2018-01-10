-module(test).

-export([dict_init/0, list_init/1, dict_lookup/1]).

dict_init() ->
    List = list_init(100000),
    Dict = dict:from_list(List),
    Dict.

dict_lookup(Dict) ->
    statistics(runtime),
    statistics(wall_clock),

    Value = dict:fetch(4550, Dict),
    io:format("~p", [Value]),
    
    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    U1 = Time1 * 1000,
    U2 = Time2 * 1000,
    io:format("Code time=~p (~p) microseconds~n",
    [U1,U2]).

list_init(N) ->
    List = list_init(N, []),
    List.
    

list_init(0, List) ->
    List;
list_init(N, List) ->
    TempList = [{N, N}|List],
    list_init(N-1, TempList).

