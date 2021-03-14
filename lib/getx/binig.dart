
import 'package:get/get.dart';

import 'init_data.dart';

class Bindingg extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => Data_initialization());
  }

}