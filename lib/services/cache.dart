import 'dart:developer';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:jokerge/models/models.dart';

class AccountCache {
  static const String _key = "account_credentials";
  static final APICacheManager _cacheManager = APICacheManager();

  static Future<AccountCredentials?> getCredentials() async {
    if (await _cacheManager.isAPICacheKeyExist(_key)) {
      var data = await _cacheManager.getCacheData(_key);
      return AccountCredentials.fromRawJson(data.syncData);
    }

    return null;
  }

  static Future<bool> setCredentials(AccountCredentials credentials) async {
    var data = APICacheDBModel(
      key: _key,
      syncData: credentials.toRawJson(),
    );

    return await _cacheManager.addCacheData(data);
  }

  static Future<bool> clear() async {
    return await _cacheManager.deleteCache(_key);
  }
}
