import 'package:networking/data/models/album_model.dart';
import 'package:networking/data/services/album_service.dart';
import 'package:networking/di/di_setup.dart';

class AlbumRepository {
  final AlbumService _albumService;
  AlbumRepository(this._albumService);

  Future<Album> getAlbum() async {
    final data = await _albumService.fetchAlbumRaw();
    return Album.fromJson(data);
  }
}
