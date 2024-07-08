/PROG  A_DATA_IG08624RH
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "IG08624RH";
PROG_SIZE	= 659;
CREATE		= DATE 23-02-20  TIME 13:54:46;
MODIFIED	= DATE 23-06-24  TIME 05:11:12;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 30;
MEMORY_SIZE	= 911;
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
   1:  !-- IG08624RH ;
   1:  !-- Input Gear - Right Hand ;
   2:  R[130:Payload Empty]=1   ;
   3:  R[131:Payload Gripper1]=2    ;
   4:  R[132:Payload Gripper2]=3    ;
   5:  R[134:Payload Full]=4    ;
   6:   ;
   7:  R[7:1st Pocket PK PR]=201    ;
   8:  R[8:1st Pocket PL PR]=201    ;
   9:  R[92:Num Of Tray Pos]=24    ;
  10:   ;
   9:  R[93]=19    ;
  10:   ;
  11:  R[30:Tray Complete Rw]=224    ;
  12:  R[31:Tray Comp Fin]=224    ;
  13:   ;
  14:  R[100:260GX PK PR G2]=32    ;
  15:  R[101:260GX PL PR G1]=36    ;
  6:   ;
  16:  R[102:Washer PK PR G1]=52    ;
  17:  R[103:Washer PL PR G2]=56    ;
  6:   ;
  18:  R[104:Trace Cam1 PR G1]=1    ;
  19:  R[105:Trace Cam2 PR G1]=1    ;
  6:   ;
  20:  R[106:Temp Nest1 PR G1]=61    ;
  21:  R[107:Temp Nest2 PR G1]=65    ;
  6:   ;
  22:  R[108:GRSL Pick PR G2]=72   ;
  23:  R[109:GRSL Place PR G1]=76    ;
  6:   ;
  24:  R[110:Stat Nest1 PR G2]=81    ;
  25:  R[111:Stat Nest2 PR G2]=85    ;
  6:   ;
  25:  R[114]=331   ;
  25:  R[115]=341   ;
  6:   ;
  25:  R[116]=111   ;
  25:  R[117]=117   ;
  6:   ;
  25:  R[118]=322   ;
  25:  R[119]=326   ;
  6:   ;
  25:  R[120]=280   ;
  25:  R[121]=286   ;
  26:  !-- R[112] and R[113] ;
  27:  !-- assigned in NOK_PR ;
  30:  END ;
/POS
/END
