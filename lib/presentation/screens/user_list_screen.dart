import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/business_logic/blocs/user_bloc/user_bloc.dart';

class UserListScreen extends StatefulWidget {
  static const String pageRoute = '/user-list-screen';

  const UserListScreen({Key? key}) : super(key: key);

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  late UserBloc userBloc;

  @override
  Widget build(BuildContext context) {
    userBloc = context.read<UserBloc>();
    userBloc.add(GetUsers());
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered USer'),
        centerTitle: true,
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetSuccess) {
            print(state.userList[0].name.toString());
            if(state.userList.length==0){
              return const Center(
                child: Text('No data added yet'),
              );
            }
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 10,
              ),
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Text(
                        state.userList[index].id.toString(),
                      ),
                    ),
                    title: Text(
                      state.userList[index].name.toString(),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Age : ${state.userList[index].age.toString()}'),
                        Text(
                          'Degree : ${state.userList[index].degree.toString()}',
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: state.userList.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
