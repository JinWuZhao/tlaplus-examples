---- MODULE Memory ----
EXTENDS TLC, MemoryInterface

Inner(mem, ctl, buf) == INSTANCE InternalMemory 
Spec == \E mem, ctl, buf : Inner(mem, ctl, buf)!ISpec 
====