---- MODULE MemoryInterface ----
EXTENDS TLC, Naturals

VARIABLE memInt

CONSTANTS
    Proc,
    Adr,
    Val,
    NoVal,
    ClockCycle

ASSUME (ClockCycle \in Nat) /\ (ClockCycle >= 0)

Send(p, d, miOld, miNew) == /\ memInt = miOld
                            /\ IF memInt < ClockCycle THEN miNew = memInt + 1 ELSE miNew = 0

Reply(p, d, miOld, miNew) == Send(p, d, miOld, miNew)

MReq == [op: {"Rd"}, adr: Adr] \union [op: {"Wr"}, adr: Adr, val: Val]

InitMemInt(i) == i = 0
====