class Z_ALV_REPORT_TEMPLATE_DATA definition
  public
  final
  create public

  global friends Z_ALV_REPORT_TEMPLATE_ALV .

public section.

  methods CONSTRUCTOR
    importing
      !IO_SEL type ref to Z_ALV_REPORT_TEMPLATE_SEL .
  methods GET_DATA
    returning
      value(RT_DATA) type EDOC_BUKRS_TAB
    raising
      CX_STATIC_CHECK .
  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mt_data TYPE tt_afvv,
          mo_sel  TYPE REF TO z_alv_report_template_sel.

ENDCLASS.



CLASS Z_ALV_REPORT_TEMPLATE_DATA IMPLEMENTATION.


  METHOD constructor.
    mo_sel = io_sel.
  ENDMETHOD.


  METHOD get_data.
    DATA(l_bukrs) = mo_sel->m_bukrs.
    DATA(l_usr) = mo_sel->mr_usr.
    APPEND INITIAL LINE TO mt_data.
    "Выборка из БД

  ENDMETHOD.
ENDCLASS.
