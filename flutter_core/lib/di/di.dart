import 'package:realtimekit_core/realtimekit_core.dart';
import 'package:flutter_core/notifiers/settings_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupDependecies() {
  getIt.registerSingleton<RealtimekitClient>(RealtimekitClient());
  getIt.registerSingleton<LocalUserSettingsRepository>(
      LocalUserSettingsRepository(realtimekitClient));
}

final realtimekitClient = getIt.get<RealtimekitClient>();
final localUserSettingsRepository = getIt.get<LocalUserSettingsRepository>();
