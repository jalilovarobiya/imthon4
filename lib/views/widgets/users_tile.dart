import 'package:imthon3/utils/main_util.dart';

class UsersTile extends StatelessWidget {
  final void Function()? onTap;
  final String name;
  final String image;
  const UsersTile({
    super.key,
    this.onTap,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(backgroundImage: NetworkImage(image)),
      title: Text(name),
      // subtitle: Text("text"),
      // trailing: Text("time"),
    );
  }
}
