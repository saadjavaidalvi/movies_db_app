import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movies_db_app/bloc/genere_bloc/genere_bloc.dart';
import 'package:movies_db_app/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:movies_db_app/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpcomingMoviesBloc(),
        ),
        BlocProvider(
          create: (context) => GenereBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: const SpashScreen(),
      ),
    );
  }
}
