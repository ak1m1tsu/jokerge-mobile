import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:jokerge/models/models.dart';
import 'package:logger/logger.dart';

class AccountCache {
  static const String _key = "account_credentials";
  static final APICacheManager _cacheManager = APICacheManager();
  static final Logger _logger = Logger();

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

    var ok = await _cacheManager.addCacheData(data);

    if (ok) {
      _logger.i("the account credentials has been stored: $credentials");
      return ok;
    }

    _logger.e("failed to store the account credentials: $credentials");

    return ok;
  }

  static Future<bool> clear() async {
    return await _cacheManager.deleteCache(_key);
  }
}
