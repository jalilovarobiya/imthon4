import 'package:imthon3/utils/main_util.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,

            expandedHeight: 300,
            // flexibleSpace: Image.asset(
            //   AppImages.wallPaper,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            floating: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          isDark
                              ? const Color.fromARGB(255, 30, 30, 30)
                              : isDark
                              ? const Color.fromARGB(255, 30, 30, 30)
                              : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ProfileWidget(
                      // ontap boshqa screenga otad uyerda userni barcha malumotlari bolad

                      // tepada markazda circular avatarda rasm uni pastdan username
                      // keyn pastda  nomeri ism familya va h.k
                      // appbarda ortga qaytsh uchun knopka titleda "info", actionda edit textbotton
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      icon: Icon(Icons.person),
                      title: "my_profile".tr(),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return ProfileDitails();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  40.height,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          isDark
                              ? const Color.fromARGB(255, 30, 30, 30)
                              : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ProfileWidget(
                          // qachonki savatdagi order tugmasi bosilsa shu yerda korinad mahsulotlar
                          actionIcon: Icon(Icons.navigate_next_outlined),
                          icon: Icon(Icons.shopping_bag),
                          title: "orders".tr(),
                        ),
                        ProfileWidget(
                          // maxsulotga yozb qoldrlgan sharxlar uchun
                          actionIcon: Icon(Icons.navigate_next_outlined),
                          icon: Icon(Icons.feedback_outlined),
                          title: "comments".tr(),
                        ),
                      ],
                    ),
                  ),
                  30.height,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          isDark
                              ? const Color.fromARGB(255, 30, 30, 30)
                              : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ProfileWidget(
                          // emailni butunlay ochrb tashash
                          // xoxishga qarab textlarni katta yoki kichik qilish
                          actionIcon: Icon(Icons.navigate_next_outlined),
                          icon: Icon(Icons.settings),
                          title: "settings".tr(),
                        ),
                        ProfileWidget(
                          // tilni ozgartirish imkoniyati 3ta ru en uz
                          actionIcon: Icon(Icons.navigate_next_outlined),
                          icon: Icon(Icons.language),
                          title: "change_language".tr(),
                          onTap: () {
                            AppButtomsheet.changeLanguage(context);
                          },
                        ),
                        ProfileWidget(
                          // notification yoqb qoyilad
                          actionIcon: Consumer<ProfileViewmode>(
                            builder: (context, model, child) {
                              return Switch(
                                value: model.isSwitched,
                                onChanged: (val) {
                                  model.toggle(val);
                                },
                              );
                            },
                          ),
                          icon: Icon(Icons.notifications),
                          title: "notification".tr(),
                        ),
                        ProfileWidget(
                          // krganda switch bolad uni yoqganda face id va parol kiritish kerak
                          actionIcon: Icon(Icons.navigate_next_outlined),
                          icon: Icon(Icons.security),
                          title: "security".tr(),
                        ),
                        ProfileWidget(
                          actionIcon: Switch(
                            value:
                                AdaptiveTheme.of(context).mode ==
                                AdaptiveThemeMode.dark,
                            onChanged: (value) {
                              if (value) {
                                AdaptiveTheme.of(context).setDark();
                              } else {
                                AdaptiveTheme.of(context).setLight();
                              }
                            },
                          ),
                          icon: Icon(
                            AdaptiveTheme.of(context).mode ==
                                    AdaptiveThemeMode.light
                                ? Icons.dark_mode
                                : Icons.light_mode,
                          ),
                          title: "theme".tr(),
                        ),
                      ],
                    ),
                  ),
                  30.height,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color:
                          isDark
                              ? const Color.fromARGB(255, 30, 30, 30)
                              : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.4),
                          offset: Offset(0, 4),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: ProfileWidget(
                      actionIcon: Icon(Icons.navigate_next_outlined),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (ctx) {
                            return AlertDialog(
                              title: Text("logout".tr()),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text("Do you want to log out?"),
                                  20.height,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      FilledButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("cancel".tr()),
                                      ),
                                      FilledButton(
                                        onPressed: () {
                                          context
                                              .read<AuthViewmodel>()
                                              .logOut();
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                              builder: (ctx) {
                                                return LoginScreen();
                                              },
                                            ),
                                          );
                                        },
                                        child: Text("logout".tr()),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: Icon(Icons.logout),
                      title: "logout".tr(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
