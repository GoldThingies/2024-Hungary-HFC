/PROG  A_BCR1
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "BARCODE 1";
PROG_SIZE	= 1273;
CREATE		= DATE 23-04-14  TIME 13:00:06;
MODIFIED	= DATE 23-06-06  TIME 10:57:46;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 59;
MEMORY_SIZE	= 1685;
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
   2:  !-- 04 26 2024 ;
   3:  !-- BARCODE READER 1 ;
   4:  !-- ********** ;
   5:  !----------------------------- ;
   6:   ;
  99:  !-- CHANGE TOOL AND USER FRAME ;
  10:  UTOOL_NUM=9 ;
  11:  UFRAME_NUM=1 ;
  12:J PR[9] 100% CNT0    ;
  6:   ;
  98:  IF (DI[72:ON :G1 Part Present]=ON) THEN ;
  99:  !-- CHANGE TOOL AND USER FRAME ;
 100:  UTOOL_NUM=1 ;
 101:  UFRAME_NUM=1 ;
 102:J PR[280] 100% CNT50    ;
 103:  COL GUARD ADJUST R[39] ;
 104:  !-- APPROACH ;
 105:L PR[R[104]] 1500mm/sec CNT10 Tool_Offset,PR[R[93]]    ;
   6:   ;
  33:  !-- PLACE THE PART ;
 107:L PR[R[104]] 500mm/sec FINE    ;
  35:  !-- OPEN GRIPPER ;
  49:  CALL GRIP_1_OPEN    ;
 100:  WAIT    .50(sec) ;
   6:   ;
 120:  !-- LEAVE POSITION ;
 121:L PR[R[104]] 2000mm/sec CNT10 Tool_Offset,PR[R[93]]    ;.
 122:   ;
 120:  !-- CAMERA READ SAFE POSITION ;
 124:J PR[280] 100% CNT50    ;
 122:   ;
 108:  !-- TRIGGER READER ;
 109:  DO[257:OFF:Camera 1 Trigger]=PULSE,0.5sec ;
 110:  WAIT (DI[258:ON :Camera 1 Complete]=ON OR DI[259:OFF:Camera 1 Fail]=ON OR DI[260:OFF:Camera 1 NOK]=ON OR DI[261:OFF:Camera 1 SPC]=ON)    ;
 122:   ;
 104:  !-- APPROACH ;
 105:L PR[R[104]] 2000mm/sec CNT10 Tool_Offset,PR[R[93]]    ;
   6:   ;
  33:  !-- PICK THE PART ;
 107:L PR[R[104]] 500mm/sec FINE    ;
  35:  !-- OPEN GRIPPER ;
  49:  CALL GRIP_1_CLOSE    ;
 100:  WAIT    .50(sec) ;
   6:   ;
 122:   ;
 108:  !-- CAMERA READER PART HANDLING ;
 111:  IF (DI[258:ON :Camera 1 Complete]=ON OR DI[261:OFF:Camera 1 SPC]=ON) THEN ;
 112:  DO[417:OFF:G1 Raw from Tray]=OFF ;
 113:  DO[419:ON :G1 BCR1 OK]=ON ;
 114:  ENDIF ;
 115:  IF (DI[259:OFF:Camera 1 Fail]=ON OR DI[260:OFF:Camera 1 NOK]=ON) THEN ;
 116:  DO[417:OFF:G1 Raw from Tray]=OFF ;
 117:  DO[420:OFF:G1 BCR1 NOK]=ON ;
 118:  ENDIF ;
 119:  DO[258:OFF:Camera1 Read Finished]=PULSE,0.5sec ;
 125:   ;
 120:  !-- LEAVE POSITION ;
 121:L PR[R[104]] 2000mm/sec CNT10 Tool_Offset,PR[R[93]]    ;
 122:   ;
 123:  COL GUARD ADJUST R[38] ;
 120:  !-- LEAVE POSITION ;
 124:J PR[280] 100% CNT50    ;
 125:   ;
  10:  UTOOL_NUM=9 ;
  11:  UFRAME_NUM=1 ;
  104:  !-- RETREAT ;
  12:J PR[9] 100% CNT0    ;
   6:   ;
  59:  END ;
/POS
/END
