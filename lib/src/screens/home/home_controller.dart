import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../data/sports_data.dart';

class HomeController extends GetxController{

  RxString selectedCat = 'basket'.obs;
  RxString selectedCatSaved = 'basket'.obs;
  RxString selectedCatOdds = 'basket'.obs;

  RxList<Match> selectedCatDataOdds = <Match>[].obs;

  Rx<Match?>? detailItem = Rx<Match?>(null);

  final RxList<Match> savedMatchesFootball = <Match>[].obs;
  final RxList<Match> savedMatchesBasketBall = <Match>[].obs;
  final RxList<Match> savedMatchesHockey = <Match>[].obs;
  final RxList<Match> savedMatches = <Match>[].obs;

  @override
  void onInit() {
    super.onInit();
    savedMatchesFootball.assignAll(loadSavedDataFootBall());
    savedMatchesHockey.assignAll(loadSavedDataHockey());
    savedMatchesBasketBall.assignAll(loadSavedDataBasketball());
    savedMatches.assignAll(loadSavedDataBasketball());
    selectedCatDataOdds.assignAll(loadSavedOdds());
  }

  List<Match> loadSavedOdds() {
    final box = GetStorage();
    final List<dynamic>? previousItemsAsMaps = box.read('savedOdds');
    if (previousItemsAsMaps == null) {
      return [];
    }
    final List<Match> previousItems = previousItemsAsMaps
        .map((item) => Match.fromMap(item))
        .toList();

    print('pppppppppppppppppppp');
    return previousItems;
  }

  List<Match> loadSavedDataFootBall() {
    final box = GetStorage();
    final List<dynamic>? previousItemsAsMaps = box.read('savedFoot');
    if (previousItemsAsMaps == null) {
      return [];
    }
    final List<Match> previousItems = previousItemsAsMaps
        .map((item) => Match.fromMap(item))
        .toList();
    return previousItems;
  }

  List<Match> loadSavedDataHockey() {
    final box = GetStorage();
    final List<dynamic>? previousItemsAsMaps = box.read('savedHockey');

    if (previousItemsAsMaps == null) {
      return [];
    }

    final List<Match> previousItems = previousItemsAsMaps
        .map((item) => Match.fromMap(item))
        .toList();
    return previousItems;
  }

  List<Match> loadSavedDataBasketball() {
    final box = GetStorage();
    final List<dynamic>? previousItemsAsMaps = box.read('savedBasket');

    if (previousItemsAsMaps == null) {
      return [];
    }
    final List<Match> previousItems = previousItemsAsMaps
        .map((item) => Match.fromMap(item))
        .toList();
    return previousItems;
  }
}