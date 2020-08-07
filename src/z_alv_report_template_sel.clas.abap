class Z_ALV_REPORT_TEMPLATE_SEL definition
  public
  final
  create public

  global friends Z_ALV_REPORT_TEMPLATE_DATA .

public section.

  methods CONSTRUCTOR
    importing
      !I_BUKRS type BUKRS
      !I_USR type ANY optional
    raising
      CX_STATIC_CHECK .
  methods CHECK_AUTHORITY_OBJECT
    raising
      CX_STATIC_CHECK .
  PROTECTED SECTION.
  PRIVATE SECTION.

    TYPES:
      tyr_usr_range TYPE RANGE OF sy-uname.

    DATA: m_bukrs TYPE bukrs,
          mr_usr  TYPE tyr_usr_range.
ENDCLASS.



CLASS Z_ALV_REPORT_TEMPLATE_SEL IMPLEMENTATION.


  METHOD check_authority_object.

    AUTHORITY-CHECK OBJECT '#####' ID 'BUKRS' FIELD m_bukrs.
    IF sy-subrc <> 0.
      "Raise error
    ENDIF.
  ENDMETHOD.


  METHOD constructor.
    m_bukrs = i_bukrs.

    IF i_usr IS SUPPLIED.
      mr_usr = CONV #( i_usr ).
    ENDIF.


  ENDMETHOD.
ENDCLASS.
