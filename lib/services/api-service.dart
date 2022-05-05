part of 'services.dart';

class API {
  static get(String url) async {
    var res = await Dio().get(url);
    return res;
  }
}
