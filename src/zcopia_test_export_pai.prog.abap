*&---------------------------------------------------------------------*
*&  Include           ZFI4B_PE_P_PAGO_DTR_PAI
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
MODULE user_command_0100 INPUT.

  CASE sy-ucomm.
    WHEN 'VIS'.
*      AUTHORITY-CHECK OBJECT 'ZDETRPAG'
*      ID 'ACTVT' FIELD '03'.
*      IF sy-subrc = 0.
        p_mode = 'V'.
        EXPORT p_mode TO MEMORY ID 'MODECALL'.
        CALL TRANSACTION 'ZFI4B_PE_PAGODTRRP01'.
*      ELSE.
*        MESSAGE text-e01 TYPE 'E'.
*      ENDIF.
    WHEN 'PRO'.
*      AUTHORITY-CHECK OBJECT 'ZDETRPAG'
*      ID 'ACTVT' FIELD '02'.
*      IF sy-subrc = 0.
        p_mode = 'P'.
        EXPORT p_mode TO MEMORY ID 'MODECALL'.
        CALL TRANSACTION 'ZFI4B_PE_PAGODTRRP01'.
*      ELSE.
*        MESSAGE text-e01 TYPE 'E'.
*      ENDIF.
    WHEN 'LOG'.
*      AUTHORITY-CHECK OBJECT 'ZDETRLOG'
*      ID 'ACTVT' FIELD '02'.
*      IF sy-subrc = 0.
        CALL TRANSACTION 'ZFI4B_PE_DETR'.
*      ELSE.
*        MESSAGE text-e01 TYPE 'E'.
*      ENDIF.
    WHEN 'UPD'.
*      AUTHORITY-CHECK OBJECT 'ZDETRUPD'
*      ID 'ACTVT' FIELD '02'.
*      IF sy-subrc = 0.
        CALL TRANSACTION 'ZFI4B_PE_PAGODTRRP02'.
*      ELSE.
*        MESSAGE text-e01 TYPE 'E'.
*      ENDIF.
    WHEN 'LOT'.
*      AUTHORITY-CHECK OBJECT 'ZDETRLOT'
*      ID 'ACTVT' FIELD '02'.
*      IF sy-subrc = 0.
        CALL TRANSACTION 'ZFI4B_PE_LOTE_CONF'.
*      ELSE.
*        MESSAGE text-e01 TYPE 'E'.
*      ENDIF.
    WHEN 'REP'.
*      AUTHORITY-CHECK OBJECT 'ZDETRREP'
*      ID 'ACTVT' FIELD '02'.
*      IF sy-subrc = 0.
        CALL TRANSACTION 'ZFI4B_PE_PAGODTRRP03'.
*      ELSE.
*        MESSAGE text-e01 TYPE 'E'.
*      ENDIF.
    WHEN 'BACK' OR 'CANCEL' OR 'EXIT'.
      LEAVE PROGRAM.
  ENDCASE.

  CLEAR sy-ucomm.

ENDMODULE.                 " USER_COMMAND_0100  INPUT
