import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:praktikum_03/view/home_screen.dart';
import 'package:praktikum_03/viewmodel/contact_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ContactCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(useMaterial3: false),
        home: const HomeScreen(),
      ),
    );
  }
}