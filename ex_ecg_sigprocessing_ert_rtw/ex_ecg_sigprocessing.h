/*
 * File: ex_ecg_sigprocessing.h
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

#ifndef RTW_HEADER_ex_ecg_sigprocessing_h_
#define RTW_HEADER_ex_ecg_sigprocessing_h_
#include <math.h>
#include <string.h>
#ifndef ex_ecg_sigprocessing_COMMON_INCLUDES_
# define ex_ecg_sigprocessing_COMMON_INCLUDES_
#include "rtwtypes.h"
#endif                                 /* ex_ecg_sigprocessing_COMMON_INCLUDES_ */

#include "ex_ecg_sigprocessing_types.h"

/* Macros for accessing real-time model data structure */
#ifndef rtmCounterLimit
# define rtmCounterLimit(rtm, idx)     ((rtm)->Timing.TaskCounters.cLimit[(idx)])
#endif

#ifndef rtmGetErrorStatus
# define rtmGetErrorStatus(rtm)        ((rtm)->errorStatus)
#endif

#ifndef rtmSetErrorStatus
# define rtmSetErrorStatus(rtm, val)   ((rtm)->errorStatus = (val))
#endif

#ifndef rtmStepTask
# define rtmStepTask(rtm, idx)         ((rtm)->Timing.TaskCounters.TID[(idx)] == 0)
#endif

#ifndef rtmTaskCounter
# define rtmTaskCounter(rtm, idx)      ((rtm)->Timing.TaskCounters.TID[(idx)])
#endif

/* Block signals (auto storage) */
typedef struct {
  real32_T Buffer[90];                 /* '<S1>/Buffer' */
  real32_T filteredSignal[50];         /* '<S3>/moving Avg window' */
  real32_T peak[50];                   /* '<S3>/QRS Detection' */
  real32_T threshold[50];              /* '<S3>/QRS Detection' */
  real32_T y1[50];
  real32_T Abs[50];                    /* '<S3>/Abs' */
  uint16_T heartRate[50];              /* '<S3>/QRS Detection' */
  int16_T w[8];
  int8_T inputSize[8];
  real_T y;
  real32_T MultiportSwitch;            /* '<S2>/Multiport Switch' */
  int32_T currentOffset;
} B_ex_ecg_sigprocessing_T;

