(* Здесь я описываю что из себя представляет bool  *)
Inductive bool := 
| true
| false.
(*
 Объявления определения, насколько я понял
 это просто аналог функции
 эта обычная функция отрицания, то есть если мы
 вызовем ее на false результатом получим true
*)
Definition negb (b : bool) : bool :=
   match b with
   | true => false
   | false => true
   end.

(* так выглядит вызов ф-ции *)
Eval compute in negb false.
(*Здесь самое интересное*)
Theorem negb_negb: forall (b : bool), negb (negb b) = b.
Proof.
   intros b.
   (* Здесь наше выражение до упрощения*)
   destruct b.
   + simpl. reflexivity.
   + simpl. reflexivity.
Qed.
