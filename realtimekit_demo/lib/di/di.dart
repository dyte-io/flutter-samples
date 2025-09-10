import 'package:realtimekit_demo/notifiers/settings_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:realtimekit_core/realtimekit_core.dart';
final getIt = GetIt.instance;
void setupDependecies() {
  getIt.registerSingleton<RealtimekitClient>(RealtimekitClient());
  getIt.registerSingleton<LocalUserSettingsRepository>(
      LocalUserSettingsRepository(dyteMobileClient));
}

final dyteMobileClient = getIt.get<RealtimekitClient>();
final localUserSettingsRepository = getIt.get<LocalUserSettingsRepository>();
