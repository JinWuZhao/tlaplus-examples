---- MODULE MemoryInterface ----
EXTENDS TLC, Naturals

VARIABLE memInt

CONSTANTS
    Proc,
    Adr,
    Val,
    NoVal,
    MaxPC

ASSUME (MaxPC \in Nat) /\ (MaxPC > 0)

Send(p, d, miOld, miNew) == /\ memInt = miOld
                            /\ memInt < MaxPC
                            /\ miNew = memInt + 1

Reply(p, d, miOld, miNew) == /\ memInt = miOld
                             /\ memInt <= MaxPC
                             /\ miNew = memInt + 1

Terminited(mi) == memInt >= MaxPC

ResetMemInt(miOld, miNew) == /\ memInt = miOld
                             /\ miNew = 0

MReq == [op: {"Rd"}, adr: Adr] \union [op: {"Wr"}, adr: Adr, val: Val]

InitMemInt(mi) == mi = 0
====