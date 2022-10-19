abstract class ExploreEgyptStates {}

class ExploreEgyptInitial extends ExploreEgyptStates {}

class ExploreEgyptLoading extends ExploreEgyptStates {}
class ExploreEgyptSuccess extends ExploreEgyptStates {}
class ExploreEgyptErrorState extends ExploreEgyptStates {
  final String error;

  ExploreEgyptErrorState(this.error);
}