/*
 * File: ex_ecg_sigprocessing_types.h
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

#ifndef RTW_HEADER_ex_ecg_sigprocessing_types_h_
#define RTW_HEADER_ex_ecg_sigprocessing_types_h_
#include "rtwtypes.h"
#ifndef struct_md1bce3ed5a51df51f57d764add1ba967e
#define struct_md1bce3ed5a51df51f57d764add1ba967e

struct md1bce3ed5a51df51f57d764add1ba967e
{
  int32_T S0_isInitialized;
  real32_T W0_InBuf[653];
  int32_T W1_InBufIdx;
  real32_T P0_FILTER[3265];
  int32_T P1_PolyphaseSelector[5];
  int32_T P2_StartIdx[9];
  int32_T P3_StopIdx[9];
};

#endif                                 /*struct_md1bce3ed5a51df51f57d764add1ba967e*/

#ifndef typedef_dsp_FIRRateConverter_0_ex_ecg_T
#define typedef_dsp_FIRRateConverter_0_ex_ecg_T

typedef struct md1bce3ed5a51df51f57d764add1ba967e
  dsp_FIRRateConverter_0_ex_ecg_T;

#endif                                 /*typedef_dsp_FIRRateConverter_0_ex_ecg_T*/

#ifndef struct_mdzpzgoMIhxEcSUwUiAxDX4E
#define struct_mdzpzgoMIhxEcSUwUiAxDX4E

struct mdzpzgoMIhxEcSUwUiAxDX4E
{
  int32_T isInitialized;
  dsp_FIRRateConverter_0_ex_ecg_T cSFunObject;
};

#endif                                 /*struct_mdzpzgoMIhxEcSUwUiAxDX4E*/

#ifndef typedef_dspcodegen_FIRRateConverter_e_T
#define typedef_dspcodegen_FIRRateConverter_e_T

typedef struct mdzpzgoMIhxEcSUwUiAxDX4E dspcodegen_FIRRateConverter_e_T;

#endif                                 /*typedef_dspcodegen_FIRRateConverter_e_T*/

#ifndef struct_md132e4c714a1de75180ac35e6a2a8bbc4
#define struct_md132e4c714a1de75180ac35e6a2a8bbc4

struct md132e4c714a1de75180ac35e6a2a8bbc4
{
  int32_T S0_isInitialized;
  real32_T W0_states[51];
  real32_T P0_InitialStates;
  real32_T P1_Coefficients[52];
};

#endif                                 /*struct_md132e4c714a1de75180ac35e6a2a8bbc4*/

#ifndef typedef_dsp_FIRFilter_0_ex_ecg_sigpro_T
#define typedef_dsp_FIRFilter_0_ex_ecg_sigpro_T

typedef struct md132e4c714a1de75180ac35e6a2a8bbc4
  dsp_FIRFilter_0_ex_ecg_sigpro_T;

#endif                                 /*typedef_dsp_FIRFilter_0_ex_ecg_sigpro_T*/

#ifndef struct_mdDWFO1jnSbVeEwcQIYKMTIB
#define struct_mdDWFO1jnSbVeEwcQIYKMTIB

struct mdDWFO1jnSbVeEwcQIYKMTIB
{
  int32_T isInitialized;
  dsp_FIRFilter_0_ex_ecg_sigpro_T cSFunObject;
};

#endif                                 /*struct_mdDWFO1jnSbVeEwcQIYKMTIB*/

#ifndef typedef_dspcodegen_FIRFilter_ex_ecg_s_T
#define typedef_dspcodegen_FIRFilter_ex_ecg_s_T

typedef struct mdDWFO1jnSbVeEwcQIYKMTIB dspcodegen_FIRFilter_ex_ecg_s_T;

#endif                                 /*typedef_dspcodegen_FIRFilter_ex_ecg_s_T*/

#ifndef struct_mdNuQ0vCVgl4Xqs4UAr1LsFH
#define struct_mdNuQ0vCVgl4Xqs4UAr1LsFH

struct mdNuQ0vCVgl4Xqs4UAr1LsFH
{
  int32_T isInitialized;
  uint32_T inputVarSize1[8];
  real_T NumChannels;
  dspcodegen_FIRRateConverter_e_T *filt1;
};

#endif                                 /*struct_mdNuQ0vCVgl4Xqs4UAr1LsFH*/

#ifndef typedef_dsp_SampleRateConverter_ex_ec_T
#define typedef_dsp_SampleRateConverter_ex_ec_T

typedef struct mdNuQ0vCVgl4Xqs4UAr1LsFH dsp_SampleRateConverter_ex_ec_T;

#endif                                 /*typedef_dsp_SampleRateConverter_ex_ec_T*/

#ifndef typedef_struct_T_ex_ecg_sigprocessing_T
#define typedef_struct_T_ex_ecg_sigprocessing_T

typedef struct {
  char_T f0[7];
} struct_T_ex_ecg_sigprocessing_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigprocessing_T*/

#ifndef typedef_struct_T_ex_ecg_sigprocessi_g_T
#define typedef_struct_T_ex_ecg_sigprocessi_g_T

typedef struct {
  char_T f0[6];
  char_T f1[6];
  char_T f2[4];
  char_T f3;
  real_T f4;
} struct_T_ex_ecg_sigprocessi_g_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigprocessi_g_T*/

#ifndef typedef_struct_T_ex_ecg_sigprocess_g0_T
#define typedef_struct_T_ex_ecg_sigprocess_g0_T

