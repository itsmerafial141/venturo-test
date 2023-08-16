// ignore_for_file: constant_identifier_names

class EndPoint {
  // API
  static const String API_URL = 'https://tes-mobile.landa.id/api';
  static const Duration API_TIMEOUT = Duration(seconds: 30);

  // API HEADERS
  static const String HEADERS_API_KEY = 'Api-key';

  // ENDPOINT
  static const String MENUS = '/menus';
  static const String VOUCHERS = '/vouchers';
  static const String ORDER = '/order';
  static const String CANCEL = '/order/cancel';
}
