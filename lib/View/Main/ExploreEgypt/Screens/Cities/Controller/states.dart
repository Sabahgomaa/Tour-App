abstract class ExploreEgyptCitiesStates {}

class ExploreEgyptCitiesInitial extends ExploreEgyptCitiesStates {}

class ExploreEgyptCitiesLoading extends ExploreEgyptCitiesStates {}
class ExploreEgyptCitiesSuccess extends ExploreEgyptCitiesStates {}
class ExploreEgyptCitiesErrorState extends ExploreEgyptCitiesStates {
  final String error;

  ExploreEgyptCitiesErrorState(this.error);
}