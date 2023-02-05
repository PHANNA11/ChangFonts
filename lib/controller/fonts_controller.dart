import 'package:get/get.dart';

class FontController extends GetxController {
  RxList<String> fonts = [' DancingScript', 'Domine', 'NotoSansSymbols2'].obs;
  RxString fontUse = ''.obs;
  intFont() async {
    fontUse = fonts.last.obs;
    update();
    return fontUse;
  }

  changFont(int index) {
    fontUse = fonts[index].obs;
    update();
  }
}
