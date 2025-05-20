import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gallerymobile/conter_cubit.dart';
import 'package:gallerymobile/home_cubit.dart';

import 'counter_state.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ConterCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  context.read<HomeCubit>().getData();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: BlocConsumer<HomeCubit, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeSuccess) {
            return ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Deatiles()));
                    },
                    title: Text(state.items[index]),
                  );
                });
          }
          if (state is HomeError) {
            return Center(
              child: Text(state.error),
            );
          }
          return Text("Intial data");
        }, listener: (context, state) {
          if (state is HomeSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Data fetched successfully"),
              backgroundColor: Colors.green,
            ));
          }
        }));
  }
}

class Deatiles extends StatelessWidget {
  const Deatiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<HomeCubit, HomeState>(
            buildWhen: (perv, current) => current is HomeSuccess,
            builder: (context, state) {
              if (state is HomeSuccess) {
                return Text(state.items.length.toString());
              }
              return Text("data");
            }));
  }
}
