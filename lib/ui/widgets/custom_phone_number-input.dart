import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:paytrybe/constant/palette.dart';

class CustomPhoneNumberInput extends StatelessWidget {
  final Function? onSubmit;
  final Function(PhoneNumber)? onSaved;
  final Function(PhoneNumber)? onInputChanged;
  String? isoCode;
  final String? hint;
  final TextEditingController? controller;

  CustomPhoneNumberInput(
      {Key? key,
      this.onSubmit,
      this.onSaved,
      this.isoCode,
      this.onInputChanged,
      this.controller,
      this.hint = "Phone Number"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 55,
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(
          width: 2,
          color: border,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: InternationalPhoneNumberInput(
        onInputChanged: (PhoneNumber number) => onInputChanged!(number),
        keyboardType: const TextInputType.numberWithOptions(
          signed: true,
          decimal: true,
        ),
        inputDecoration: InputDecoration(
          isDense: true,
          border: InputBorder.none,
          hintText: hint!,
        ),
        textFieldController: controller,
        // initialValue: PhoneNumber(isoCode: isoCode!),
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: true,
        autoValidateMode: AutovalidateMode.disabled,
        onSaved: (PhoneNumber number) => {onSaved!(number)},
        onSubmit: () => onSubmit!(),
      ),
    );
  }
}
