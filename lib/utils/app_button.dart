import 'package:imthon3/utils/main_util.dart';

class AppButton {
  static Widget orangeBotton({
    required String text,
    required VoidCallback onprassed,
    double hight = 55,
    double width = double.infinity,
    double borderRadius = 30,
    Color color = Appcolors.appOrange,
    Color textColor = Colors.white,
    double fontsize = 16,
    FontWeight fontWeight = FontWeight.w700,
  }) {
    return SizedBox(
      height: hight,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        onPressed: onprassed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: fontWeight,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }

  static Widget appTextButton({
    required BuildContext contex,
    required String text,
    required Widget screen,
    required Color color,
  }) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          contex,
          MaterialPageRoute(
            builder: (ctx) {
              return screen;
            },
          ),
        );
      },
      child: Text(text, style: TextStyle(color: color)),
    );
  }
}
