-module(rabbit_jsonrpc_channel_test_app).

-behaviour(application).
-export([start/2,stop/1]).

start(_Type, _StartArgs) ->
    {ok, _} = rabbit_mochiweb:register_static_context(jsonrpc_examples,
                                                      "rpc-examples", ?MODULE,
                                                      "priv/www-examples",
                                                      "JSON-RPC: examples"),
    {ok, spawn(fun loop/0)}.

stop(_State) ->
    rabbit_mochiweb:unregister_context(jsonrpc_examples),
    ok.

loop() ->
  receive
    _ -> loop()
  end.
