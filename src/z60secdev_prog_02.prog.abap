*&---------------------------------------------------------------------*
*& Report z60secdev_prog_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z60secdev_prog_02.

TABLES: scarr.

SELECTION-SCREEN BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-001.

SELECT-OPTIONS: s_carr FOR scarr-carrid OBLIGATORY.

SELECTION-SCREEN END OF BLOCK b1.


CLASS lcl_main DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS run.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA lv_answ TYPE xfeld.

ENDCLASS.

CLASS lcl_main IMPLEMENTATION.

  METHOD run.
    DATA(lo_alv_ida) = cl_salv_gui_table_ida=>create_for_cds_view( 'ZCDS_60SECSDEV_02' ).
    DATA(lo_collector) = NEW cl_salv_range_tab_collector(  ).

    lo_collector->add_ranges_for_name(
      EXPORTING
        iv_name   = 'CARRID'
        it_ranges = s_carr[]
    ).

    lo_collector->get_collected_ranges(
      IMPORTING
        et_named_ranges = DATA(lt_range)
    ).

    lo_alv_ida->set_select_options(
      EXPORTING
        it_ranges    = lt_range
*        io_condition =
    ).
*    CATCH cx_salv_ida_associate_invalid. " Superclass for all dynamic ALV IDA exceptions
*    CATCH cx_salv_db_connection.         " Error connecting to database
*    CATCH cx_salv_ida_condition_invalid. " Superclass for all dynamic ALV IDA exceptions
*    CATCH cx_salv_ida_unknown_name.      " Unknown name: FieldName,DataElementName,...

   CALL FUNCTION 'POPUP_TO_CONFIRM'
    EXPORTING
      titlebar      = 'Ejecutar ALV'
      text_question = 'Confirma que desea ejecutar el ALV'
    IMPORTING
      answer        = lv_answ  .


  CHECK lv_answ EQ '1'.

    lo_alv_ida->fullscreen(  )->display(  ).

  ENDMETHOD.

ENDCLASS.

START-OF-SELECTION.
  lcl_main=>run( ).
