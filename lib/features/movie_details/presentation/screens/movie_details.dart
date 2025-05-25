import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_cubit.dart';
import 'package:movies_show/features/movie_details/presentation/screens/logic/movie_detail_state.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details')),
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailLoaded) {
            final m = state.movie;
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network((m.posterPath)),
                  const SizedBox(height: 8),
                  Text(
                    m.title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('⭐ ${m.voteAverage}'),
                  Text('⏱ ${m.runtime} min'),
                  const SizedBox(height: 12),
                  Text(m.overview),
                ],
              ),
            );
          } else if (state is MovieDetailError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:movies_show/core/constants/assets.dart';
// import 'package:movies_show/core/constants/styles/styles.dart';

// class MovieDetailsScreen extends StatelessWidget {
//   const MovieDetailsScreen({super.key});
//   final String movieImage = '0';

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverAppBar(
//           title: Text('data', style: AppTextStyles.white16w700),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           centerTitle: false,
//           actions: [
//             CircleAvatar(
//               backgroundColor: Color(0xff303243).withOpacity(.8),
//               radius: 20,
//               child: SvgPicture.asset(AppAssets.heartIcon),
//             ),
//           ],
//           expandedHeight: 200, // Height when expanded
//           floating: false,
//           pinned: true,
//           flexibleSpace: FlexibleSpaceBar(
//             background: Image.asset(AppAssets.onboarding, fit: BoxFit.cover),
//           ),
//           backgroundColor: Colors.transparent,
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             // Your content here
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//             Container(height: 1000, color: Colors.blue),
//           ]),
//         ),
//       ],
//     );
//   }
// }
