; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -O3 -disable-strictnode-mutation | FileCheck %s --check-prefixes=CHECK,X86
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -O3 -disable-strictnode-mutation | FileCheck %s --check-prefixes=CHECK,X64

declare x86_fp80 @llvm.experimental.constrained.fadd.x86_fp80(x86_fp80, x86_fp80, metadata, metadata)
declare x86_fp80 @llvm.experimental.constrained.fsub.x86_fp80(x86_fp80, x86_fp80, metadata, metadata)
declare x86_fp80 @llvm.experimental.constrained.fmul.x86_fp80(x86_fp80, x86_fp80, metadata, metadata)
declare x86_fp80 @llvm.experimental.constrained.fdiv.x86_fp80(x86_fp80, x86_fp80, metadata, metadata)
declare x86_fp80 @llvm.experimental.constrained.fpext.x86_fp80.f32(float, metadata)
declare x86_fp80 @llvm.experimental.constrained.fpext.x86_fp80.f64(double, metadata)
declare x86_fp80 @llvm.experimental.constrained.sqrt.x86_fp80(x86_fp80, metadata, metadata)
declare float @llvm.experimental.constrained.fptrunc.f32.x86_fp80(x86_fp80, metadata, metadata)
declare double @llvm.experimental.constrained.fptrunc.f64.x86_fp80(x86_fp80, metadata, metadata)

define x86_fp80 @fadd_fp80(x86_fp80 %a, x86_fp80 %b) nounwind strictfp {
; X86-LABEL: fadd_fp80:
; X86:       # %bb.0:
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    faddp %st, %st(1)
; X86-NEXT:    retl
;
; X64-LABEL: fadd_fp80:
; X64:       # %bb.0:
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    faddp %st, %st(1)
; X64-NEXT:    retq
  %ret = call x86_fp80 @llvm.experimental.constrained.fadd.x86_fp80(x86_fp80 %a, x86_fp80 %b,
                                                                    metadata !"round.dynamic",
                                                                    metadata !"fpexcept.strict") #0
  ret x86_fp80 %ret
}

define x86_fp80 @fsub_fp80(x86_fp80 %a, x86_fp80 %b) nounwind strictfp {
; X86-LABEL: fsub_fp80:
; X86:       # %bb.0:
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fsubp %st, %st(1)
; X86-NEXT:    retl
;
; X64-LABEL: fsub_fp80:
; X64:       # %bb.0:
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fsubp %st, %st(1)
; X64-NEXT:    retq
  %ret = call x86_fp80 @llvm.experimental.constrained.fsub.x86_fp80(x86_fp80 %a, x86_fp80 %b,
                                                                    metadata !"round.dynamic",
                                                                    metadata !"fpexcept.strict") #0
  ret x86_fp80 %ret
}

define x86_fp80 @fmul_fp80(x86_fp80 %a, x86_fp80 %b) nounwind strictfp {
; X86-LABEL: fmul_fp80:
; X86:       # %bb.0:
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fmulp %st, %st(1)
; X86-NEXT:    retl
;
; X64-LABEL: fmul_fp80:
; X64:       # %bb.0:
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fmulp %st, %st(1)
; X64-NEXT:    retq
  %ret = call x86_fp80 @llvm.experimental.constrained.fmul.x86_fp80(x86_fp80 %a, x86_fp80 %b,
                                                                    metadata !"round.dynamic",
                                                                    metadata !"fpexcept.strict") #0
  ret x86_fp80 %ret
}

define x86_fp80 @fdiv_fp80(x86_fp80 %a, x86_fp80 %b) nounwind strictfp {
; X86-LABEL: fdiv_fp80:
; X86:       # %bb.0:
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fdivp %st, %st(1)
; X86-NEXT:    retl
;
; X64-LABEL: fdiv_fp80:
; X64:       # %bb.0:
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fdivp %st, %st(1)
; X64-NEXT:    retq
  %ret = call x86_fp80 @llvm.experimental.constrained.fdiv.x86_fp80(x86_fp80 %a, x86_fp80 %b,
                                                                    metadata !"round.dynamic",
                                                                    metadata !"fpexcept.strict") #0
  ret x86_fp80 %ret
}

