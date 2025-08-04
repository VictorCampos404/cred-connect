import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Masks {
  Masks();

  static final phoneMask = MaskTextInputFormatter(
    mask: '+ ### ### ### ###',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );

  static final dateMask = MaskTextInputFormatter(
    mask: '####/##/##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
}
