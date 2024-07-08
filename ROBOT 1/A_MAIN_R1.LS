/PROG  A_MAIN_R1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "Main Program - Robot 1";
PROG_SIZE	= 2291;
CREATE		= DATE 23-08-09  TIME 16:15:24;
MODIFIED	= DATE 24-01-08  TIME 11:33:44;
FILE_NAME	= A_MAIN_R1;
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
   4:  !-- ROBOT 1 ;
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
  16:  CALL TRAY_COMPLETE_CK_ROBOT1    ;
  17:   ;
  18:  LBL[10] ;
  19:  !----------------------- ;
  20:  !---- Main Sequence ---- ;
  21:  !----------------------- ;
  26:   ;
  27:  !-- Pick Raw Part ;
  28:  IF (DI[48:ON :TRANSFER AT SAFE]=ON AND DI[45:ON :TRAY AT PROCESS BAY]=ON AND DO[47:OFF:TRAY COMPLETE]=OFF AND DI[72:ON :G1 Part Present]=OFF AND DI[70:OFF:G1 Grip Released]=ON AND 
    :  DI[132:OFF:First Part Mode]=OFF),CALL A_INFEED ;
  29:   ;
  30:  !-- Barcode Reader ;
  31:  IF (DI[72:ON :G1 Part Present]=ON AND DO[417]=ON),CALL A_BCR1 ;
  32:   ;
  30:  !-- Check NOK Requests ;
  31:  IF (DI[72:ON :G1 Part Present]=ON AND DO[420:OFF:G1 BCR1 NOK]=ON),CALL NOK_HANDOFFR1 ;
  32:   ;
  33:  !-- Exchange 260GX ;
  34:  IF (DI[72:ON :G1 Part Present] AND DO[419:ON :G1 BCR1 OK]),CALL A_260GX ;
  35:   ;
  36:  !-- Exchange Washer ;
  37:  IF (DI[80:OFF:G2 Part Present] AND DO[439:OFF:G2 from 260 OK] OR DO[420] OR DO[440]),CALL A_Washer_R1 ;
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
  83:  R[5:Tray Pos(Raw)]=R[7]    ;
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
