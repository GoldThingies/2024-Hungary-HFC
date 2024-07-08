/PROG  A_MAIN_R2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Main Program - Robot 2";
PROG_SIZE	= 2291;
CREATE		= DATE 23-08-09  TIME 16:15:24;
MODIFIED	= DATE 24-01-08  TIME 11:33:44;
FILE_NAME	= A_MAIN_R2;
VERSION		= 0;
LINE_COUNT	= 100;
MEMORY_SIZE	= 2875;
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
   1:  !-- 2677 Dana ;
   2:  !-- 04 19 24 ;
   3:  !-- Main Program ;
   4:  !-- ROBOT 2 ;
   5:  !----------------- ;
   6:   ;
   7:  WAIT DI[44:ON :Tray Transfer Init Com]=ON    ;
   8:  CALL NOT_SAFE_XFER    ;
   9:J PR[1:Home] 100% CNT0    ;
  10:   ;
  11:  DO[41:ON :INITIALIZATION COMPLET]=ON ;
  12:  !-- Wait for Cycle Start ;
  13:  WAIT DI[41:OFF:AUTO CYCLE]=ON    ;
  14:J PR[1:Home] 100% CNT0    ;
  15:  CALL SAFE_XFER    ;
  16:  CALL TRAY_COMPLETE_CK_ROBOT2    ;
  17:   ;
  18:  LBL[10] ;
  19:  !----------------------- ;
  20:  !---- Main Sequence ---- ;
  21:  !----------------------- ;
  26:   ;
  36:  !-- Exchange Washer ;
  37:  IF (DI[72:ON :G1 Part Present]=OFF AND DI[80:OFF:G2 Part Present]=OFF AND DI[401:OFF:G2 from 260 OK] OR DI[440]),CALL A_Washer ;
  44:   ;
  45:  !-- Deadnest Exchange ;
  46:  IF (DI[72:ON :G1 Part Present] AND DO[422]),CALL Deadnest ;
  44:   ;
  45:  !-- Temperature ;
  46:  IF (DI[72:ON :G1 Part Present] AND DO[428:OFF:G1 BCR2 OK]),CALL A_Temperature ;
  44:   ;
  30:  !-- Check NOK Requests ;
  31:  IF (DI[72:ON :G1 Part Present]=ON AND DO[420:OFF:G1 BCR1 NOK]=ON),CALL NOK_R2 ;
  44:   ;
  48:  !-- Exchange GRSL ;
  49:  IF (DI[72:ON :G1 Part Present] AND DO[426:OFF:G1 from Temp Nest]),CALL A_GRSL ;
  44:   ;
  30:  !-- Check NOK Requests ;
  31:  IF (DI[72:ON :G1 Part Present]=ON AND DO[420:OFF:G1 BCR1 NOK]=ON),CALL NOK_R2 ;
  50:   ;
  51:  !-- Static Nest ;
  52:  IF (DI[80:OFF:G2 Part Present]=ON),CALL A_STATIC_ ;
  44:   ;
  30:  !-- Check NOK Requests ;
  31:  IF (DI[72:ON :G1 Part Present]=ON AND DO[420:OFF:G1 BCR1 NOK]=ON),CALL NOK_R2 ;
  50:   ;
  27:  !-- Pk Raw/Pl Fin ;
  28:  IF (DI[48:ON :TRANSFER AT SAFE]=ON AND DI[45:ON :TRAY AT PROCESS BAY]=ON AND DO[47:OFF:TRAY COMPLETE]=OFF AND DI[72:ON :G1 Part Present]=OFF AND DI[70:OFF:G1 Grip Released]=ON AND 
    :  DI[132:OFF:First Part Mode]=OFF),CALL A_OUTFEED ;
  32:   ;
  30:  !-- Check NOK Requests ;
  31:  IF (DI[72:ON :G1 Part Present]=ON AND DO[420:OFF:G1 BCR1 NOK]=ON),CALL NOK_R2 ;
  32:   ; 
  38:   ;
  59:  !-- Cycle Time ;
  60:  TIMER[1]=STOP ;
  61:  R[10:Cycle Time]=TIMER[1]    ;
  62:   ;
  63:  !-- Check for Cycle STOP ;
  64:  LBL[100] ;
  65:  IF (DI[42:OFF:CYCLE STOP]=ON) THEN ;
  66:J PR[1:Home] 75% FINE    ;
  67:  DO[42:OFF:CYCLE STOPPED]=ON ;
  68:  WAIT DI[41:OFF:AUTO CYCLE]=OFF    ;
  69:  DO[42:OFF:CYCLE STOPPED]=OFF ;
  70:  WAIT DI[41:OFF:AUTO CYCLE]=ON    ;
  71:  ENDIF ;
  72:   ;
  73:  !-- Check Purge Request ;
  74:  IF (F[20:OFF:All Machines Purged] AND DI[43:OFF:PURGE REQUEST] AND F[10:OFF:Grippers Empty]) THEN ;
  75:  !machines empty, end ** ;
  76:J PR[1:Home] 100% FINE    ;
  77:   ;
  78:  !-- Stack Tray ;
  79:  CALL SAFE_XFER    ;
  80:  DO[47:OFF:TRAY COMPLETE]=ON ;
  81:  WAIT DI[47:OFF:TRANSFER IN PROGRESS]=ON    ;
  82:  DO[47:OFF:TRAY COMPLETE]=OFF ;
  83:  R[6]=R[8]    ;
  84:  WAIT DI[45:ON :TRAY AT PROCESS BAY]=OFF    ;
  85:  WAIT  10.00(sec) ;
  86:  CALL PURGE_COMPLETE    ;
  87:  WAIT DI[41:OFF:AUTO CYCLE]=ON    ;
  88:  ENDIF ;
  89:   ;
  90:  !-- Jump to Main Loop ;
  98:   ;
  99:  JMP LBL[10] ;
 100:  END ;
/POS
/END
