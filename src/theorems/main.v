Inductive bool := 
| true
| false.

Definition negb (b : bool) : bool :=
   match b with
   | true => false
   | false => true
   end.

Eval compute in negb false.