import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  void write(String key, dynamic value) => GetStorage().write(key, value);
  
  void erase() => GetStorage().erase();

  dynamic read(String key) => GetStorage().read(key);

  bool isNull(String key) => GetStorage().read(key) == null;
}
