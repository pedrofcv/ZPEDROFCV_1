*---------------------------------------------------------------------*
*    view related data declarations
*---------------------------------------------------------------------*
*...processing: ZPRUEBA_1.......................................*
DATA:  BEGIN OF STATUS_ZPRUEBA_1                     .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZPRUEBA_1                     .
CONTROLS: TCTRL_ZPRUEBA_1
            TYPE TABLEVIEW USING SCREEN '0001'.
*.........table declarations:.................................*
TABLES: *ZPRUEBA_1                     .
TABLES: ZPRUEBA_1                      .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
