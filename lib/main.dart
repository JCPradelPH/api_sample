import 'package:api_sample/blocs/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  UserBloc? _userBloc;

  @override
  initState() {
    super.initState();
    _userBloc = context.read<UserBloc>();
    _userBloc!.add(const GetUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if(state.status == UserStatus.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Data loaded successfully'),
              ),
            );
          }
          if(state.status == UserStatus.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Failed to load data'),
              ),
            );
          }
        },
        builder: (context, state) {
          if(state.status == UserStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state.status == UserStatus.failed) {
            return const Center(
              child: Text('Failed to load data'),
            );
          }
          return ListView(
              children: state.userList!.map((user) {
                return ListTile(
                  title: Text(user.name ?? ''),
                  subtitle: Text(user.username ?? ''),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar ?? ''),
                  ),
                );
              }).toList(),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
