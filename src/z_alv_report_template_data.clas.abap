CLASS z_alv_report_template_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
    GLOBAL FRIENDS z_alv_report_template_alv.


  PUBLIC SECTION.
    METHODS constructor IMPORTING io_sel TYPE REF TO z_alv_report_template_sel.
    METHODS get_data RETURNING VALUE(rt_data) TYPE EDOC_BUKRS_TAB RAISING cx_static_check.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA: mt_data TYPE ztki_dogbg_alv,
          mo_sel  TYPE REF TO z_alv_report_template_sel.

ENDCLASS.



CLASS z_alv_report_template_data IMPLEMENTATION.
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
