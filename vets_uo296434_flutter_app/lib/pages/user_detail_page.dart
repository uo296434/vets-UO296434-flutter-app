import 'package:flutter/material.dart';
import 'package:vets_uo296434_flutter_app/src/user.dart';

class UserDetail extends StatefulWidget {
  final User user;
  const UserDetail({super.key, required this.user});
  @override
  State<StatefulWidget> createState() => StateUserDetail();
}

class StateUserDetail extends State<UserDetail> {  
  final List<String> list1 = ["Nombre", "Apellidos", "Email", "Teléfono"];
  List<String> list2 = List.empty();
  
  @override
  void initState(){
    User user = widget.user;
    list2 = [user.name, user.surname, user.email, user.phone];
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle usuario"),
      ),
      body: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${list1[index]}: ${list2[index]}"),
          );
        }
      ),
    );          
  }
}