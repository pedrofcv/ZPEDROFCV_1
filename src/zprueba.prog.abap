*&---------------------------------------------------------------------*
*& Report ZPRUEBA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zprueba.

PARAMETER: p_path TYPE string MODIF ID src. "+@002

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_path.

  CALL METHOD cl_gui_frontend_services=>directory_browse
    EXPORTING
      window_title    = 'Seleccione el directorio donde se descargaran los archivos'
      initial_folder  = 'C:\'
    CHANGING
      selected_folder = p_path
    EXCEPTIONS
      cntl_error      = 1
      error_no_gui    = 2.

START-OF-SELECTION.

  SELECT rbukrs AS bukrs, gjahr, belnr, hsl AS dmbtr, ksl AS dmbe2
    FROM acdoca
    INTO TABLE @DATA(ltd_acdoc).

  CHECK ltd_acdoc[] IS NOT INITIAL.

  p_path = p_path && '\PRUEBA.TXT'.

  zcl_fi_ple_sunat=>download_file_sunat(
    EXPORTING
      iv_path   = p_path
      it_table  = ltd_acdoc ).
