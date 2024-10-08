import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:http/http.dart';
import 'package:jokerge/models/const.dart';
import 'package:jokerge/models/models.dart';
import 'package:jokerge/services/cache.dart';
import 'package:logger/logger.dart';

class API {
  static const String _key = "account_info";

  static final Client _client = Client();
  static final APICacheManager _cache = APICacheManager();
  static final Logger _logger = Logger();

  static const String _host = apiHost;
  static final Map<String, String> _routes = {
    authEndpoint: "api/auth",
    orderEndpoint: "api/v1/order",
    orderListEndpoint: "api/v1/order/list",
    orderCreateEndpoint: "api/v1/order/create",
    customerEndpoint: "api/v1/customer",
    customerListEndpoint: "api/v1/customer/list",
    customerCreateEndpoint: "api/v1/customer/create",
    customerUpdateEndpoint: "api/v1/customer/update",
    productEndpoint: "api/v1/product",
    productListEndpoint: "api/v1/product/list",
    productCreateEndpoint: "api/v1/product/create",
    productUpdateEndpoint: "api/v1/product/update",
  };

  static String _prepareAccountCreds(AccountCredentials creds) {
    return base64Encode(utf8.encode("${creds.email}:${creds.password}"));
  }

  static Future<Account?> userInfo() async {
    if (await _cache.isAPICacheKeyExist(_key)) {
      var data = await _cache.getCacheData(_key);
      var account = Account.fromRawJson(data.syncData);
      _logger.i("found account info: $account");
      return account;
    }

    return null;
  }

  static Future<bool> login(AccountCredentials credentials) async {
    var url = Uri.http(_host, _routes[authEndpoint]!);
    var headers = {
      "Content-Type": "application/json",
    };

    var resp = await _client.post(
      url,
      headers: headers,
      body: credentials.toRawJson(),
    );

    if (resp.statusCode != 200) {
      return false;
    }

    var data = APICacheDBModel(
      key: _key,
      syncData: resp.body,
    );

    await _cache.addCacheData(data);

    return await AccountCache.setCredentials(credentials);
  }

  static Future<Iterable<Order>> getOrderList() async {
    var creds = await AccountCache.getCredentials();
    if (creds == null) {
      return [];
    }

    var preparedCreds = _prepareAccountCreds(creds);

    var url = Uri.http(_host, _routes[orderListEndpoint]!);
    var headers = {'Authorization': 'Basic $preparedCreds'};

    final resp = await _client.get(url, headers: headers);

    if (resp.statusCode != 200) {
      _logger.e("failed to get orders: ${resp.body}");
      return [];
    }

    final body = json.decode(resp.body) as List<dynamic>;
    List<Order> orders = [];

    for (var val in body) {
      var order = Order.fromJson(val);
      orders.add(order);
    }

    return orders;
  }
}
