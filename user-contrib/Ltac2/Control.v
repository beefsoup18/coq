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

(** Panic *)

Ltac2 @ external throw : exn -> 'a := "ltac2" "throw".
(** Fatal exception throwing. This does not induce backtracking. *)

(** Generic backtracking control *)

Ltac2 @ external zero : exn -> 'a := "ltac2" "zero".
Ltac2 @ external plus : (unit -> 'a) -> (exn -> 'a) -> 'a := "ltac2" "plus".
Ltac2 @ external once : (unit -> 'a) -> 'a := "ltac2" "once".
Ltac2 @ external dispatch : (unit -> unit) list -> unit := "ltac2" "dispatch".
Ltac2 @ external extend : (unit -> unit) list -> (unit -> unit) -> (unit -> unit) list -> unit := "ltac2" "extend".
Ltac2 @ external enter : (unit -> unit) -> unit := "ltac2" "enter".
Ltac2 @ external case : (unit -> 'a) -> ('a * (exn -> 'a)) result := "ltac2" "case".

(** Proof state manipulation *)

Ltac2 @ external focus : int -> int -> (unit -> 'a) -> 'a := "ltac2" "focus".
Ltac2 @ external shelve : unit -> unit := "ltac2" "shelve".
Ltac2 @ external shelve_unifiable : unit -> unit := "ltac2" "shelve_unifiable".

Ltac2 @ external new_goal : evar -> unit := "ltac2" "new_goal".
(** Adds the given evar to the list of goals as the last one. If it is
    already defined in the current state, don't do anything. Panics if the
    evar is not in the current state. *)

Ltac2 @ external progress : (unit -> 'a) -> 'a := "ltac2" "progress".

(** Goal inspection *)

Ltac2 @ external goal : unit -> constr := "ltac2" "goal".
(** Panics if there is not exactly one goal under focus. Otherwise returns
    the conclusion of this goal. *)

Ltac2 @ external hyp : ident -> constr := "ltac2" "hyp".
(** Panics if there is more than one goal under focus. If there is no
    goal under focus, looks for the section variable with the given name.
    If there is one, looks for the hypothesis with the given name. *)

Ltac2 @ external hyps : unit -> (ident * constr option * constr) list := "ltac2" "hyps".
(** Panics if there is more than one goal under focus. If there is no
    goal under focus, returns the list of section variables.
    If there is one, returns the list of hypotheses. In both cases, the
    list is ordered with rightmost values being last introduced. *)

(** Refinement *)

Ltac2 @ external refine : (unit -> constr) -> unit := "ltac2" "refine".

(** Evars *)

Ltac2 @ external with_holes : (unit -> 'a) -> ('a -> 'b) -> 'b := "ltac2" "with_holes".
(** [with_holes x f] evaluates [x], then apply [f] to the result, and fails if
    all evars generated by the call to [x] have not been solved when [f]
    returns. *)

(** Misc *)

Ltac2 @ external time : string option -> (unit -> 'a) -> 'a := "ltac2" "time".
(** Displays the time taken by a tactic to evaluate. *)

Ltac2 @ external abstract : ident option -> (unit -> unit) -> unit := "ltac2" "abstract".
(** Abstract a subgoal. *)

Ltac2 @ external check_interrupt : unit -> unit := "ltac2" "check_interrupt".
(** For internal use. *)
