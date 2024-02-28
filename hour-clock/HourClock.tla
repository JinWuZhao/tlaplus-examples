---- MODULE HourClock ----
EXTENDS TLC, Naturals
VARIABLE hr
HCini == hr \in (1 .. 12)
HCnxt == hr' = (hr % 12) + 1
HC == HCini /\ [][HCnxt]_hr
-------------------------
THEOREM HC => []HCini
=========================