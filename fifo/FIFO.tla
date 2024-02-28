---- MODULE FIFO ----
EXTENDS TLC

CONSTANT Message, N
VARIABLES in, out, q

Inner == INSTANCE InnerFIFO

Spec == Inner!Spec

THEOREM Spec => []Inner!TypeInvariant
====