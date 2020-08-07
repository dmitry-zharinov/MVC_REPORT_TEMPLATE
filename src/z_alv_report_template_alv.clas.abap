class Z_ALV_REPORT_TEMPLATE_ALV definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IO_DATA type ref to Z_ALV_REPORT_TEMPLATE_DATA .
  methods BUILD_ALV
    raising
      CX_STATIC_CHECK .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA:  mo_data TYPE REF TO z_alv_report_template_data.
ENDCLASS.



CLASS Z_ALV_REPORT_TEMPLATE_ALV IMPLEMENTATION.


  METHOD build_alv.
    TRY.
        cl_salv_table=>factory( IMPORTING r_salv_table = DATA(lo_salv)
                                CHANGING  t_table      = mo_data->mt_data  ).
        lo_salv->display( ).

      CATCH cx_salv_msg INTO DATA(lo_err).
        "Raise error
    ENDTRY.
  ENDMETHOD.


  METHOD constructor.
    mo_data = io_data.
  ENDMETHOD.
ENDCLASS.