/* Block states (auto storage) for system '<Root>' */
typedef struct {
  dspcodegen_FIRRateConverter_e_T gobj_0;/* '<S1>/Sample-Rate Converter' */
  dspcodegen_FIRRateConverter_e_T gobj_1;/* '<S1>/Sample-Rate Converter' */
  dspcodegen_FIRFilter_ex_ecg_s_T gobj_0_g;/* '<S3>/Differentiator Filter' */
  dspcodegen_FIRFilter_ex_ecg_s_T gobj_1_c;/* '<S3>/Differentiator Filter' */
  dsp_SampleRateConverter_ex_ec_T obj; /* '<S1>/Sample-Rate Converter' */
  dsp_Differentiator_ex_ecg_sig_T obj_j;/* '<S3>/Differentiator Filter' */
  real_T FS;                           /* '<S3>/QRS Detection' */
  void *DifferentiatorFilter_PWORK;    /* '<S3>/Differentiator Filter' */
  struct {
    void *TimePtr;
    void *DataPtr;
    void *RSimInfoPtr;
  } FromWorkspace_PWORK;               /* '<S4>/From Workspace' */

  struct {
    void *TimePtr;
    void *DataPtr;
    void *RSimInfoPtr;
  } FromWorkspace_PWORK_g;             /* '<S5>/From Workspace' */

  struct {
    void *TimePtr;
    void *DataPtr;
    void *RSimInfoPtr;
  } FromWorkspace_PWORK_d;             /* '<S6>/From Workspace' */

  struct {
    void *TimePtr;
    void *DataPtr;
    void *RSimInfoPtr;
  } FromWorkspace_PWORK_f;             /* '<S7>/From Workspace' */

  struct {
    void *TimePtr;
    void *DataPtr;
    void *RSimInfoPtr;
  } FromWorkspace_PWORK_l;             /* '<S8>/From Workspace' */

  void *SampleRateConverter_PWORK;     /* '<S1>/Sample-Rate Converter' */
  real32_T Buffer_CircBuf[180];        /* '<S1>/Buffer' */
  real32_T BandpassFilter_states[256]; /* '<S3>/Bandpass Filter' */
  real32_T movingAvgwindow_states[15]; /* '<S3>/moving Avg window' */
  int32_T Buffer_inBufPtrIdx;          /* '<S1>/Buffer' */
  int32_T Buffer_outBufPtrIdx;         /* '<S1>/Buffer' */
  int32_T Buffer_bufferLength;         /* '<S1>/Buffer' */
  real32_T QRSDelay[50];               /* '<S3>/QRS Detection' */
  real32_T maxPeak;                    /* '<S3>/QRS Detection' */
  real32_T lastDatum;                  /* '<S3>/QRS Detection' */
  real32_T threshold;                  /* '<S3>/QRS Detection' */
  real32_T tempPeak;                   /* '<S3>/QRS Detection' */
  real32_T initMax;                    /* '<S3>/QRS Detection' */
  real32_T sbpeak;                     /* '<S3>/QRS Detection' */
  real32_T QSum;                       /* '<S3>/QRS Detection' */
  real32_T NSum;                       /* '<S3>/QRS Detection' */
  real32_T Qz[8];                      /* '<S3>/QRS Detection' */
  real32_T Nz[8];                      /* '<S3>/QRS Detection' */
  struct {
    int_T PrevIndex;
  } FromWorkspace_IWORK;               /* '<S4>/From Workspace' */

  struct {
    int_T PrevIndex;
  } FromWorkspace_IWORK_b;             /* '<S5>/From Workspace' */

  struct {
    int_T PrevIndex;
  } FromWorkspace_IWORK_p;             /* '<S6>/From Workspace' */

  struct {
    int_T PrevIndex;
  } FromWorkspace_IWORK_m;             /* '<S7>/From Workspace' */

  struct {
    int_T PrevIndex;
  } FromWorkspace_IWORK_o;             /* '<S8>/From Workspace' */

  int16_T count;                       /* '<S3>/QRS Detection' */
  int16_T qpkcnt;                      /* '<S3>/QRS Detection' */
  int16_T lastQRSDelay;                /* '<S3>/QRS Detection' */
  int16_T preBlankCnt;                 /* '<S3>/QRS Detection' */
  int16_T sbcount;                     /* '<S3>/QRS Detection' */
  int16_T zR[8];                       /* '<S3>/QRS Detection' */
  uint16_T timeSinceMax;               /* '<S3>/QRS Detection' */
  uint8_T nQ;                          /* '<S3>/QRS Detection' */
  uint8_T nN;                          /* '<S3>/QRS Detection' */
  uint8_T nR;                          /* '<S3>/QRS Detection' */
  boolean_T maxPeak_not_empty;         /* '<S3>/QRS Detection' */
  boolean_T RRSum_not_empty;           /* '<S3>/QRS Detection' */
  boolean_T objisempty;                /* '<S3>/Differentiator Filter' */
  boolean_T isInitialized;             /* '<S3>/Differentiator Filter' */
  boolean_T objisempty_m;              /* '<S1>/Sample-Rate Converter' */
  boolean_T isInitialized_b;           /* '<S1>/Sample-Rate Converter' */
} DW_ex_ecg_sigprocessing_T;

