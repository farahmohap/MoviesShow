import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/core/service_locator.dart';
import 'package:movies_show/features/home_view/presentation/logic/get_movies_cubit.dart';
import 'package:movies_show/features/home_view/presentation/screens/home_screen.dart';

void main() {
  setupServiceLocator();
  runApp(const MoviesShowApp());
}

class MoviesShowApp extends StatelessWidget {
  const MoviesShowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  BlocProvider(create: (_) => getIt<MovieCubit>()..fetchPopularMovies(),      
      child: HomeScreen(),
      ),
      
        
      
    );
  }
}