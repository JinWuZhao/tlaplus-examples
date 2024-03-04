---- MODULE Memory ----
EXTENDS TLC, MemoryInterface

VARIABLES mem, ctl, buf

Inner == INSTANCE InternalMemory

Spec == Inner!ISpec

THEOREM Spec => Inner!TypeInvariant
====