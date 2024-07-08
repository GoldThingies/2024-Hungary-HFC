/PROG  A_Washer_IG08624RH_R1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "IG08624RH Robot 1";
PROG_SIZE	= 2511;
CREATE		= DATE 23-06-19  TIME 15:09:18;
MODIFIED	= DATE 23-07-20  TIME 08:36:40;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 114;
MEMORY_SIZE	= 2983;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
/MN
   1:  !-- 2677 DANA ;
   2:  !-- 04 30 24 ;
   3:  !-- Exchange Washer ;
   4:  !-- Input Gear  Robot 1;
   5:  !----------------------------- ;
   6:  !-- CHANGE TOOL AND USER FRAME ;
   7:  UTOOL_NUM=2 ;
   8:  UFRAME_NUM=9 ;
   9:J PR[5:Safe Washer Side] 100% CNT50    ;
  10:   ;
  11:  WAIT (DI[148:OFF:Wash Part 1 Req for L] OR DI[147:OFF:Wash Part 1 Req for U] OR DI[42:OFF:CYCLE STOP])    ;
  12:  IF (DI[42:OFF:CYCLE STOP]),JMP LBL[1000] ;
  70:   ;
  71:  !-- PLACE TO WASH ;
  72:  !----------------------------- ;
  73:  IF (DI[148:OFF:Wash Part 1 Req for L]=ON AND DO[439:OFF:G2 from 260 OK]=ON) THEN ;
  17:  !-- CLOSE GRIPPER ;
  18:  !-- Gripper 2 Shall Remain Closed ;
  74:  !-- RESET SAFE OUTSIDE WASH ;
  75:  DO[146:ON :Robot Clear Wash]=OFF ;
  21:  WAIT (DI[146:OFF:Wash MT Clear])    ;
  11:  WAIT (DI[148:OFF:Wash Part 1 Req for L] OR DI[42:OFF:CYCLE STOP])    ;
  20:  !-- OFFSET SELECT BASED ON PART TYPE ;
  20:  IF (F[23] OR F[24]),JMP LBL[1] ;
  76:  !-- CHANGE TOOL AND USER FRAME ;
  77:  UTOOL_NUM=2 ;
  78:  UFRAME_NUM=9 ;
  20:  !-- Approach - Gripper 2 ;
  80:J PR[51] 100% CNT50 Offset   ;
  81:  UTOOL_NUM=2 ;
  82:J PR[R[103]] 100% CNT10 Tool_Offset,PR[R[93]]    ;
  28:   ;
  83:  !-- ADJUST COLLISION DETECT ;
  84:  COL GUARD ADJUST R[39] ;
  86:L PR[R[103]] 250mm/sec FINE Tool_Offset,PR[R[93]]    ;
  87:  !-- OPEN GRIPPER ;
  88:  CALL GRIP_2_OPEN    ;
 100:  WAIT    .50(sec) ;
  85:   ;
  35:  !-- Part Tracking ;
  89:  DO[439:OFF:G2 from 260 OK]=OFF ;
  90:   ;
  91:L PR[R[103]] 2000mm/sec CNT10 Tool_Offset,PR[R[93]]    ;
  92:   ;
  20:  !-- Retreat - Gripper 2 ;
  93:J PR[51] 100% CNT50   ;
  95:  !-- ADJUST COLLISION DETECT ;
  96:  COL GUARD ADJUST R[38] ;
  92:   ;
  35:  !-- Part Tracking - At Safe Position;
  97:  DO[148:OFF:Part 1 Loaded Wash]=ON ;
  98:  WAIT (DI[148:OFF:Wash Part 1 Req for L]=OFF)    ;
  99:  DO[148:OFF:Part 1 Loaded Wash]=OFF ;
 100:   ;
 101:  ENDIF ;
 102:   ;
  20:  LBL[1]  ;
  20:  !-- OFFSET SELECT FOR ASSEMBLY AND OUTPUT GEAR ;
  76:  !-- CHANGE TOOL AND USER FRAME ;
  77:  UTOOL_NUM=2 ;
  78:  UFRAME_NUM=9 ;
  20:  !-- Approach - Gripper 2 ;
  26:  CALL SET_OFFS(26,0,0,0,(-90),0,0) ;
  80:J PR[51] 100% CNT50 Offset, PR[26]   ;
  82:J PR[R[103]] 100% CNT10 Tool_Offset,PR[14]    ;
  28:   ;
  83:  !-- ADJUST COLLISION DETECT ;
  84:  COL GUARD ADJUST R[39] ;
  86:L PR[R[103]] 250mm/sec FINE    ;
  87:  !-- OPEN GRIPPER ;
  88:  CALL GRIP_2_OPEN    ;
 100:  WAIT    .50(sec) ;
  85:   ;
  35:  !-- Part Tracking ;
  89:  DO[439:OFF:G2 from 260 OK]=OFF ;
  90:   ;
  91:L PR[R[103]] 2000mm/sec CNT10 Tool_Offset,PR[15]    ;
  92:   ;
  20:  !-- Retreat - Gripper 2 ;
  26:  CALL SET_OFFS(26,0,0,0,(-90),0,0) ;
  93:J PR[51] 100% CNT50 offset, PR[26]  ;
  95:  !-- ADJUST COLLISION DETECT ;
  96:  COL GUARD ADJUST R[38] ;
  92:   ;
  35:  !-- Part Tracking - At Safe Position;
  97:  DO[148:OFF:Part 1 Loaded Wash]=ON ;
  98:  WAIT (DI[148:OFF:Wash Part 1 Req for L]=OFF)    ;
  99:  DO[148:OFF:Part 1 Loaded Wash]=OFF ;
 100:   ;
 101:  ENDIF ;
 103:  LBL[1000] ;
 104:  !-- CHANGE TOOL AND USER FRAME ;
 105:  UTOOL_NUM=2 ;
 106:  UFRAME_NUM=9 ;
 107:   ;
 108:  DO[148]=OFF ;
 109:   ;
 110:  !-- MOVE TO SAFE ;
 111:J PR[5:Safe Washer Side] 100% CNT50    ;
 112:  DO[146:ON :Robot Clear Wash]=ON ;
 113:   ;
 114:  END ;
/POS
/END
