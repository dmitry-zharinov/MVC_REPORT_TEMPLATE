CLASS z_alv_report_template_alv DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS constructor IMPORTING io_data TYPE REF TO z_alv_report_template_data.
    METHODS build_alv RAISING cx_static_check.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:  mo_data TYPE REF TO z_alv_report_template_data.
ENDCLASS.



CLASS z_alv_report_template_alv IMPLEMENTATION.
  METHOD constructor.
    mo_data = io_data.
  ENDMETHOD.

  METHOD build_alv.
    TRY.
        cl_salv_table=>factory( IMPORTING r_salv_table = DATA(lo_salv)
                                CHANGING  t_table      = mo_data->mt_data  ).
        lo_salv->display( ).

      CATCH cx_salv_msg INTO DATA(lo_err).
        "Raise error
    ENDTRY.
  ENDMETHOD.

ENDCLASS.
