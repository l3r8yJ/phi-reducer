Inductive bool := 
| true
| false.

Definition negb (b : bool) : bool :=
  match b with
  | true => false
  | false => true
  end.

Eval compute in negb (negb false).

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

Theorem and_true_otherside : forall (a b : bool),
  andb a b = true -> a = true /\ b = true.
Proof.
  intros a b Ha.
  destruct a.
  destruct b.
  split. reflexivity.
  reflexivity.
  split. reflexivity.
  simpl in Ha.
  inversion Ha.
  destruct b.
  simpl in Ha.
  inversion Ha.
  simpl in Ha.
  inversion Ha.
Qed.

Theorem andb_associative : forall (a b c : bool),
  andb a (andb b c) = andb (andb a b) c.
Proof.
  intros [|] [|] [|];
  reflexivity.
Qed.

Theorem andb_comutative : forall a b, andb a b = andb b a.
Proof.
  intros [|] [|]; simpl; reflexivity.
  Show Proof.
Qed.

Definition orb(a b : bool) : bool :=
  match a, b with
  | false, false => false
  | _, _ => true
  end.

Theorem andb_negb_orb : forall (a b : bool),
  negb (andb a b) = orb (negb a) (negb b).
Proof.
  intros [|] [|]; simpl; reflexivity.
Qed.