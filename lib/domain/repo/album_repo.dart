import 'package:networking/data/models/album_model.dart';
import 'package:networking/data/services/album_service.dart';

class AlbumRepository {
  final AlbumService _service = AlbumService();

  Future<Album> getAlbum() async {
    final data = await _service.fetchAlbumRaw();
    return Album.fromJson(data);
  }
}