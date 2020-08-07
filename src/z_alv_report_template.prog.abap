*&---------------------------------------------------------------------*
*   Шаблон для создания типичного отчета с выборкой данных.
*   Основан на концепции MVC:
*       SEL – обработка параметров выборки, проверка полномочий
*       DATA (Model) - непосредственная выборка данных и обработка
*       ALV (View) – отображение данных
*&---------------------------------------------------------------------*
REPORT z_alv_report_template.

DATA: g_uname TYPE sy-uname.

SELECTION-SCREEN: BEGIN OF BLOCK block1.
PARAMETERS:     sp_bukrs TYPE bukrs OBLIGATORY.
SELECT-OPTIONS: so_usr FOR g_uname.
SELECTION-SCREEN: END OF BLOCK block1.

INITIALIZATION.


START-OF-SELECTION.

  TRY.
      DATA(go_sel) = NEW z_alv_report_template_sel( i_bukrs = sp_bukrs
                                                    i_usr = so_usr[] ).
      DATA(go_data) = NEW z_alv_report_template_data( go_sel ).
      DATA(go_alv) = NEW z_alv_report_template_alv( go_data ).

      go_sel->check_authority_object( ).
      go_data->get_data( ).
      go_alv->build_alv( ).

    CATCH cx_static_check INTO DATA(lo_err).
      "show lo_err->t_messages

  ENDTRY.