define x86_fp80 @fpext_f32_to_fp80(float %a) nounwind strictfp {
; X86-LABEL: fpext_f32_to_fp80:
; X86:       # %bb.0:
; X86-NEXT:    flds {{[0-9]+}}(%esp)
; X86-NEXT:    retl
;
; X64-LABEL: fpext_f32_to_fp80:
; X64:       # %bb.0:
; X64-NEXT:    movss %xmm0, -{{[0-9]+}}(%rsp)
; X64-NEXT:    flds -{{[0-9]+}}(%rsp)
; X64-NEXT:    retq
  %ret = call x86_fp80 @llvm.experimental.constrained.fpext.x86_fp80.f32(float %a,
                                                                         metadata !"fpexcept.strict") #0
  ret x86_fp80 %ret
}

define x86_fp80 @fpext_f64_to_fp80(double %a) nounwind strictfp {
; X86-LABEL: fpext_f64_to_fp80:
; X86:       # %bb.0:
; X86-NEXT:    fldl {{[0-9]+}}(%esp)
; X86-NEXT:    retl
;
; X64-LABEL: fpext_f64_to_fp80:
; X64:       # %bb.0:
; X64-NEXT:    movsd %xmm0, -{{[0-9]+}}(%rsp)
; X64-NEXT:    fldl -{{[0-9]+}}(%rsp)
; X64-NEXT:    retq
  %ret = call x86_fp80 @llvm.experimental.constrained.fpext.x86_fp80.f64(double %a,
                                                                         metadata !"fpexcept.strict") #0
  ret x86_fp80 %ret
}

define float @fptrunc_fp80_to_f32(x86_fp80 %a) nounwind strictfp {
; X86-LABEL: fptrunc_fp80_to_f32:
; X86:       # %bb.0:
; X86-NEXT:    pushl %eax
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fstps (%esp)
; X86-NEXT:    flds (%esp)
; X86-NEXT:    popl %eax
; X86-NEXT:    retl
;
; X64-LABEL: fptrunc_fp80_to_f32:
; X64:       # %bb.0:
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fstps -{{[0-9]+}}(%rsp)
; X64-NEXT:    movss {{.*#+}} xmm0 = mem[0],zero,zero,zero
; X64-NEXT:    retq
  %ret = call float @llvm.experimental.constrained.fptrunc.f32.x86_fp80(x86_fp80 %a,
                                                                        metadata !"round.dynamic",
                                                                        metadata !"fpexcept.strict") #0
  ret float %ret
}

define double @fptrunc_fp80_to_f64(x86_fp80 %a) nounwind strictfp {
; X86-LABEL: fptrunc_fp80_to_f64:
; X86:       # %bb.0:
; X86-NEXT:    pushl %ebp
; X86-NEXT:    movl %esp, %ebp
; X86-NEXT:    andl $-8, %esp
; X86-NEXT:    subl $8, %esp
; X86-NEXT:    fldt 8(%ebp)
; X86-NEXT:    fstpl (%esp)
; X86-NEXT:    fldl (%esp)
; X86-NEXT:    movl %ebp, %esp
; X86-NEXT:    popl %ebp
; X86-NEXT:    retl
;
; X64-LABEL: fptrunc_fp80_to_f64:
; X64:       # %bb.0:
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fstpl -{{[0-9]+}}(%rsp)
; X64-NEXT:    movsd {{.*#+}} xmm0 = mem[0],zero
; X64-NEXT:    retq
  %ret = call double @llvm.experimental.constrained.fptrunc.f64.x86_fp80(x86_fp80 %a,
                                                                         metadata !"round.dynamic",
                                                                         metadata !"fpexcept.strict") #0
  ret double %ret
}

define x86_fp80 @fsqrt_fp80(x86_fp80 %a) nounwind strictfp {
; X86-LABEL: fsqrt_fp80:
; X86:       # %bb.0:
; X86-NEXT:    fldt {{[0-9]+}}(%esp)
; X86-NEXT:    fsqrt
; X86-NEXT:    retl
;
; X64-LABEL: fsqrt_fp80:
; X64:       # %bb.0:
; X64-NEXT:    fldt {{[0-9]+}}(%rsp)
; X64-NEXT:    fsqrt
; X64-NEXT:    retq
  %ret = call x86_fp80 @llvm.experimental.constrained.sqrt.x86_fp80(x86_fp80 %a,
                                                                    metadata !"round.dynamic",
                                                                    metadata !"fpexcept.strict") #0
  ret x86_fp80 %ret
}

attributes #0 = { strictfp }