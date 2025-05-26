import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_show/core/constants/app_assets.dart';
import 'package:movies_show/core/constants/styles/colors.dart';
import 'package:movies_show/core/constants/styles/styles.dart';
import 'package:movies_show/core/functions/format_date.dart';
import 'package:movies_show/core/functions/format_duration.dart';
import 'package:movies_show/core/networking/api_constants.dart';
import 'package:movies_show/core/shared_widgets/image_skeletonizer.dart';
import 'package:movies_show/features/movie_details/presentation/logic/movie_detail_cubit.dart';
import 'package:movies_show/features/movie_details/presentation/logic/movie_detail_state.dart';
import 'package:movies_show/features/movie_details/presentation/widgets/recommendations_listview.dart';
import 'package:movies_show/features/movie_details/presentation/widgets/trailer_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MovieDetailScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  // @override
  // void initState() {
  //   super.initState();
  //   final cubit = context.read<MovieDetailCubit>();
  //   cubit.fetchMovieDetail(widget.movieId);
  //   cubit.fetchRecommendationMovies(widget.movieId);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black2E,
      body: BlocBuilder<MovieDetailCubit, MovieDetailState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              customSliverAppBar(state, context),
              SliverList(
                delegate: SliverChildListDelegate([
                  if (state is MovieDetailLoading)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 100),
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (state is MovieDetailError)
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Text(state.message),
                      ),
                    )
                  else if (state is MovieDetailLoaded)
                    successStateBody(state),
                ]),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding successStateBody(MovieDetailLoaded state) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 7.0,
                percent:
                    (state.movie!.voteAverage * 0.1).clamp(0, 1).toDouble(),
                center: CircleAvatar(
                  backgroundColor: Color(0xff15161D),
                  child: Text(
                    "${(state.movie!.voteAverage * 10).toInt()}%",
                    style: AppTextStyles.white16w600,
                  ),
                ),
                progressColor: AppColors.pink8A,
                backgroundColor: AppColors.grey43,
                circularStrokeCap: CircularStrokeCap.round,
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.movie!.title,
                      style: AppTextStyles.header,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Text(
                          ' ${convertToBrazilianDate(state.movie!.releaseDate)}',
                          style: AppTextStyles.descrption.copyWith(
                            color: Color(0xbbbbbbbb),
                          ),
                        ),
                        SizedBox(width: 5),
                        Icon(
                          Icons.circle,
                          size: 5,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(width: 5),
                        SvgPicture.asset(AppAssets.clockIcon),
                        Text(
                          ' ${formatDuration(state.movie!.runtime)}',
                          style: AppTextStyles.descrption.copyWith(
                            color: Color(0xbbbbbbbb),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(
            color: AppColors.black1D,
            endIndent: 4,
            indent: 4,
            thickness: 1,
          ),
          const SizedBox(height: 20),
          Text(
            state.movie!.overview,
            style: AppTextStyles.descrption.copyWith(color: Color(0xffcccccc)),
          ),
          TrailerButton(),
          const SizedBox(height: 20),
          Text(
            'Recomendações',
            style: AppTextStyles.header.copyWith(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          RecommendationsListview(
            movieId: widget.movieId,
            onMovieTap: (newMovieId) {
              context.read<MovieDetailCubit>().fetchMovieDetail(newMovieId);
              context.read<MovieDetailCubit>().fetchRecommendationMovies(
                newMovieId,
              );
            },
          ),
        ],
      ),
    );
  }

  SliverAppBar customSliverAppBar(
    MovieDetailState state,
    BuildContext context,
  ) {
    return SliverAppBar(
      title: Text(
        state is MovieDetailLoaded ? state.movie!.title : ' ',
        style: AppTextStyles.white16w700,
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.of(context).pop(),
      ),
      centerTitle: false,
      actionsPadding: EdgeInsets.only(right: 16),
      actions: [
        CircleAvatar(
          backgroundColor: AppColors.grey43.withOpacity(.5),
          radius: 15,
          child: SvgPicture.asset(AppAssets.heartIcon),
        ),
      ],
      expandedHeight: 300,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background:
            state is MovieDetailLoaded
                ? Image.network(
                  '${ApiConstants.imageBaseUrl}${state.movie!.posterPath}',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => ImageSkeletonizer(),
                )
                : ImageSkeletonizer(),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
