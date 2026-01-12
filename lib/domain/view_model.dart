import 'package:flutter/material.dart';
import 'package:networking/data/models/album_model.dart';
import 'package:networking/domain/repo/album_repo.dart';

class AlbumViewModel extends ChangeNotifier {
  final AlbumRepository _repository = AlbumRepository();

  Album? _album;
  bool _isLoading = false;
  String? _errorMessage;

  Album? get album => _album;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> loadAlbum() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _album = await _repository.getAlbum();
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}