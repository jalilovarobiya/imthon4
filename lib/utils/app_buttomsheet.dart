import 'package:imthon3/utils/main_util.dart';

class AppButtomsheet {
  static void showSuccessSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppImages.success),
              20.height,
              Text(
                "Password Changed",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              25.height,
              Text(
                "Password changed successfully, you can login again with a new password",
                textAlign: TextAlign.center,
              ),
              30.height,
              AppButton.orangeBotton(
                text: "Verify Account",
                onprassed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) {
                        return MainScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }

  static void changeLanguage(BuildContext context) {
    final currentIndex = context.locale.languageCode;
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ChangeLanguage(
                image: AppImages.uzbekFlag,
                language: "uzbek",
                til: "uz",
                selected: currentIndex,
              ),
              ChangeLanguage(
                image: AppImages.englishFlag,
                language: "english",
                til: "en",
                selected: currentIndex,
              ),
              ChangeLanguage(
                image: AppImages.russianFalg,
                language: "russian",
                til: "ru",
                selected: currentIndex,
              ),
            ],
          ),
        );
      },
    );
  }
}
