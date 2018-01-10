-module(bench_dict).
-compile(export_all).

dict_all() ->
    %%% 
    %   Run through each benchmark for dicts, and return a map , where key is function tested and value is table of N and time
    NumList = [1, 10, 100, 1000, 10000, 100000, 1000000],
    NewList = lists:map(fun dict_fetch/1, NumList),
    NewList.
 


dict_fetch(N) ->

    TestDict = dict_init(N),
    Element = N div 2,

    statistics(runtime),
    statistics(wall_clock),

    _Value = dict:fetch(Element, TestDict),
    timer:sleep(10),
    
    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    U1 = Time1 * 1000,
    U2 = Time2 * 1000,
    io:format("CPU time=~p Runtime = ~p microseconds~n",
    [U1,U2]).
    
dict_append(N) ->
    TestDict = dict_init(N),
    Element = N div 2,

    statistics(runtime),
    statistics(wall_clock),

    _Dict2 = dict:append(Element, 2, TestDict),
    
    {_, Time1} = statistics(runtime),
    {_, Time2} = statistics(wall_clock),
    U1 = Time1 * 1000,
    U2 = Time2 * 1000,
    io:format("CPU time=~p Runtime = ~p microseconds~n",
    [U1,U2]).



%%% Internal Functions


dict_init(N) ->
    List = list_init(N),
    Dict = dict:from_list(List),
    Dict.


list_init(N) ->
    List = list_init(N, []),
    List.
    

list_init(0, List) ->
    List;
list_init(N, List) ->
    TempList = [{N, [1]}|List],
    list_init(N-1, TempList).