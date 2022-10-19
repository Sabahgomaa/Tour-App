import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/View/Main/ExploreEgypt/Screens/Cities/Controller/states.dart';
import '../../../../../../Core/cache_helper.dart';
import '../../../../../../Core/dio_helper.dart';
import '../../../../../../const/end_point.dart';
import '../Model/cities_model.dart';

class ExploreEgyptCitiesCubit extends Cubit<ExploreEgyptCitiesStates> {
  ExploreEgyptCitiesCubit() : super(ExploreEgyptCitiesInitial());

  static ExploreEgyptCitiesCubit of(context) => BlocProvider.of(context);

  ExploreEgyptCities? citiesModel;
  Datum? cityItemData;

  Future<void> getExploreEgyptCitiesItem({int? itemId}) async {
    emit(ExploreEgyptCitiesLoading());
    try {
      final res = await DioHelper.getData(url: exploreEgyptCategory + "/1");
      if (kDebugMode) {
        print(res.data);
      }
      citiesModel = ExploreEgyptCities.fromJson(res.data);

      if (kDebugMode) {
        print(citiesModel!.data!);
        print(CashHelper.getToken);
      }
      emit(ExploreEgyptCitiesSuccess());
    } catch (e, s) {
      if (kDebugMode) {
        print(e);
      }
      if (kDebugMode) {
        print('*' * 8);
        print(CashHelper.getToken);
      }
      if (kDebugMode) {
        print(s);
      }
    }
  }
}