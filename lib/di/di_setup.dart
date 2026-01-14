import 'package:get_it/get_it.dart';
import 'package:networking/data/services/album_service.dart';
import 'package:networking/domain/repo/album_repo.dart';
import 'package:networking/domain/view_model.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerLazySingleton<AlbumService>(() => AlbumService());
  getIt.registerLazySingleton<AlbumRepository>(
    () => AlbumRepository(getIt<AlbumService>()),
  );

  getIt.registerFactory(() => AlbumViewModel(getIt<AlbumRepository>()));
}
