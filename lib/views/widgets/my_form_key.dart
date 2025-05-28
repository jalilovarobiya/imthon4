import 'package:imthon3/utils/main_util.dart';

class MyFormKey extends StatelessWidget {
  final TextEditingController? controller;
  final bool hideText;
  final String? hintText;
  final String? Function(String?)? validator;
  const MyFormKey({
    super.key,
    this.controller,
    this.hideText = false,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: hideText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: hintText,
      ),
      validator: validator,
    );
  }
}
