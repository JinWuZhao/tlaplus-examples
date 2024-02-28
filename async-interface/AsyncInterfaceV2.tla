---- MODULE AsyncInterfaceV2 ----
EXTENDS TLC, Naturals
CONSTANT Data
VARIABLE chan
TypeInvariant == chan \in [ val: Data, rdy: {0, 1}, ack: {0, 1} ]

Init == /\ TypeInvariant
        /\ chan.ack = chan.rdy
Send(d) == /\ chan.rdy = chan.ack
           /\ chan' = [ chan EXCEPT !.val = d, !.rdy = 1 - @ ]
Recv == /\ chan.rdy /= chan.ack
           /\ chan' = [ chan EXCEPT !.ack = 1 - @ ]
Next == (\E d \in Data: Send(d)) \/ Recv
Spec == Init /\ [][Next]_chan

THEOREM Spec => []TypeInvariant
=====================================