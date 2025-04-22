import 'package:get/get.dart';
import '../model/city_model.dart';
import '../data/dummy_data.dart';

class CityController extends GetxController {
  var cities = <CityModel>[].obs;
  var selectedCity = Rx<CityModel?>(null);
  var searchLocation = "New York, USA".obs;

  @override
  void onInit() {
    super.onInit();
    cities.value = DummyData.getCities();
    selectedCity.value = cities.first;
  }

  void selectCity(CityModel city) {
    selectedCity.value = city;
  }

  void toggleFavorite(CityModel city) {
    final index = cities.indexWhere((c) => c.name == city.name);
    if (index >= 0) {
      final updatedCity = CityModel(
        name: city.name,
        country: city.country,
        imagePath: city.imagePath,
        rating: city.rating,
        description: city.description,
        isFavorite: !city.isFavorite,
        attractions: city.attractions,
      );
      cities[index] = updatedCity;
      if (selectedCity.value?.name == city.name) {
        selectedCity.value = updatedCity;
      }
    }
  }
}