---- MODULE InnerFIFO ----
EXTENDS TLC, Naturals, Sequences
CONSTANT Message, N
VARIABLES in, out, q
ASSUME (N \in Nat) /\ (N > 0)

Chan(ch) == INSTANCE Channel WITH Data <- Message, chan <- ch

Init == /\ Chan(in)!Init
        /\ Chan(out)!Init
        /\ q = <<>>

TypeInvariant == /\ Chan(in)!TypeInvariant
                 /\ Chan(out)!TypeInvariant
                 /\ q \in Seq(Message)

SSend(msg) == /\ Chan(in)!Send(msg)
              /\ UNCHANGED <<out, q>>

BufRecv == /\ Chan(in)!Recv
           /\ q' = Append(q, in.val)
           /\ UNCHANGED out

BufSend == /\ q /= <<>>
           /\ Chan(out)!Send(Head(q))
           /\ q' = Tail(q)
           /\ UNCHANGED in

RRecv == /\ Chan(out)!Recv
         /\ UNCHANGED <<in, q>>

SysNext == (BufRecv /\ (BufRecv => (Len(q) < N))) \/ BufSend

EnvNext == (\E msg \in Message: SSend(msg)) \/ RRecv

Next == SysNext \/ EnvNext

Spec == Init /\ [][Next]_<<in, out, q>>

THEOREM Spec => []TypeInvariant
====