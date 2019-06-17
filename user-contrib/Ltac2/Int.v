(************************************************************************)
(*         *   The Coq Proof Assistant / The Coq Development Team       *)
(*  v      *   INRIA, CNRS and contributors - Copyright 1999-2019       *)
(* <O___,, *       (see CREDITS file for the list of authors)           *)
(*   \VV/  **************************************************************)
(*    //   *    This file is distributed under the terms of the         *)
(*         *     GNU Lesser General Public License Version 2.1          *)
(*         *     (see LICENSE file for the text of the license)         *)
(************************************************************************)

Require Import Ltac2.Init.

Ltac2 Type exn ::= [ Division_by_zero ].

Ltac2 @ external equal : int -> int -> bool := "ltac2" "int_equal".
Ltac2 @ external compare : int -> int -> int := "ltac2" "int_compare".
Ltac2 @ external add : int -> int -> int := "ltac2" "int_add".
Ltac2 @ external sub : int -> int -> int := "ltac2" "int_sub".
Ltac2 @ external mul : int -> int -> int := "ltac2" "int_mul".
Ltac2 @ external neg : int -> int := "ltac2" "int_neg".
