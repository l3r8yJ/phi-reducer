Theorem main_t: 1 + 1 = 2 : forall a,
  0 <= a.
Proof.
  intros.
  destruct a.
  - reflexivity.
  - apply le_0_en.
Qed.