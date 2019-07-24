From Coq Require Import String List ZArith.
From compcert Require Import Coqlib Integers Floats AST Ctypes Cop Clight Clightdefs.
Local Open Scope Z_scope.

Module Info.
  Definition version := "3.5"%string.
  Definition build_number := ""%string.
  Definition build_tag := ""%string.
  Definition arch := "x86"%string.
  Definition model := "32sse2"%string.
  Definition abi := "standard"%string.
  Definition bitsize := 32.
  Definition big_endian := false.
  Definition source_file := "qsort4a.c"%string.
  Definition normalized := true.
End Info.

Definition ___builtin_annot : ident := 7%positive.
Definition ___builtin_annot_intval : ident := 8%positive.
Definition ___builtin_bswap : ident := 1%positive.
Definition ___builtin_bswap16 : ident := 3%positive.
Definition ___builtin_bswap32 : ident := 2%positive.
Definition ___builtin_bswap64 : ident := 33%positive.
Definition ___builtin_clz : ident := 34%positive.
Definition ___builtin_clzl : ident := 35%positive.
Definition ___builtin_clzll : ident := 36%positive.
Definition ___builtin_ctz : ident := 37%positive.
Definition ___builtin_ctzl : ident := 38%positive.
Definition ___builtin_ctzll : ident := 39%positive.
Definition ___builtin_debug : ident := 51%positive.
Definition ___builtin_fabs : ident := 4%positive.
Definition ___builtin_fmadd : ident := 42%positive.
Definition ___builtin_fmax : ident := 40%positive.
Definition ___builtin_fmin : ident := 41%positive.
Definition ___builtin_fmsub : ident := 43%positive.
Definition ___builtin_fnmadd : ident := 44%positive.
Definition ___builtin_fnmsub : ident := 45%positive.
Definition ___builtin_fsqrt : ident := 5%positive.
Definition ___builtin_membar : ident := 9%positive.
Definition ___builtin_memcpy_aligned : ident := 6%positive.
Definition ___builtin_nop : ident := 50%positive.
Definition ___builtin_read16_reversed : ident := 46%positive.
Definition ___builtin_read32_reversed : ident := 47%positive.
Definition ___builtin_va_arg : ident := 11%positive.
Definition ___builtin_va_copy : ident := 12%positive.
Definition ___builtin_va_end : ident := 13%positive.
Definition ___builtin_va_start : ident := 10%positive.
Definition ___builtin_write16_reversed : ident := 48%positive.
Definition ___builtin_write32_reversed : ident := 49%positive.
Definition ___compcert_i64_dtos : ident := 18%positive.
Definition ___compcert_i64_dtou : ident := 19%positive.
Definition ___compcert_i64_sar : ident := 30%positive.
Definition ___compcert_i64_sdiv : ident := 24%positive.
Definition ___compcert_i64_shl : ident := 28%positive.
Definition ___compcert_i64_shr : ident := 29%positive.
Definition ___compcert_i64_smod : ident := 26%positive.
Definition ___compcert_i64_smulh : ident := 31%positive.
Definition ___compcert_i64_stod : ident := 20%positive.
Definition ___compcert_i64_stof : ident := 22%positive.
Definition ___compcert_i64_udiv : ident := 25%positive.
Definition ___compcert_i64_umod : ident := 27%positive.
Definition ___compcert_i64_umulh : ident := 32%positive.
Definition ___compcert_i64_utod : ident := 21%positive.
Definition ___compcert_i64_utof : ident := 23%positive.
Definition ___compcert_va_composite : ident := 17%positive.
Definition ___compcert_va_float64 : ident := 16%positive.
Definition ___compcert_va_int32 : ident := 14%positive.
Definition ___compcert_va_int64 : ident := 15%positive.
Definition ___stringlit_1 : ident := 71%positive.
Definition _a : ident := 65%positive.
Definition _base : ident := 53%positive.
Definition _compar : ident := 56%positive.
Definition _compar_double : ident := 70%positive.
Definition _i : ident := 59%positive.
Definition _j : ident := 60%positive.
Definition _m : ident := 57%positive.
Definition _main : ident := 72%positive.
Definition _memcpy : ident := 52%positive.
Definition _n : ident := 58%positive.
Definition _nmemb : ident := 54%positive.
Definition _p : ident := 66%positive.
Definition _pivot : ident := 61%positive.
Definition _printf : ident := 64%positive.
Definition _q : ident := 67%positive.
Definition _qsort : ident := 63%positive.
Definition _size : ident := 55%positive.
Definition _tmp : ident := 62%positive.
Definition _x : ident := 68%positive.
Definition _y : ident := 69%positive.
Definition _t'1 : ident := 73%positive.
Definition _t'2 : ident := 74%positive.

