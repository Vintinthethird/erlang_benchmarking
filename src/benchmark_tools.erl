-module(benchmark_tools).
-export([runtime/2]).


runtime(Fun, {N, TestList}) ->
    T1 = erlang:system_time(microsecond),
    _Value = Fun(N, TestList),
    T2 = erlang:system_time(microsecond),
    Time = T2-T1,
    Time;
runtime(Fun, Args) ->
    T1 = erlang:system_time(microsecond),
    _Value = Fun(Args),
    T2 = erlang:system_time(microsecond),
    Time = T2-T1,
    Time.