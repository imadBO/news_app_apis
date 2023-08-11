abstract class NewsStates {}

class NewsInitialState extends NewsStates {}
class NewsFetchedSuccessfullyState extends NewsStates {}
class NewsFetchingErrorState extends NewsStates {}
class NewsFetchingLoadingState extends NewsStates {}