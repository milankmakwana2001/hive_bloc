// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/business_logic/blocs/user_bloc/user_bloc.dart';
import 'package:hive_bloc/business_logic/cubits/image_cubit/image_cubit.dart';
import 'package:hive_bloc/models/user/user.dart';
import 'package:hive_bloc/presentation/screens/images_list_screen.dart';
import 'package:hive_bloc/presentation/screens/user_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserBloc _userBloc;


  final TextEditingController nameController = TextEditingController();
  final TextEditingController idController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _userBloc = context.read<UserBloc>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
          await context.read<ImageCubit>().imagePicker();
        },
        child: Icon(Icons.wallet_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
       appBar: AppBar(
        title: Text(
          'Hive Local DB',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              nameController.clear();
              idController.clear();
              ageController.clear();
              degreeController.clear();
              Navigator.of(context).pushNamed(UserListScreen.pageRoute);
            },
            icon: Icon(
              Icons.list_alt,
            ),
          ),
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(ImagesListScreen.pageRoute);
          }, icon:Icon(Icons.image_rounded,),),
        ],
      ),
      body: ListView(
        children: [
          buildTextFieldContainer(
            'Name',
            controller: nameController,
            isAutoFocus: true,
          ),
          buildTextFieldContainer(
            'Id',
            controller: idController,
            isNum: true,
          ),
          buildTextFieldContainer(
            'Age',
            controller: ageController,
            isNum: true,
          ),
          buildTextFieldContainer(
            'Degree',
            controller: degreeController,
          ),
          SizedBox(
            height: 20,
          ),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return ElevatedButton(
                onPressed: () {
                  if (nameController.text.isNotEmpty &&
                      idController.text.isNotEmpty &&
                      ageController.text.isNotEmpty &&
                      degreeController.text.isNotEmpty) {
                    _userBloc.add(
                      AddUserEvent(
                        user: User()
                          ..name = nameController.text
                          ..id = int.parse(idController.text)
                          ..age = double.parse(ageController.text)
                          ..degree = degreeController.text,
                      ),
                    );
                    nameController.clear();
                    idController.clear();
                    ageController.clear();
                    degreeController.clear();
                  } else {
                    debugPrint(
                      'any field is blank',
                    );
                  }
                },
                child: Text(
                  'Upload',
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Container buildTextFieldContainer(
    String label, {
    bool isNum = false,
    bool isAutoFocus = false,
    required TextEditingController controller,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 10,
      ),
      child: TextField(
        autofocus: isAutoFocus ? true : false,
        controller: controller,
        keyboardType: isNum ? TextInputType.number : TextInputType.name,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
