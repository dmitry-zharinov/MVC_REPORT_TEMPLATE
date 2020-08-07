CLASS z_alv_report_template_sel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  GLOBAL FRIENDS z_alv_report_template_data.

  PUBLIC SECTION.
    METHODS constructor IMPORTING i_bukrs TYPE bukrs
                                  i_usr   TYPE any OPTIONAL
                        RAISING   cx_static_check.
    METHODS check_authority_object RAISING cx_static_check.
  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES:
      tyr_usr_range TYPE RANGE OF sy-uname.

    DATA: m_bukrs TYPE bukrs,
          mr_usr  TYPE tyr_usr_range.
ENDCLASS.



CLASS z_alv_report_template_sel IMPLEMENTATION.
  METHOD constructor.
    m_bukrs = i_bukrs.

    IF i_usr IS SUPPLIED.
      mr_usr = CONV #( i_usr ).
    ENDIF.


  ENDMETHOD.

  METHOD check_authority_object.

    AUTHORITY-CHECK OBJECT '#####' ID 'BUKRS' FIELD m_bukrs.
    IF sy-subrc <> 0.
      "Raise error
    ENDIF.
  ENDMETHOD.

ENDCLASS.
