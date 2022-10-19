import '../../Model/cities_model.dart';
import '../../Model/countries_model.dart';
import '../../Model/model.dart';

abstract class RegisterStates {}

class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final UserModel registerModel;

  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

//==============================================================================
class ProfilePictureInit extends RegisterStates {}
class PassportPictureInit extends RegisterStates {}
//==============================================================================
class GetCityLoading extends RegisterStates {}

class GetCitySuccess extends RegisterStates {
  final CitiesModel cityModel;

  GetCitySuccess({required this.cityModel});
}

class GetCityError extends RegisterStates {}
class ChangeCityDropDownState extends RegisterStates {}

//==============================================================================
class GetCountryLoading extends RegisterStates {}

class GetCountrySuccess extends RegisterStates {
  final CountriesModel countryModel;

  GetCountrySuccess({required this.countryModel});
}

class GetCountryError extends RegisterStates {
  final String error;

  GetCountryError(this.error);
}
class ChangeCountryDropDownState extends RegisterStates {}

//==============================================================================

