import 'package:imthon3/utils/main_util.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text("edit_profile".tr()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("done".tr()),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                    isDark
                        ? const Color.fromARGB(
                          255,
                          139,
                          181,
                          201,
                        ).withOpacity(0.1)
                        : Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Consumer<ChangePhotoViewmodel>(
                      builder: (context, change, child) {
                        return CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              change.imgPath != null
                                  ? FileImage(File(change.imgPath!))
                                  : NetworkImage(
                                    "https://unsplash.com/photos/gray-concrete-painted-wall-yI3weKNBRTc",
                                  ),
                          child: IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) {
                                  return AlertDialog(
                                    content: Text("Qayerdan rasm olmoxchsz"),
                                    actions: [
                                      FilledButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await change.chooseImageInGallery();
                                        },
                                        child: Text("Galareyadan"),
                                      ),
                                      FilledButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          await change.chooseImageInCamera();
                                        },
                                        child: Text("Kameradan"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.camera_alt_outlined, size: 40),
                          ),
                        );
                      },
                    ),
                    25.width,
                    Expanded(
                      child: Column(
                        children: [TextField(), TextField(), 30.height],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            15.height,
            Text("enter_your_name_add_photo".tr()),
            20.height,
            Container(
              // height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                    isDark
                        ? const Color.fromARGB(
                          255,
                          139,
                          181,
                          201,
                        ).withOpacity(0.1)
                        : Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("date_of_birth".tr()),
                        Spacer(),
                        TextButton(onPressed: () {}, child: Text("add".tr())),
                        // agar tg kunini qoshmagan bolsa defoult xolatda shunaqa bolad
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "remove".tr(),
                        style: TextStyle(color: Colors.red),
                        // qoshgan bosa tepadagi add ornga tugilgan sanasi va pastdan remove degan botton bolad
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.height,
            Container(
              // height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color:
                    isDark
                        ? const Color.fromARGB(
                          255,
                          139,
                          181,
                          201,
                        ).withOpacity(0.1)
                        : Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.4),
                    offset: Offset(0, 4),
                    blurRadius: 6,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("username".tr()),
                        Spacer(),
                        Text("old name"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.navigate_next_outlined),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("phone".tr()),
                        Spacer(),
                        Text("old number"),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.navigate_next_outlined),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
