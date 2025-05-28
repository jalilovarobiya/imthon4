import 'package:http/http.dart' as http;
import 'package:imthon3/utils/main_util.dart';

class UsersViewmodels {
  Future<List<UsersModel>> getUsers() async {
    final uri = Uri.parse(
      "https://chat-f2d61-default-rtdb.firebaseio.com/users.json",
    );
    final response = await http.get(uri);

    final decoded = jsonDecode(response.body) as Map<String, dynamic>;
    final List<UsersModel> allUsers = [];

    for (var element in decoded.entries) {
      allUsers.add(UsersModel.fromJson(element.value, element.key));
    }
    return allUsers;
  }

  // Future<UsersModel> regster(String email, String password)async{
  //   FirebaseAuth firebaseAuth = FirebaseAuth
  // }
}
