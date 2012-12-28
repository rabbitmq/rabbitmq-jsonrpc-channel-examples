%% The contents of this file are subject to the Mozilla Public License
%% Version 1.1 (the "License"); you may not use this file except in
%% compliance with the License. You may obtain a copy of the License
%% at http://www.mozilla.org/MPL/
%%
%% Software distributed under the License is distributed on an "AS IS"
%% basis, WITHOUT WARRANTY OF ANY KIND, either express or implied. See
%% the License for the specific language governing rights and
%% limitations under the License.
%%
%% The Original Code is RabbitMQ.
%%
%% The Initial Developer of the Original Code is VMware, Inc.
%% Copyright (c) 2007-2012 VMware, Inc.  All rights reserved.
%%

-module(rabbit_jsonrpc_channel_test_app).

-behaviour(application).
-export([start/2,stop/1]).

%% Dummy supervisor - see Ulf Wiger's comment at
%% http://erlang.2086793.n4.nabble.com/initializing-library-applications-without-processes-td2094473.html
-behaviour(supervisor).
-export([init/1]).

start(_Type, _StartArgs) ->
    {ok, _} = rabbit_mochiweb:register_static_context(jsonrpc_examples,
                                                      rabbit_jsonrpc:listener(),
                                                      "rpc-examples", ?MODULE,
                                                      "priv/www-examples",
                                                      "JSON-RPC: examples"),
    supervisor:start_link({local, ?MODULE}, ?MODULE, []).

stop(_State) ->
    rabbit_mochiweb:unregister_context(jsonrpc_examples),
    ok.

init([]) -> {ok, {{one_for_one, 3, 10}, []}}.
