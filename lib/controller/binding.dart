import 'package:get/get.dart';
import 'package:student_database/controller/controller.dart';

class GetxBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Controller());
  }
}