/* Parameters (auto storage) */
struct P_ex_ecg_sigprocessing_T_ {
  real_T ECGSignalSelector_K;          /* Mask Parameter: ECGSignalSelector_K
                                        * Referenced by: '<S2>/Gain'
                                        */
  real_T Constant_Value;               /* Expression: 1
                                        * Referenced by: '<S2>/Constant'
                                        */
  real32_T Buffer_ic;                  /* Computed Parameter: Buffer_ic
                                        * Referenced by: '<S1>/Buffer'
                                        */
  real32_T BandpassFilter_InitialStates;/* Computed Parameter: BandpassFilter_InitialStates
                                         * Referenced by: '<S3>/Bandpass Filter'
                                         */
  real32_T BandpassFilter_Coefficients[257];/* Computed Parameter: BandpassFilter_Coefficients
                                             * Referenced by: '<S3>/Bandpass Filter'
                                             */
  real32_T movingAvgwindow_InitialStates;/* Computed Parameter: movingAvgwindow_InitialStates
                                          * Referenced by: '<S3>/moving Avg window'
                                          */
  real32_T movingAvgwindow_Coefficients[16];/* Expression: ones(1, WinSize, 'single')/WinSize
                                             * Referenced by: '<S3>/moving Avg window'
                                             */
};

/* Real-time Model Data Structure */
struct tag_RTM_ex_ecg_sigprocessing_T {
  const char_T *errorStatus;

  /*
   * Timing:
   * The following substructure contains information regarding
   * the timing information for the model.
   */
  struct {
    uint32_T clockTick1;
    struct {
      uint16_T TID[4];
      uint16_T cLimit[4];
    } TaskCounters;
  } Timing;
};

/* Block parameters (auto storage) */
extern P_ex_ecg_sigprocessing_T ex_ecg_sigprocessing_P;

/* Block signals (auto storage) */
extern B_ex_ecg_sigprocessing_T ex_ecg_sigprocessing_B;

/* Block states (auto storage) */
extern DW_ex_ecg_sigprocessing_T ex_ecg_sigprocessing_DW;

/* Model entry point functions */
extern void ex_ecg_sigprocessing_initialize(void);
extern void ex_ecg_sigprocessing_step(int_T tid);
extern void ex_ecg_sigprocessing_terminate(void);

/* Real-time Model object */
extern RT_MODEL_ex_ecg_sigprocessing_T *const ex_ecg_sigprocessing_M;

/*-
 * The generated code includes comments that allow you to trace directly
 * back to the appropriate location in the model.  The basic format
 * is <system>/block_name, where system is the system number (uniquely
 * assigned by Simulink) and block_name is the name of the block.
 *
 * Use the MATLAB hilite_system command to trace the generated code back
 * to the model.  For example,
 *
 * hilite_system('<S3>')    - opens system 3
 * hilite_system('<S3>/Kp') - opens and selects block Kp which resides in S3
 *
 * Here is the system hierarchy for this model
 *
 * '<Root>' : 'ex_ecg_sigprocessing'
 * '<S1>'   : 'ex_ecg_sigprocessing/Convert Sample Rate to 200Hz'
 * '<S2>'   : 'ex_ecg_sigprocessing/ECG Signal Selector'
 * '<S3>'   : 'ex_ecg_sigprocessing/ECGSignalProcessing1'
 * '<S4>'   : 'ex_ecg_sigprocessing/ECG Signal Selector/ Mean Heart Rate = 160 bpm'
 * '<S5>'   : 'ex_ecg_sigprocessing/ECG Signal Selector/ Mean Heart Rate = 220 bpm'
 * '<S6>'   : 'ex_ecg_sigprocessing/ECG Signal Selector/ Mean Heart Rate = 45 bpm'
 * '<S7>'   : 'ex_ecg_sigprocessing/ECG Signal Selector/ Mean Heart Rate = 60 bpm '
 * '<S8>'   : 'ex_ecg_sigprocessing/ECG Signal Selector/ Mean Heart Rate = 82 bpm'
 * '<S9>'   : 'ex_ecg_sigprocessing/ECGSignalProcessing1/QRS Detection'
 */
#endif                                 /* RTW_HEADER_ex_ecg_sigprocessing_h_ */

/*
 * File trailer for generated code.
 *
 * [EOF]
 */
