import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_bloc/business_logic/cubits/image_cubit/image_cubit.dart';

class ImagesListScreen extends StatefulWidget {

  static const String pageRoute = '/images-list-screen';
  const ImagesListScreen({Key? key}) : super(key: key);

  @override
  State<ImagesListScreen> createState() => _ImagesListScreenState();
}

class _ImagesListScreenState extends State<ImagesListScreen> {
  late ImageCubit imageCubit;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   imageCubit = c
  // }

  @override
  Widget build(BuildContext context) {
    imageCubit = context.read<ImageCubit>();
    imageCubit.getLocalImages();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Local Images List',
        ),
      ),
      body: BlocConsumer<ImageCubit, ImageState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is GetImages) {
            return ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: 200,
                  color: Colors.red,
                  margin: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Image.memory(state.myList[index].image),
                );
              },
              itemCount: state.myList.length,
            );
          } else {
            print('elese');
            return Container();
          }
        },
      ),
    );
  }
}
