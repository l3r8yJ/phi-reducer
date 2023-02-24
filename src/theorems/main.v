Inductive bool := 
| true
| false.

Definition negb (b : bool) : bool :=
   match b with
   | true => false
   | false => true
   end.

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

Definition andb (a b : bool) : bool :=
   match a, b with
   | true, true => true
   | _, _ => false
   end.

Theorem and_true_both_arg_true : forall (a b : bool),
   a = true -> b = true ->  andb a b = true.
Proof.
   intros a b Ha Hb.
   rewrite Ha.
   rewrite Hb.
   simpl. reflexivity.
Qed.

Definition or (a b : bool) : bool :=
   match a, b with
   | false, false => false
   | _, _ => true
   end.
