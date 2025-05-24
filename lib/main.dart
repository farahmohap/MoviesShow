import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Tester',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ApiTestScreen(),
    );
  }
}

class ApiTestScreen extends StatefulWidget {
  const ApiTestScreen({super.key});

  @override
  State<ApiTestScreen> createState() => _ApiTestScreenState();
}

class _ApiTestScreenState extends State<ApiTestScreen> {
  String _apiResponse = 'Press the button to fetch movies';
  bool _isLoading = false;

  // Best place for API calls - in a separate method within your State class
  Future<void> _fetchMovies() async {
    setState(() {
      _isLoading = true;
      _apiResponse = 'Loading...';
    });

    try {
      final dio = Dio();
      final response = await dio.get(
        'https://api.themoviedb.org/3/movie/popular',
        queryParameters: {
          'api_key': 'b0b21933535f1da64a1d7fa0edbbeddc',
          'page': 1,
        },
      );

      setState(() {
        _apiResponse = 'Success!\n\nMovies found: ${response.data['results'].length}\n'
                       'First movie: ${response.data['results'][0]['title']}';
      });
    } catch (e) {
      setState(() {
        _apiResponse = 'Error: ${e.toString()}';
      });
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TMDB API Tester')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _isLoading ? null : _fetchMovies,
              child: _isLoading
                  ? const CircularProgressIndicator()
                  : const Text('Test API'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                _apiResponse,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}