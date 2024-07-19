/PROG  A_DEADNESTR2
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "DEADNEST";
PROG_SIZE	= 4291;
CREATE		= DATE 23-07-29  TIME 13:44:28;
MODIFIED	= DATE 23-08-29  TIME 08:36:16;
FILE_NAME	= TEMPERAT;
VERSION		= 0;
LINE_COUNT	= 195;
MEMORY_SIZE	= 4815;
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
   2:  !-- 06 26 24 ;
   3:  !-- DEADNEST ;
   4:  !-- ******** ;
   5:  !----------------------------- ;
   6:   ;
   8:  !-- CHANGE TOOL AND USER FRAME ;
   9:  UTOOL_NUM=9 ;
  10:  UFRAME_NUM=1 ;
  11:J PR[8] 100% CNT50    ;
  12:   ;
  13:  !-- PLACE G1, PICK NONE ;
  14:  !----------------------------- ;
  15:  IF (DI[217]=OFF AND DI[72:ON :G1 Part Present]=ON AND DI[80]=OFF) THEN ;
  16:  !-- CHANGE TOOL AND USER FRAME ;
  17:  UTOOL_NUM=9 ;
  18:  UFRAME_NUM=1 ;
  19:J PR[280] 100% CNT50    ;
  20:  !-- APPROACH ;
  21:  UTOOL_NUM=1 ;
  22:  UFRAME_NUM=1 ;
  23:J PR[R[120]] 100% CNT10 Tool_Offset,PR[13:-75mm Z Offset]    ;
  24:  COL GUARD ADJUST R[39] ;
  25:  !-- PLACE PART ;
  26:L PR[R[120]] 500mm/sec FINE    ;
  27:  !-- OPEN GRIPPER ;
  28:  CALL GRIP_1_OPEN    ;
  29:  DO[422]=OFF ;  
  30:  DO[221:OFF:Part Placed Temp 1]=PULSE,0.5sec ;
  31:  !-- LEAVE POSITION ;
  32:L PR[R[120]] 500mm/sec CNT10 Tool_Offset,PR[13:-75mm Z Offset]    ;
  33:    ;
  73:  UTOOL_NUM=9 ;
  74:  UFRAME_NUM=1 ;
  34:J PR[280] 100% CNT50   ;
  35:    ;
  36:  JMP LBL[90] ;
  37:  ENDIF ;
  38:   ;
  39:  !-- PICK G2, PLACE G1 ;
  40:  !----------------------------- ;
  41:  LBL[10] ;
  72:  !-- PICK SEQUENCE GRIPPER 2;
  73:  UTOOL_NUM=9 ;
  74:  UFRAME_NUM=1 ;
  75:J PR[281] 100% CNT50    ;
  83:   ;
  84:  IF (DI[217]=ON AND DI[72:ON :G1 Part Present]=OFF) THEN ;
    54:  !-- OPEN GRIPPER ;
  55:  CALL GRIP_2_OPEN    ;
  85:  !-- APPROACH ;
  86:  UTOOL_NUM=2 ;
  87:  UFRAME_NUM=1 ;
  88:L PR[R[121]] 2000mm/sec CNT10 Tool_Offset,PR[10:-75mm Z Offset]    ;
  89:  COL GUARD ADJUST R[39] ;
  90:  !-- PICK PART ;
  91:L PR[R[121]] 2000mm/sec FINE    ;
  92:  !-- CLOSE GRIPPER ;
  93:  CALL GRIP_2_CLOSE    ;
  94:  !-- LEAVE POSITION ;
  95:L PR[R[121]] 4000mm/sec CNT10 Tool_Offset,PR[10:-75mm Z Offset]    ;
  96:  IF (DI[72:ON :G1 Part Present]=ON) THEN ;
  97:  DO[422]=OFF ;
  97:  DO[453]=ON ;
  98:  DO[219]=PULSE,0.5sec ;
  99:  ENDIF ;
 100:  COL GUARD ADJUST R[38] ;
 101:   ;
 102:  UTOOL_NUM=9 ;
 103:  UFRAME_NUM=1 ;
 105:J PR[281] 100% CNT50    ;
  42:  IF (DI[214:OFF:Temp Part 1 Present]=ON AND DI[72:ON :G1 Part Present]=ON AND DI[80]=OFF) THEN ;
  47:  !-- PLACE SEQUENCE GRIPPER 1 ;
  48:  UTOOL_NUM=1 ;
  49:  UFRAME_NUM=1 ;
  50:J PR[R[120] ] 100% CNT10 Tool_Offset,PR[13:-75mm Z Offset]    ;
  51:  COL GUARD ADJUST R[39] ;
  52:  !-- PLACE PART ;
  53:L PR[R[120]] 2000mm/sec FINE    ;
  54:  !-- OPEN GRIPPER ;
  55:  CALL GRIP_1_OPEN    ;
  56:  DO[433]=ON ;
  57:  DO[217]=PULSE,0.5sec ;
  58:  !-- LEAVE POSITION ;
  59:L PR[R[120]] 4000mm/sec CNT10 Tool_Offset,PR[13:-75mm Z Offset]    ;
 100:  COL GUARD ADJUST R[38] ;
  60:   ;
  63:  UTOOL_NUM=9 ;
  64:  UFRAME_NUM=1 ;
  46:J PR[281] 100% CNT50    ;
 106:  JMP LBL[90] ;
 107:  ENDIF ;
 108:  ENDIF ;
 109:   ;
 185:  LBL[90] ;
 186:  !-- CHANGE TOOL AND USER FRAME ;
 187:  UTOOL_NUM=9 ;
 188:  UFRAME_NUM=1 ;
 192:J PR[R[8]] 100% CNT50    ;
 193:   ;
 194:  LBL[100] ;
 195:  END ;
/POS
/END
