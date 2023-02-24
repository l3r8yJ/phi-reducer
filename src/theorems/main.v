Inductive bool := 
| true
| false.

Definition negb (b : bool) : bool :=
   match b with
   | true => false
   | false => true
   end.

Eval compute in negb false.

Theorem negb_negb: forall (b : bool), negb (negb b) = b.
Proof.
   intros b.
   destruct b.
   + simpl. reflexivity.
   + simpl. reflexivity.
Qed.

Theorem negb_trice : forall (b : bool), negb (negb (negb b)) = negb b.
Proof.
   intros b.
   destruct b.
   + simpl. reflexivity.
   + simpl. reflexivity. 
Qed.
