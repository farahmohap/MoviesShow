abstract class MovieDetailState {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {
  const MovieDetailInitial();
}

class MovieDetailLoading extends MovieDetailState {
  const MovieDetailLoading();
}

class MovieDetailLoaded extends MovieDetailState {
  const MovieDetailLoaded();
}

class MovieDetailError extends MovieDetailState {
  final String message;
  const MovieDetailError(this.message);
}