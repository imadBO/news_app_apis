abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsFetchedSuccessfullyState extends NewsStates {}

class NewsFetchingErrorState extends NewsStates {
  final String errorMsg;
  NewsFetchingErrorState(this.errorMsg);
}

class NewsFetchingLoadingState extends NewsStates {}
