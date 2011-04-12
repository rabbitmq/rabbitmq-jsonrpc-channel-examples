{application, rabbit_jsonrpc_channel_examples,
 [{description, "rabbit_jsonrpc_channel_examples"},
  {vsn, "0.01"},
  {modules, [
                rabbit_jsonrpc_channel_test_app
  ]},
  {registered, []},
  {mod, {rabbit_jsonrpc_channel_test_app, []}},
  {env, []},
  {applications, [kernel, stdlib, rabbit_mochiweb]}]}.
