---- MODULE MemoryInterface ----
EXTENDS TLC, Naturals

VARIABLE memInt

CONSTANTS Proc,
          Adr,
          Val

MReq == [op: {"Rd"}, adr: Adr] \union [op: {"Wr"}, adr: Adr, val: Val]

NoVal == CHOOSE v : v \notin Val

InitMemInt == {<<CHOOSE p \in Proc : TRUE, NoVal>>}

Send(p, d, oldMemInt, newMemInt)  ==  newMemInt = <<p, d>>
Reply(p, d, oldMemInt, newMemInt) ==  newMemInt = <<p, d>>
====