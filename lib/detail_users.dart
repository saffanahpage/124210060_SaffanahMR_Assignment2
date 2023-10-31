import 'package:flutter/material.dart';
import 'package:tujuh/api_data_source.dart';
import 'package:tujuh/detail_users_model.dart';

class detailpage extends StatelessWidget {
  detailpage({super.key, required this.dataUsers});
  int dataUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Detail User",
        ),
      ),
      body: FutureBuilder(
        future: ApiDataSource.instance.loadDetailUsers(dataUsers),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text("ADA ERROR");
          }
          if (snapshot.hasData) {
            DetailUsersModel users = DetailUsersModel.fromJson(snapshot.data!);
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                  child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    foregroundImage:
                        NetworkImage(users.data!.avatar.toString()),
                    radius: 80,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${users.data!.firstName} ${users.data!.lastName}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('${users.data!.email}'),
                ],
              )),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
