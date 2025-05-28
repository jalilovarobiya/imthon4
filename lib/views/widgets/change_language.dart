import 'package:imthon3/utils/main_util.dart';

class ChangeLanguage extends StatelessWidget {
  final String image;
  final String language;
  final String til;
  final String selected;
  const ChangeLanguage({
    super.key,
    required this.image,
    required this.til,
    required this.selected,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: () {
        context.setLocale(Locale(til));
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                    isDark
                        ? const Color.fromARGB(255, 30, 30, 30)
                        : Colors.grey[200],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Image.asset(image),
              ),
            ),
            20.width,
            Text(language.tr(), style: TextStyle(fontSize: 20)),
            Spacer(),
            if (selected == til) CircleAvatar(child: Icon((Icons.check))),
          ],
        ),
      ),
    );
  }
}