typedef struct {
  char_T f0[6];
  char_T f1[6];
  char_T f2[4];
  char_T f3[2];
  real_T f4;
  char_T f5[2];
  real_T f6;
} struct_T_ex_ecg_sigprocess_g0_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigprocess_g0_T*/

#ifndef typedef_struct_T_ex_ecg_sigproces_g0v_T
#define typedef_struct_T_ex_ecg_sigproces_g0v_T

typedef struct {
  char_T f0[6];
  char_T f1[6];
  char_T f2[4];
  char_T f3;
  real_T f4;
  char_T f5[2];
  real_T f6;
} struct_T_ex_ecg_sigproces_g0v_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigproces_g0v_T*/

#ifndef typedef_struct_T_ex_ecg_sigproce_g0vg_T
#define typedef_struct_T_ex_ecg_sigproce_g0vg_T

typedef struct {
  char_T f0[6];
  char_T f1[6];
} struct_T_ex_ecg_sigproce_g0vg_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigproce_g0vg_T*/

#ifndef typedef_struct_T_ex_ecg_sigproc_g0vgt_T
#define typedef_struct_T_ex_ecg_sigproc_g0vgt_T

typedef struct {
  char_T f0[2];
} struct_T_ex_ecg_sigproc_g0vgt_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigproc_g0vgt_T*/

#ifndef struct_tag_scRiMTx5XQQxJcRLbfGOFSE
#define struct_tag_scRiMTx5XQQxJcRLbfGOFSE

struct tag_scRiMTx5XQQxJcRLbfGOFSE
{
  real_T coeffs1[3265];
  real_T rcf1[2];
};

#endif                                 /*struct_tag_scRiMTx5XQQxJcRLbfGOFSE*/

#ifndef typedef_scRiMTx5XQQxJcRLbfGOFSE_ex_ec_T
#define typedef_scRiMTx5XQQxJcRLbfGOFSE_ex_ec_T

typedef struct tag_scRiMTx5XQQxJcRLbfGOFSE scRiMTx5XQQxJcRLbfGOFSE_ex_ec_T;

#endif                                 /*typedef_scRiMTx5XQQxJcRLbfGOFSE_ex_ec_T*/

#ifndef struct_mde4ZI0qO46NIx5OwCXzqiXF
#define struct_mde4ZI0qO46NIx5OwCXzqiXF

struct mde4ZI0qO46NIx5OwCXzqiXF
{
  int32_T isInitialized;
  uint32_T inputVarSize1[8];
  real_T NumChannels;
  dspcodegen_FIRFilter_ex_ecg_s_T *FilterObj;
};

#endif                                 /*struct_mde4ZI0qO46NIx5OwCXzqiXF*/

#ifndef typedef_dsp_Differentiator_ex_ecg_sig_T
#define typedef_dsp_Differentiator_ex_ecg_sig_T

typedef struct mde4ZI0qO46NIx5OwCXzqiXF dsp_Differentiator_ex_ecg_sig_T;

#endif                                 /*typedef_dsp_Differentiator_ex_ecg_sig_T*/

#ifndef typedef_struct_T_ex_ecg_sigpro_g0vgtr_T
#define typedef_struct_T_ex_ecg_sigpro_g0vgtr_T

typedef struct {
  char_T f0[6];
} struct_T_ex_ecg_sigpro_g0vgtr_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigpro_g0vgtr_T*/

#ifndef typedef_struct_T_ex_ecg_sigpr_g0vgtr0_T
#define typedef_struct_T_ex_ecg_sigpr_g0vgtr0_T

typedef struct {
  char_T f0[6];
  char_T f1[6];
  char_T f2[4];
  char_T f3[7];
  char_T f4[8];
  char_T f5[3];
} struct_T_ex_ecg_sigpr_g0vgtr0_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigpr_g0vgtr0_T*/

#ifndef typedef_struct_T_ex_ecg_sigp_g0vgtr0b_T
#define typedef_struct_T_ex_ecg_sigp_g0vgtr0b_T

typedef struct {
  char_T f0[7];
  char_T f1[11];
} struct_T_ex_ecg_sigp_g0vgtr0b_T;

#endif                                 /*typedef_struct_T_ex_ecg_sigp_g0vgtr0b_T*/

#ifndef struct_tag_s7dxCyBZgBXHNFtHudSBxx
#define struct_tag_s7dxCyBZgBXHNFtHudSBxx

struct tag_s7dxCyBZgBXHNFtHudSBxx
{
  real_T fgrid[416];
  real_T des[416];
  real_T wt[416];
  creal_T H[416];
  real_T error[416];
  real_T iextr[27];
  real_T fextr[27];
};

#endif                                 /*struct_tag_s7dxCyBZgBXHNFtHudSBxx*/

#ifndef typedef_s7dxCyBZgBXHNFtHudSBxx_ex_ecg_T
#define typedef_s7dxCyBZgBXHNFtHudSBxx_ex_ecg_T

typedef struct tag_s7dxCyBZgBXHNFtHudSBxx s7dxCyBZgBXHNFtHudSBxx_ex_ecg_T;

#endif                                 /*typedef_s7dxCyBZgBXHNFtHudSBxx_ex_ecg_T*/

/* Parameters (auto storage) */
typedef struct P_ex_ecg_sigprocessing_T_ P_ex_ecg_sigprocessing_T;

/* Forward declaration for rtModel */
typedef struct tag_RTM_ex_ecg_sigprocessing_T RT_MODEL_ex_ecg_sigprocessing_T;

#endif                                 /* RTW_HEADER_ex_ecg_sigprocessing_types_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
