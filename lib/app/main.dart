import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:networking/di/di_setup.dart';
import 'package:networking/domain/view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "my_secrets.env");
  setupDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorSchemeSeed: Colors.deepPurple),
      home: const AlbumScreen(),
    );
  }
}

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
