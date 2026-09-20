peer(V0,V1) :- col(V0,V2), col(V1,V2).
peer(V0,V1) :- box(V0,V2), box(V1,V2).
peer(V0,V1) :- row(V0,V2), row(V1,V2).