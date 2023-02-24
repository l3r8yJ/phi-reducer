Require Import Arith.
Require Import Ascii.
Require Import Bool.
Require Import Coq.Strings.Byte.
Import IfNotations.

Inductive string : Set :=
  | EmptyString : string
  | String : ascii -> string -> string.

Inductive EOExpr : Type :=
  | EOUnit : EOExpr
  | EOInt : nat -> EOExpr
  | EOBool : bool -> EOExpr
  | EOVar : string -> EOExpr
  | EOAssign : EOExpr -> EOExpr -> EOExpr
  | EOPlus : EOExpr -> EOExpr -> EOExpr
  | EOMinus : EOExpr -> EOExpr -> EOExpr
  | EOMult : EOExpr -> EOExpr -> EOExpr
  | EODiv : EOExpr -> EOExpr -> EOExpr
  | EOIf : EOExpr -> EOExpr -> EOExpr -> EOExpr
  | EOLambda : string -> EOExpr -> EOExpr
  | EOClosure : string -> EOExpr -> EOEnv -> EOExpr
  | EOApply : EOExpr -> EOExpr -> EOExpr

with EOEnv : Type :=
  | EOEmptyEnv : EOEnv
  | EOBind : string -> EOExpr -> EOEnv -> EOEnv.

(* TODO: Write an evaluation of EO ebnf *)