Definition v___stringlit_1 := {|
  gvar_info := (tarray tschar 4);
  gvar_init := (Init_int8 (Int.repr 37) :: Init_int8 (Int.repr 102) ::
                Init_int8 (Int.repr 10) :: Init_int8 (Int.repr 0) :: nil);
  gvar_readonly := true;
  gvar_volatile := false
|}.

Definition f_qsort := {|
  fn_return := tvoid;
  fn_callconv := cc_default;
  fn_params := ((_base, (tptr tvoid)) :: (_nmemb, tuint) :: (_size, tuint) ::
                (_compar,
                 (tptr (Tfunction
                         (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil)) tint
                         cc_default))) :: nil);
  fn_vars := ((_pivot, (tarray tuchar 1024)) ::
              (_tmp, (tarray tuchar 1024)) :: nil);
  fn_temps := ((_m, tint) :: (_n, tint) :: (_i, tint) :: (_j, tint) ::
               (_t'2, tint) :: (_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _m (Econst_int (Int.repr 0) tint))
  (Ssequence
    (Sset _n
      (Ebinop Osub (Etempvar _nmemb tuint) (Econst_int (Int.repr 1) tint)
        tuint))
    (Sifthenelse (Ebinop Olt (Etempvar _m tint) (Etempvar _n tint) tint)
      (Ssequence
        (Scall None
          (Evar _memcpy (Tfunction
                          (Tcons (tptr tvoid)
                            (Tcons (tptr tvoid) (Tcons tuint Tnil)))
                          (tptr tvoid) cc_default))
          ((Evar _pivot (tarray tuchar 1024)) ::
           (Ebinop Oadd (Ecast (Etempvar _base (tptr tvoid)) (tptr tuchar))
             (Ebinop Omul (Etempvar _n tint) (Etempvar _size tuint) tuint)
             (tptr tuchar)) :: (Etempvar _size tuint) :: nil))
        (Ssequence
          (Sset _i (Etempvar _m tint))
          (Ssequence
            (Sset _j (Etempvar _n tint))
            (Ssequence
              (Swhile
                (Ebinop Ole (Etempvar _i tint) (Etempvar _j tint) tint)
                (Ssequence
                  (Sloop
                    (Ssequence
                      (Ssequence
                        (Scall (Some _t'1)
                          (Ederef
                            (Etempvar _compar (tptr (Tfunction
                                                      (Tcons (tptr tvoid)
                                                        (Tcons (tptr tvoid)
                                                          Tnil)) tint
                                                      cc_default)))
                            (Tfunction
                              (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil))
                              tint cc_default))
                          ((Ebinop Oadd
                             (Ecast (Etempvar _base (tptr tvoid))
                               (tptr tuchar))
                             (Ebinop Omul (Etempvar _i tint)
                               (Etempvar _size tuint) tuint) (tptr tuchar)) ::
                           (Evar _pivot (tarray tuchar 1024)) :: nil))
                        (Sifthenelse (Ebinop Olt (Etempvar _t'1 tint)
                                       (Econst_int (Int.repr 0) tint) tint)
                          Sskip
                          Sbreak))
                      (Sset _i
                        (Ebinop Oadd (Etempvar _i tint)
                          (Econst_int (Int.repr 1) tint) tint)))
                    Sskip)
                  (Ssequence
                    (Sloop
                      (Ssequence
                        (Ssequence
                          (Scall (Some _t'2)
                            (Ederef
                              (Etempvar _compar (tptr (Tfunction
                                                        (Tcons (tptr tvoid)
                                                          (Tcons (tptr tvoid)
                                                            Tnil)) tint
                                                        cc_default)))
                              (Tfunction
                                (Tcons (tptr tvoid)
                                  (Tcons (tptr tvoid) Tnil)) tint cc_default))
                            ((Ebinop Oadd
                               (Ecast (Etempvar _base (tptr tvoid))
                                 (tptr tuchar))
                               (Ebinop Omul (Etempvar _j tint)
                                 (Etempvar _size tuint) tuint) (tptr tuchar)) ::
                             (Evar _pivot (tarray tuchar 1024)) :: nil))
                          (Sifthenelse (Ebinop Ogt (Etempvar _t'2 tint)
                                         (Econst_int (Int.repr 0) tint) tint)
                            Sskip
                            Sbreak))
                        (Sset _j
                          (Ebinop Osub (Etempvar _j tint)
                            (Econst_int (Int.repr 1) tint) tint)))
                      Sskip)
                    (Sifthenelse (Ebinop Ole (Etempvar _i tint)
                                   (Etempvar _j tint) tint)
                      (Ssequence
                        (Scall None
                          (Evar _memcpy (Tfunction
                                          (Tcons (tptr tvoid)
                                            (Tcons (tptr tvoid)
                                              (Tcons tuint Tnil)))
                                          (tptr tvoid) cc_default))
                          ((Evar _tmp (tarray tuchar 1024)) ::
                           (Ebinop Oadd
                             (Ecast (Etempvar _base (tptr tvoid))
                               (tptr tuchar))
                             (Ebinop Omul (Etempvar _i tint)
                               (Etempvar _size tuint) tuint) (tptr tuchar)) ::
                           (Etempvar _size tuint) :: nil))
                        (Ssequence
                          (Scall None
                            (Evar _memcpy (Tfunction
                                            (Tcons (tptr tvoid)
                                              (Tcons (tptr tvoid)
                                                (Tcons tuint Tnil)))
                                            (tptr tvoid) cc_default))
                            ((Ebinop Oadd
                               (Ecast (Etempvar _base (tptr tvoid))
                                 (tptr tuchar))
                               (Ebinop Omul (Etempvar _i tint)
                                 (Etempvar _size tuint) tuint) (tptr tuchar)) ::
                             (Ebinop Oadd
                               (Ecast (Etempvar _base (tptr tvoid))
                                 (tptr tuchar))
                               (Ebinop Omul (Etempvar _j tint)
                                 (Etempvar _size tuint) tuint) (tptr tuchar)) ::
                             (Etempvar _size tuint) :: nil))
                          (Ssequence
                            (Scall None
                              (Evar _memcpy (Tfunction
                                              (Tcons (tptr tvoid)
                                                (Tcons (tptr tvoid)
                                                  (Tcons tuint Tnil)))
                                              (tptr tvoid) cc_default))
                              ((Ebinop Oadd
                                 (Ecast (Etempvar _base (tptr tvoid))
                                   (tptr tuchar))
                                 (Ebinop Omul (Etempvar _j tint)
                                   (Etempvar _size tuint) tuint)
                                 (tptr tuchar)) ::
                               (Evar _tmp (tarray tuchar 1024)) ::
                               (Etempvar _size tuint) :: nil))
                            (Ssequence
                              (Sset _i
                                (Ebinop Oadd (Etempvar _i tint)
                                  (Econst_int (Int.repr 1) tint) tint))
                              (Sset _j
                                (Ebinop Osub (Etempvar _j tint)
                                  (Econst_int (Int.repr 1) tint) tint))))))
                      Sskip))))
              (Ssequence
                (Scall None
                  (Evar _qsort (Tfunction
                                 (Tcons (tptr tvoid)
                                   (Tcons tuint
                                     (Tcons tuint
                                       (Tcons
                                         (tptr (Tfunction
                                                 (Tcons (tptr tvoid)
                                                   (Tcons (tptr tvoid) Tnil))
                                                 tint cc_default)) Tnil))))
                                 tvoid cc_default))
                  ((Ebinop Oadd
                     (Ecast (Etempvar _base (tptr tvoid)) (tptr tuchar))
                     (Ebinop Omul (Etempvar _m tint) (Etempvar _size tuint)
                       tuint) (tptr tuchar)) ::
                   (Ebinop Oadd
                     (Ebinop Osub (Etempvar _j tint) (Etempvar _m tint) tint)
                     (Econst_int (Int.repr 1) tint) tint) ::
                   (Etempvar _size tuint) ::
                   (Etempvar _compar (tptr (Tfunction
                                             (Tcons (tptr tvoid)
                                               (Tcons (tptr tvoid) Tnil))
                                             tint cc_default))) :: nil))
                (Scall None
                  (Evar _qsort (Tfunction
                                 (Tcons (tptr tvoid)
                                   (Tcons tuint
                                     (Tcons tuint
                                       (Tcons
                                         (tptr (Tfunction
                                                 (Tcons (tptr tvoid)
                                                   (Tcons (tptr tvoid) Tnil))
                                                 tint cc_default)) Tnil))))
                                 tvoid cc_default))
                  ((Ebinop Oadd
                     (Ecast (Etempvar _base (tptr tvoid)) (tptr tuchar))
                     (Ebinop Omul (Etempvar _i tint) (Etempvar _size tuint)
                       tuint) (tptr tuchar)) ::
                   (Ebinop Oadd
                     (Ebinop Osub (Etempvar _n tint) (Etempvar _i tint) tint)
                     (Econst_int (Int.repr 1) tint) tint) ::
                   (Etempvar _size tuint) ::
                   (Etempvar _compar (tptr (Tfunction
                                             (Tcons (tptr tvoid)
                                               (Tcons (tptr tvoid) Tnil))
                                             tint cc_default))) :: nil)))))))
      Sskip)))
|}.

Definition v_a := {|
  gvar_info := (tarray tdouble 666666);
  gvar_init := (Init_space 5333328 :: nil);
  gvar_readonly := false;
  gvar_volatile := false
|}.

Definition f_compar_double := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := ((_p, (tptr tvoid)) :: (_q, (tptr tvoid)) :: nil);
  fn_vars := nil;
  fn_temps := ((_x, tdouble) :: (_y, tdouble) :: (_t'2, tint) ::
               (_t'1, tint) :: nil);
  fn_body :=
(Ssequence
  (Sset _x
    (Ederef (Ecast (Etempvar _p (tptr tvoid)) (tptr tdouble)) tdouble))
  (Ssequence
    (Sset _y
      (Ederef (Ecast (Etempvar _q (tptr tvoid)) (tptr tdouble)) tdouble))
    (Ssequence
      (Sifthenelse (Ebinop Olt (Etempvar _x tdouble) (Etempvar _y tdouble)
                     tint)
        (Sset _t'1
          (Ecast (Eunop Oneg (Econst_int (Int.repr 1) tint) tint) tint))
        (Sifthenelse (Ebinop Oeq (Etempvar _x tdouble) (Etempvar _y tdouble)
                       tint)
          (Ssequence
            (Sset _t'2 (Ecast (Econst_int (Int.repr 0) tint) tint))
            (Sset _t'1 (Ecast (Etempvar _t'2 tint) tint)))
          (Ssequence
            (Sset _t'2 (Ecast (Econst_int (Int.repr 1) tint) tint))
            (Sset _t'1 (Ecast (Etempvar _t'2 tint) tint)))))
      (Sreturn (Some (Etempvar _t'1 tint))))))
|}.

Definition f_main := {|
  fn_return := tint;
  fn_callconv := cc_default;
  fn_params := nil;
  fn_vars := nil;
  fn_temps := ((_i, tint) :: (_t'1, tdouble) :: nil);
  fn_body :=
(Ssequence
  (Ssequence
    (Ssequence
      (Sset _i (Econst_int (Int.repr 0) tint))
      (Sloop
        (Ssequence
          (Sifthenelse (Ebinop Olt (Etempvar _i tint)
                         (Econst_int (Int.repr 666666) tint) tint)
            Sskip
            Sbreak)
          (Sassign
            (Ederef
              (Ebinop Oadd (Evar _a (tarray tdouble 666666))
                (Etempvar _i tint) (tptr tdouble)) tdouble)
            (Etempvar _i tint)))
        (Sset _i
          (Ebinop Oadd (Etempvar _i tint) (Econst_int (Int.repr 1) tint)
            tint))))
    (Ssequence
      (Scall None
        (Evar _qsort (Tfunction
                       (Tcons (tptr tvoid)
                         (Tcons tuint
                           (Tcons tuint
                             (Tcons
                               (tptr (Tfunction
                                       (Tcons (tptr tvoid)
                                         (Tcons (tptr tvoid) Tnil)) tint
                                       cc_default)) Tnil)))) tvoid
                       cc_default))
        ((Ecast (Evar _a (tarray tdouble 666666)) (tptr tvoid)) ::
         (Econst_int (Int.repr 666666) tint) :: (Esizeof tdouble tuint) ::
         (Eaddrof
           (Evar _compar_double (Tfunction
                                  (Tcons (tptr tvoid)
                                    (Tcons (tptr tvoid) Tnil)) tint
                                  cc_default))
           (tptr (Tfunction (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil))
                   tint cc_default))) :: nil))
      (Ssequence
        (Ssequence
          (Sset _i (Econst_int (Int.repr 0) tint))
          (Sloop
            (Ssequence
              (Sifthenelse (Ebinop Olt (Etempvar _i tint)
                             (Econst_int (Int.repr 666666) tint) tint)
                Sskip
                Sbreak)
              (Ssequence
                (Sset _t'1
                  (Ederef
                    (Ebinop Oadd (Evar _a (tarray tdouble 666666))
                      (Etempvar _i tint) (tptr tdouble)) tdouble))
                (Scall None
                  (Evar _printf (Tfunction (Tcons (tptr tschar) Tnil) tint
                                  {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
                  ((Evar ___stringlit_1 (tarray tschar 4)) ::
                   (Etempvar _t'1 tdouble) :: nil))))
            (Sset _i
              (Ebinop Oadd (Etempvar _i tint) (Econst_int (Int.repr 1) tint)
                tint))))
        (Sreturn (Some (Econst_int (Int.repr 0) tint))))))
  (Sreturn (Some (Econst_int (Int.repr 0) tint))))
|}.

Definition composites : list composite_definition :=
nil.

Definition global_definitions : list (ident * globdef fundef type) :=
((___stringlit_1, Gvar v___stringlit_1) ::
 (___builtin_bswap,
   Gfun(External (EF_builtin "__builtin_bswap"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap32,
   Gfun(External (EF_builtin "__builtin_bswap32"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tuint cc_default)) ::
 (___builtin_bswap16,
   Gfun(External (EF_builtin "__builtin_bswap16"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tushort Tnil) tushort cc_default)) ::
 (___builtin_fabs,
   Gfun(External (EF_builtin "__builtin_fabs"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_fsqrt,
   Gfun(External (EF_builtin "__builtin_fsqrt"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tdouble Tnil) tdouble cc_default)) ::
 (___builtin_memcpy_aligned,
   Gfun(External (EF_builtin "__builtin_memcpy_aligned"
                   (mksignature
                     (AST.Tint :: AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     None cc_default))
     (Tcons (tptr tvoid)
       (Tcons (tptr tvoid) (Tcons tuint (Tcons tuint Tnil)))) tvoid
     cc_default)) ::
 (___builtin_annot,
   Gfun(External (EF_builtin "__builtin_annot"
                   (mksignature (AST.Tint :: nil) None
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tvoid
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
 (___builtin_annot_intval,
   Gfun(External (EF_builtin "__builtin_annot_intval"
                   (mksignature (AST.Tint :: AST.Tint :: nil) (Some AST.Tint)
                     cc_default)) (Tcons (tptr tschar) (Tcons tint Tnil))
     tint cc_default)) ::
 (___builtin_membar,
   Gfun(External (EF_builtin "__builtin_membar"
                   (mksignature nil None cc_default)) Tnil tvoid cc_default)) ::
 (___builtin_va_start,
   Gfun(External (EF_builtin "__builtin_va_start"
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___builtin_va_arg,
   Gfun(External (EF_builtin "__builtin_va_arg"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_va_copy,
   Gfun(External (EF_builtin "__builtin_va_copy"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default))
     (Tcons (tptr tvoid) (Tcons (tptr tvoid) Tnil)) tvoid cc_default)) ::
 (___builtin_va_end,
   Gfun(External (EF_builtin "__builtin_va_end"
                   (mksignature (AST.Tint :: nil) None cc_default))
     (Tcons (tptr tvoid) Tnil) tvoid cc_default)) ::
 (___compcert_va_int32,
   Gfun(External (EF_external "__compcert_va_int32"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tvoid) Tnil) tuint cc_default)) ::
 (___compcert_va_int64,
   Gfun(External (EF_external "__compcert_va_int64"
                   (mksignature (AST.Tint :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons (tptr tvoid) Tnil) tulong
     cc_default)) ::
 (___compcert_va_float64,
   Gfun(External (EF_external "__compcert_va_float64"
                   (mksignature (AST.Tint :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons (tptr tvoid) Tnil) tdouble
     cc_default)) ::
 (___compcert_va_composite,
   Gfun(External (EF_external "__compcert_va_composite"
                   (mksignature (AST.Tint :: AST.Tint :: nil) (Some AST.Tint)
                     cc_default)) (Tcons (tptr tvoid) (Tcons tuint Tnil))
     (tptr tvoid) cc_default)) ::
 (___compcert_i64_dtos,
   Gfun(External (EF_runtime "__compcert_i64_dtos"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tlong cc_default)) ::
 (___compcert_i64_dtou,
   Gfun(External (EF_runtime "__compcert_i64_dtou"
                   (mksignature (AST.Tfloat :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tdouble Tnil) tulong cc_default)) ::
 (___compcert_i64_stod,
   Gfun(External (EF_runtime "__compcert_i64_stod"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tlong Tnil) tdouble cc_default)) ::
 (___compcert_i64_utod,
   Gfun(External (EF_runtime "__compcert_i64_utod"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tfloat)
                     cc_default)) (Tcons tulong Tnil) tdouble cc_default)) ::
 (___compcert_i64_stof,
   Gfun(External (EF_runtime "__compcert_i64_stof"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tlong Tnil) tfloat cc_default)) ::
 (___compcert_i64_utof,
   Gfun(External (EF_runtime "__compcert_i64_utof"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tsingle)
                     cc_default)) (Tcons tulong Tnil) tfloat cc_default)) ::
 (___compcert_i64_sdiv,
   Gfun(External (EF_runtime "__compcert_i64_sdiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___compcert_i64_udiv,
   Gfun(External (EF_runtime "__compcert_i64_udiv"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___compcert_i64_smod,
   Gfun(External (EF_runtime "__compcert_i64_smod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___compcert_i64_umod,
   Gfun(External (EF_runtime "__compcert_i64_umod"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___compcert_i64_shl,
   Gfun(External (EF_runtime "__compcert_i64_shl"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
 (___compcert_i64_shr,
   Gfun(External (EF_runtime "__compcert_i64_shr"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tint Tnil)) tulong cc_default)) ::
 (___compcert_i64_sar,
   Gfun(External (EF_runtime "__compcert_i64_sar"
                   (mksignature (AST.Tlong :: AST.Tint :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tint Tnil)) tlong cc_default)) ::
 (___compcert_i64_smulh,
   Gfun(External (EF_runtime "__compcert_i64_smulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tlong (Tcons tlong Tnil)) tlong cc_default)) ::
 (___compcert_i64_umulh,
   Gfun(External (EF_runtime "__compcert_i64_umulh"
                   (mksignature (AST.Tlong :: AST.Tlong :: nil)
                     (Some AST.Tlong) cc_default))
     (Tcons tulong (Tcons tulong Tnil)) tulong cc_default)) ::
 (___builtin_bswap64,
   Gfun(External (EF_builtin "__builtin_bswap64"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tlong)
                     cc_default)) (Tcons tulong Tnil) tulong cc_default)) ::
 (___builtin_clz,
   Gfun(External (EF_builtin "__builtin_clz"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_clzl,
   Gfun(External (EF_builtin "__builtin_clzl"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_clzll,
   Gfun(External (EF_builtin "__builtin_clzll"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tint)
                     cc_default)) (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_ctz,
   Gfun(External (EF_builtin "__builtin_ctz"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_ctzl,
   Gfun(External (EF_builtin "__builtin_ctzl"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons tuint Tnil) tint cc_default)) ::
 (___builtin_ctzll,
   Gfun(External (EF_builtin "__builtin_ctzll"
                   (mksignature (AST.Tlong :: nil) (Some AST.Tint)
                     cc_default)) (Tcons tulong Tnil) tint cc_default)) ::
 (___builtin_fmax,
   Gfun(External (EF_builtin "__builtin_fmax"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble Tnil)) tdouble cc_default)) ::
 (___builtin_fmin,
   Gfun(External (EF_builtin "__builtin_fmin"
                   (mksignature (AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble Tnil)) tdouble cc_default)) ::
 (___builtin_fmadd,
   Gfun(External (EF_builtin "__builtin_fmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fmsub,
   Gfun(External (EF_builtin "__builtin_fmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmadd,
   Gfun(External (EF_builtin "__builtin_fnmadd"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_fnmsub,
   Gfun(External (EF_builtin "__builtin_fnmsub"
                   (mksignature
                     (AST.Tfloat :: AST.Tfloat :: AST.Tfloat :: nil)
                     (Some AST.Tfloat) cc_default))
     (Tcons tdouble (Tcons tdouble (Tcons tdouble Tnil))) tdouble
     cc_default)) ::
 (___builtin_read16_reversed,
   Gfun(External (EF_builtin "__builtin_read16_reversed"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tushort) Tnil) tushort cc_default)) ::
 (___builtin_read32_reversed,
   Gfun(External (EF_builtin "__builtin_read32_reversed"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint) cc_default))
     (Tcons (tptr tuint) Tnil) tuint cc_default)) ::
 (___builtin_write16_reversed,
   Gfun(External (EF_builtin "__builtin_write16_reversed"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tushort) (Tcons tushort Tnil))
     tvoid cc_default)) ::
 (___builtin_write32_reversed,
   Gfun(External (EF_builtin "__builtin_write32_reversed"
                   (mksignature (AST.Tint :: AST.Tint :: nil) None
                     cc_default)) (Tcons (tptr tuint) (Tcons tuint Tnil))
     tvoid cc_default)) ::
 (___builtin_nop,
   Gfun(External (EF_builtin "__builtin_nop"
                   (mksignature nil None cc_default)) Tnil tvoid cc_default)) ::
 (___builtin_debug,
   Gfun(External (EF_external "__builtin_debug"
                   (mksignature (AST.Tint :: nil) None
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons tint Tnil) tvoid
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
 (_memcpy,
   Gfun(External (EF_external "memcpy"
                   (mksignature (AST.Tint :: AST.Tint :: AST.Tint :: nil)
                     (Some AST.Tint) cc_default))
     (Tcons (tptr tvoid) (Tcons (tptr tvoid) (Tcons tuint Tnil)))
     (tptr tvoid) cc_default)) :: (_qsort, Gfun(Internal f_qsort)) ::
 (_printf,
   Gfun(External (EF_external "printf"
                   (mksignature (AST.Tint :: nil) (Some AST.Tint)
                     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|}))
     (Tcons (tptr tschar) Tnil) tint
     {|cc_vararg:=true; cc_unproto:=false; cc_structret:=false|})) ::
 (_a, Gvar v_a) :: (_compar_double, Gfun(Internal f_compar_double)) ::
 (_main, Gfun(Internal f_main)) :: nil).

Definition public_idents : list ident :=
(_main :: _compar_double :: _a :: _printf :: _qsort :: _memcpy ::
 ___builtin_debug :: ___builtin_nop :: ___builtin_write32_reversed ::
 ___builtin_write16_reversed :: ___builtin_read32_reversed ::
 ___builtin_read16_reversed :: ___builtin_fnmsub :: ___builtin_fnmadd ::
 ___builtin_fmsub :: ___builtin_fmadd :: ___builtin_fmin ::
 ___builtin_fmax :: ___builtin_ctzll :: ___builtin_ctzl :: ___builtin_ctz ::
 ___builtin_clzll :: ___builtin_clzl :: ___builtin_clz ::
 ___builtin_bswap64 :: ___compcert_i64_umulh :: ___compcert_i64_smulh ::
 ___compcert_i64_sar :: ___compcert_i64_shr :: ___compcert_i64_shl ::
 ___compcert_i64_umod :: ___compcert_i64_smod :: ___compcert_i64_udiv ::
 ___compcert_i64_sdiv :: ___compcert_i64_utof :: ___compcert_i64_stof ::
 ___compcert_i64_utod :: ___compcert_i64_stod :: ___compcert_i64_dtou ::
 ___compcert_i64_dtos :: ___compcert_va_composite ::
 ___compcert_va_float64 :: ___compcert_va_int64 :: ___compcert_va_int32 ::
 ___builtin_va_end :: ___builtin_va_copy :: ___builtin_va_arg ::
 ___builtin_va_start :: ___builtin_membar :: ___builtin_annot_intval ::
 ___builtin_annot :: ___builtin_memcpy_aligned :: ___builtin_fsqrt ::
 ___builtin_fabs :: ___builtin_bswap16 :: ___builtin_bswap32 ::
 ___builtin_bswap :: nil).

Definition prog : Clight.program := 
  mkprogram composites global_definitions public_idents _main Logic.I.


