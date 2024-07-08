/PROG  A_INFEED_IG08624RH
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "INFEED IG08624RH";
PROG_SIZE	= 3109;
CREATE		= DATE 23-06-19  TIME 15:10:40;
MODIFIED	= DATE 23-08-14  TIME 10:44:22;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 141;
MEMORY_SIZE	= 3625;
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
   2:  !-- 04 24 24 ;
   3:  !-- INFEED TRAY ;
   4:  !-- IG08624RH ;
   5:  !----------------------------- ;
   6:  !-- TRANSFER NOT SAFE ;
   7:  CALL NOT_SAFE_XFER    ;
   8:   ;
   9:  !-- CHANGE TOOL AND USER FRAME ;
  10:  UTOOL_NUM=4 ;
  11:  UFRAME_NUM=1 ;
  12:J PR[3:Safe Tray Side] 100% CNT0    ;
  13:  !CHECK TRAY COUNTER ;
  14:  CALL TRAY_COUNT_ER_CK_ROBOT1    ;
  15:  !IF NO TRAY PROCESS BAY ;
  16:  CALL TRAY_COMPLETE_CK_ROBOT1    ;
  17:  !-- PICK FROM TRAY ;
  18:  !----------------------------- ;
  19:  IF (DI[72:ON :G1 Part Present]=OFF AND DI[45:ON :TRAY AT PROCESS BAY]=ON) THEN ;
  20:  !-- CHANGE TOOL AND USER FRAME ;
  21:  UTOOL_NUM=1 ;
  22:  UFRAME_NUM=2 ;
  23:J PR[200] 100% CNT50    ;
  24:  !-- OPEN GRIPPER ;
  25:  CALL GRIP_1_OPEN    ;
  26:  !-- APPROACH THE POCKET ;
  27:  LBL[10] ;
  28:   ;
  30:  !Safe Above Approach ;
  31:J PR[R[5]] 100% CNT10 Tool_Offset,PR[13:-150mm Z Offse]    ;
  32:  COL GUARD ADJUST R[39] ;
  33:  !-- PICK THE PART ;
  34:L PR[R[5]] 500mm/sec FINE    ;
  35:  !-- CLOSE GRIPPER ;
  36:  CALL GRIP_1_CLOSE    ;
  37:  !-- LEAVE POCKET ;
  38:L PR[R[5]] 500mm/sec CNT10 Tool_Offset,PR[13:-150mm Z Offse]    ;
  39:  !-- ADJUST COLLISION DETECT ;
  40:  COL GUARD ADJUST R[38] ;
  41:  !-- MOVE TO SAFE ABOVE TRAY ;
  42:J PR[200] 100% CNT50    ;
  43:   ;
  44:  IF (DI[72:ON :G1 Part Present]=ON) THEN ;
  45:  DO[417:OFF:G1 Raw from Tray]=ON ;
  46:  DO[464:ON :Tray Empty Pocket]=ON ;
  47:  ENDIF ;
  48:  IF (DI[72:ON :G1 Part Present]=OFF) THEN ;
  49:  CALL GRIP_1_OPEN    ;
  50:  DO[417:OFF:G1 Raw from Tray]=OFF ;
  51:  !-- INCREASE THE PART COUNTER ;
  52:  R[5:Tray Pos(Raw)]=R[5:Tray Pos(Raw)]+1    ;
  53:  IF (R[5:Tray Pos(Raw)]>R[30:Tray Complete Rw]),JMP LBL[20] ;
  54:   ;
  55:  IF (DO[417:OFF:G1 Raw from Tray]=OFF AND R[5:Tray Pos(Raw)]<=R[30:Tray Complete Rw] AND DI[42:OFF:CYCLE STOP]=OFF AND DI[43:OFF:PURGE REQUEST]=OFF),JMP LBL[10] ;
  56:  ENDIF ;
  57:  ENDIF ;
 126:  !-- CHANGE TOOL AND USER FRAME ;
 127:  UTOOL_NUM=1 ;
 128:  UFRAME_NUM=2 ;
 129:J PR[260:Safe Above P4611] 100% CNT50    ;
 130:  ENDIF ;
 131:  !******************************** ;
 132:  LBL[20] ;
 133:  DO[288:OFF:Lock SPC Drawer]=OFF ;
 134:  !-- CHANGE TOOL AND USER FRAME ;
 135:  UTOOL_NUM=1 ;
 136:  UFRAME_NUM=1 ;
 137:J PR[3:Safe Tray Side] 100% CNT50    ;
 138:  CALL SAFE_XFER    ;
  16:  CALL TRAY_COMPLETE_CK_ROBOT1    ;
 140:   ;
 141:  END ;
/POS
/END
