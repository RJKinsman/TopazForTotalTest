//HCHRJK0A JOB ('#SALESSUP'),'TTT        ', TYPRUN=SCAN,
//             CLASS=A,MSGCLASS=R,NOTIFY=&SYSUID,REGION=0M
/*JOBPARM S=*
//*
//********************************************************************
//* Execute Target Runner
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR
//*
//* You need to modify the following DD statements.
//*
//* The first DD statement should be changed to the loadlib 
//* containing the Topaz for Total Test 'TTTRUNNR" program.
//*
//* The second DD statement should be changed to the loadlib
//* containing the programs to run during the test.
//*
//* The third DD statement is only required if running the JCL 
//* from Topaz for Total Test CLI with Code Coverage support.
//* If testing an LE application it should be changed to the
//* loadlib containing the COBOL runtime(CEE.SCEERUN), otherwise 
//* it can be removed.
/*
//STEPLIB  DD   DSN=CEE.SCEERUN,DISP=SHR
//         DD   DISP=SHR,DSN=SALESSUP.ISPW.PLAY.DEV1.LOAD   
//         DD   DISP=SHR,DSN=SYS2.CW.&CWGACX..SLCXLOAD 
//*        DD   DISP=SHR,DSN=SALESSUP.GENAPP.ISPW.DEV1.LOAD
//         DD   DISP=SHR,DSN=HCHRJK0.WBSAMP.LOAD
//*
//EMPFILE  DD   DSN=&SYSUID..WBSAMP.JCL(CWXTDATA),DISP=SHR
//RPTFILE  DD   SYSOUT=*
//SYSOUT   DD   SYSOUT=*
//TRPARM DD *
*
*        Optionally set your custom exit program here:
* 
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(ON)
/* 
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*
//*      Optionally add your custom DD statements
//*DD1 DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*
//*
