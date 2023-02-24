*&---------------------------------------------------------------------*
*& Report z60secdev_prog_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z60secdev_prog_01.

CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS run.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD run.

    cl_salv_gui_table_ida=>create_for_cds_view( 'ZCDS_60SECSDEV_02' )->fullscreen(  )->display(  ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  lcl_main=>run( ).
