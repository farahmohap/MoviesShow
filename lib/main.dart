import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/core/networking/api_service.dart';
import 'package:movies_show/features/home_view/data/data_sources/movie_remote_datasource.dart';
import 'package:movies_show/features/home_view/data/repos/movie_repo_impl.dart';
import 'package:movies_show/features/home_view/domain/use_cases.dart/movie_usecase.dart';
import 'package:movies_show/features/home_view/presentation/logic/get_movies_cubit.dart';
import 'package:movies_show/features/home_view/presentation/screens/home_screen.dart';
import 'package:movies_show/features/home_view/presentation/widgets/category_movies_listview.dart';
import 'package:movies_show/features/movie_details/data/datasource/movie_detail_datasource.dart';
import 'package:movies_show/features/movie_details/data/repos/movie_detail_repo_impl.dart';
import 'package:movies_show/features/movie_details/domain/usecases/get_movie_detail_usecase.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_cubit.dart';
import 'package:movies_show/features/movie_details/presentation/screens/movie_details.dart';
import 'package:movies_show/features/onboarding/screens/onboard_screen.dart';

void main() {
  final apiService = ApiServiceImpl();
  final remoteDataSource = MovieRemoteDataSourceImpl(apiService);

  final remoteDataSource2= MovieDetailRemoteDataSourceImpl(apiService);
  final repository = MovieRepositoryImpl(remoteDataSource);
  final repository2 = MovieDetailRepositoryImpl(remoteDataSource2);

  final getPopularMoviesUseCase = GetPopularMoviesUseCase(repository);
  final getMovieDetailUseCase = GetMovieDetailUseCase(repository2);

  runApp(MyApp(
    getPopularMoviesUseCase: getPopularMoviesUseCase,
    getMovieDetailUseCase: getMovieDetailUseCase,
  ));
}

class MyApp extends StatelessWidget {
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetMovieDetailUseCase getMovieDetailUseCase;

  const MyApp({
    super.key,
    required this.getPopularMoviesUseCase,
    required this.getMovieDetailUseCase,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Tester',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => MovieCubit(getPopularMoviesUseCase)..fetchPopularMovies(),
          ),
          BlocProvider(
            create: (_) => MovieDetailCubit(getMovieDetailUseCase)..fetchMovieDetail(1297028),
          ),
        ],
        child: const MovieDetailScreen(movieId: 1297028),
      ),
    );
  }
}

// class ApiTestScreen extends StatefulWidget {
//   const ApiTestScreen({super.key});

//   @override
//   State<ApiTestScreen> createState() => _ApiTestScreenState();
// }

// class _ApiTestScreenState extends State<ApiTestScreen> {
//   String _apiResponse = 'Press the button to fetch movies';
//   bool _isLoading = false;

//   // Best place for API calls - in a separate method within your State class
//   Future<void> _fetchMovies() async {
//     setState(() {
//       _isLoading = true;
//       _apiResponse = 'Loading...';
//     });

//     try {
//       final dio = Dio();
//       final response = await dio.get(
//         'https://api.themoviedb.org/3/movie/popular',
//         queryParameters: {
//           'api_key': 'b0b21933535f1da64a1d7fa0edbbeddc',
//           'page': 1,
//         },
//       );

//       setState(() {
//         _apiResponse = 'Success!\n\nMovies found: ${response.data['results'].length}\n'
//                        'First movie: ${response.data['results'][0]['title']}';
//       });
//     } catch (e) {
//       setState(() {
//         _apiResponse = 'Error: ${e.toString()}';
//       });
//     } finally {
//       setState(() => _isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('TMDB API Tester')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: _isLoading ? null : _fetchMovies,
//               child: _isLoading
//                   ? const CircularProgressIndicator()
//                   : const Text('Test API'),
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Text(
//                 _apiResponse,
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
