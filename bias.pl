head_pred(peer,2).
body_pred(row,2).
body_pred(col,2).
body_pred(box,2).

type(peer,(cell,cell)).
type(row,(cell,rowid)).
type(col,(cell,colid)).
type(box,(cell,boxid)).

direction(peer,(in,in)).
direction(row,(in,out)).
direction(col,(in,out)).
direction(box,(in,out)).