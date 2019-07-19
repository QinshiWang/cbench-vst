Require Import VST.floyd.proofauto.
Require Import io_specs_rollback.
Require Import cat1.
Require Import ITree.ITree.
Require Import ITree.Eq.Eq.
(*Import ITreeNotations.*)
Notation "t1 >>= k2" := (ITree.bind t1 k2)
  (at level 50, left associativity) : itree_scope.
Notation "x <- t1 ;; t2" := (ITree.bind t1 (fun x => t2))
  (at level 100, t1 at next level, right associativity) : itree_scope.
Notation "t1 ;; t2" := (ITree.bind t1 (fun _ => t2))
  (at level 100, right associativity) : itree_scope.
Notation "' p <- t1 ;; t2" :=
  (ITree.bind t1 (fun x_ => match x_ with p => t2 end))
(at level 100, t1 at next level, p pattern, right associativity) : itree_scope.

Instance CompSpecs : compspecs. make_compspecs prog. Defined.
Definition Vprog : varspecs. mk_varspecs prog. Defined.

Definition event := nondetE +' @IO_event nat.

Definition putchar_spec := DECLARE _putchar putchar_spec(E := event).
Definition getchar_spec := DECLARE _getchar getchar_spec(E := event).

Definition cat_loop : IO_itree :=
   ITree.aloop (fun _ => inl (c <- read stdin;; or (write stdout c) (Ret tt))) tt.

Definition main_spec :=
 DECLARE _main
  WITH gv : globals
  PRE  [] main_pre_ext prog cat_loop nil gv
  POST [ tint ] main_post prog nil gv.

Definition Gprog : funspecs := ltac:(with_library prog [putchar_spec; getchar_spec;
  main_spec]).

Lemma cat_loop_eq : cat_loop ≈ (c <- read stdin;; or (write stdout c;; cat_loop) (cat_loop)).
Proof.
  intros.
  unfold cat_loop; rewrite unfold_aloop.
  unfold ITree._aloop.
  rewrite tau_eutt, bind_bind.
  apply eqit_bind; [intro | reflexivity].
  unfold or; rewrite bind_vis.
  apply eqit_Vis; intros [|].
  - apply eqit_bind; [intros []|]; reflexivity.
  - rewrite bind_ret; reflexivity.
Qed.

Lemma body_main: semax_body Vprog Gprog f_main main_spec.
Proof.
  start_function.
  sep_apply (has_ext_ITREE(E := nondetE +' @IO_event nat)).
  forward_loop (PROP () LOCAL () SEP (ITREE cat_loop))
    break: (PROP () LOCAL () SEP (ITREE cat_loop)).
  - entailer!.
  - rewrite cat_loop_eq.
    forward_call_io (fun c => or (write stdout c;; cat_loop) (cat_loop)).
    Intros c.
    forward.
    forward_if.
    + if_tac.
      { apply f_equal with (f := Int.repr) in H1; rewrite Int.repr_signed in H1; contradiction. }
      forward_call_io (Byte.repr (Int.signed c), cat_loop).
      { entailer!.
        unfold Vubyte.
        rewrite Byte.unsigned_repr, Int.repr_signed by omega; auto. }
      { apply or_case1. }
      Intros r.
      entailer!.
      if_tac; [|apply derives_refl].
      apply ITREE_impl', or_case2.
    + rewrite if_true.
      forward.
      rewrite cat_loop_eq; entailer!.
      { subst.
        rewrite neg_repr, Int.signed_repr by rep_omega; auto. }
  - forward.
Qed.

Definition ext_link := ext_link_prog prog.

Instance Espec : OracleKind := IO_Espec(E := event) ext_link.

Lemma prog_correct:
  semax_prog_ext prog cat_loop Vprog Gprog.
Proof.
prove_semax_prog.
semax_func_cons_ext.
{ simpl; Intro j.
  apply typecheck_return_value; auto. }
semax_func_cons_ext.
{ simpl; Intro j.
  apply typecheck_return_value; auto; apply I. }
semax_func_cons body_main.
Qed.
