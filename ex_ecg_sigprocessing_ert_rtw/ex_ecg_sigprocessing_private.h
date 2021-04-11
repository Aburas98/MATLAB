/*
 * File: ex_ecg_sigprocessing_private.h
 *
 * Code generated for Simulink model 'ex_ecg_sigprocessing'.
 *
 * Model version                  : 1.298
 * Simulink Coder version         : 8.10 (R2016a) 10-Feb-2016
 * C/C++ source code generated on : Sat Jan 09 00:19:39 2021
 *
 * Target selection: ert.tlc
 * Embedded hardware selection: ARM Compatible->ARM Cortex
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_ex_ecg_sigprocessing_private_h_
#define RTW_HEADER_ex_ecg_sigprocessing_private_h_
#include "rtwtypes.h"
#include "ex_ecg_sigprocessing.h"

/* Used by FromWorkspace Block: '<S4>/From Workspace' */
#ifndef rtInterpolate
# define rtInterpolate(v1,v2,f1,f2)    (((v1)==(v2))?((double)(v1)): (((f1)*((double)(v1)))+((f2)*((double)(v2)))))
#endif

#ifndef rtRound
# define rtRound(v)                    ( ((v) >= 0) ? floor((v) + 0.5) : ceil((v) - 0.5) )
#endif

extern real_T rt_roundd_snf(real_T u);
extern real32_T rt_roundf_snf(real32_T u);
extern void ex_ecg_sigprocessing_step0(void);
extern void ex_ecg_sigprocessing_step1(void);
extern void ex_ecg_sigprocessing_step2(void);
extern void ex_ecg_sigprocessing_step3(void);

#endif                                 /* RTW_HEADER_ex_ecg_sigprocessing_private_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
