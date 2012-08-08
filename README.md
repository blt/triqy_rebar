# Exercise the experimental QuickCheck ability of rebar

This application is barely anything, save for a demonstration that rebar's QC
support does not work as I expect, specially when
[triq](https://github.com/krestenkrab/triq) is the QuickCheck implmenentation.

Reproduction:

```
> ./rebar -V
rebar 2.9.0 R15B01 20120808_172850 git 2.0.0-144-g19d1ee2

> ./rebar get-deps
==> triqy_rebar (get-deps)
Pulling triq from {git,"git://github.com/krestenkrab/triq.git",
                       {tag,"7fb90cd1"}}
Cloning into 'triq'...
==> triq (get-deps)

> ./rebar compile
==> triq (compile)
Compiled src/triq_autoexport.erl
Compiled src/triq_sup.erl
Compiled src/triq_fsm_stub.erl
/private/tmp/triqy_rebar/deps/triq/src/triq_fsm.erl:31: Warning: variable 'Init' is unused
Compiled src/triq_fsm.erl
Compiled src/triq_statem.erl
Compiled src/triq_expr.erl
Compiled src/triq_app.erl
Compiled src/triq.erl
Compiled src/pdict_statem.erl
Compiled src/triq_tests.erl
/private/tmp/triqy_rebar/deps/triq/src/triq_dom.erl:778: Warning: function try_shrink/3 is unused
Compiled src/triq_dom.erl
==> triqy_rebar (compile)
Compiled src/hello_world_app.erl
Compiled src/hello_world_sup.erl

> ./rebar qc skip_deps=true
==> triqy_rebar (qc)
NOTICE: Using experimental 'qc' command
Compiled test/append_test.erl
Testing append_test:prop_append/0
....................................................................................................
Ran 100 tests
ERROR: One or more QC properties didn't hold true:
[true]
ERROR: qc failed while processing /private/tmp/triqy_rebar: rebar_abort
```

The test, taken directly from triq's README, does pass successfully, yet rebar
reports the test as a failure.
