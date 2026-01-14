import 'package:flutter/material.dart';
import 'package:networking/di/di_setup.dart';
import 'package:networking/app/view_models/view_model.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
  final AlbumViewModel _viewModel = getIt<AlbumViewModel>();

  @override
  void initState() {
    super.initState();
    _viewModel.loadAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('MVVM Fetch Data')),
      body: Center(
        child: ListenableBuilder(
          listenable: _viewModel,
          builder: (context, _) {
            if (_viewModel.isLoading) {
              return const CircularProgressIndicator();
            }

            if (_viewModel.errorMessage != null) {
              return Text('Error: ${_viewModel.errorMessage}');
            }

            if (_viewModel.album != null) {
              return Text(
                "${_viewModel.album!.title} - this is response",
                style: const TextStyle(fontSize: 20),
              );
            }

            return const Text('No data found');
          },
        ),
      ),
    );
  }
}
