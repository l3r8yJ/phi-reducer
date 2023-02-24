Require Import Relations.Relation_Definitions.

Inductive Process :=
  | Nil : Process
  | Input : nat -> (nat -> Process) -> Process
  | Output : nat -> Process -> Process
  | Sum : Process -> Process -> Process
  | Res : nat -> Process -> Process.

Definition small_step : relation Process :=
  fun p1 p2 =>
    match p1 with
    | Input x f =>
      exists v, p2 = f v
    | Output x p =>
      p2 = p
    | Sum p1' p2' =>
      p2 = Sum p1' p2' \/ p2 = Sum p1 p2'
    | Res x p =>
      exists y, p2 = Res y p /\ x <> y
    | _ => False
    end.

Inductive multi_step : relation Process :=
  | refl : forall p, multi_step p p
  | step : forall p1 p2 p3, small_step p1 p2 -> multi_step p2 p3 -> multi_step p1 p3.

Inductive bisim : relation Process :=
  | bisim_refl : forall p, bisim p p
  | bisim_trans : forall p1 p2 p3, bisim p1 p2 -> small_step p2 p3 -> bisim p1 p3
  | bisim_symm : forall p1 p2, bisim p1 p2 -> bisim p2 p1.

Definition bisimulation (R : relation Process) :=
  forall p q, R p q -> (forall p', small_step p p' -> exists q', R p' q' /\ small_step q q') /\
                (forall q', small_step q q' -> exists p', R p' q' /\ small_step p p').

Definition bisimilarity (R : relation Process) :=
  forall p q, R p q -> exists q', bisim q q' /\ multi_step p q'.
