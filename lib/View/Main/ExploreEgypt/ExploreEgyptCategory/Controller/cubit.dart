import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tour_app/View/Main/ExploreEgypt/ExploreEgyptCategory/Controller/states.dart';
import '../../../../../Core/cache_helper.dart';
import '../../../../../Core/dio_helper.dart';
import '../../../../../const/end_point.dart';
import '../Model/explore_model.dart';


class ExploreEgyptCubit extends Cubit<ExploreEgyptStates> {
  ExploreEgyptCubit() : super(ExploreEgyptInitial());

  static ExploreEgyptCubit of(context) => BlocProvider.of(context);

  ExploreEgyptModel? exploreEgyptModel;

  Future<void> getExploreEgypt() async {
    emit(ExploreEgyptLoading());
    try {
      final res = await DioHelper.getData(url: exploreEgyptCategory);
      if (kDebugMode) {
        print(res.data);
      }
      exploreEgyptModel = ExploreEgyptModel.fromJson(res.data);

      if (kDebugMode) {
        print(exploreEgyptModel!.data!);

        print(CashHelper.readValue(key: 'Accept-Language'));
        print(CashHelper.getToken);
      }
      emit(ExploreEgyptSuccess());
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
