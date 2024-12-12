import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_live_wallpaper/src/screens/main_screens/library/bloc/library_bloc.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
      ),
      body: BlocProvider(
        create: (context) => LibraryBloc()..add(LibraryMediaLoadEvent()),
        child: BlocBuilder<LibraryBloc, LibraryState>(
          builder: (context, state) {
            if (state is LibraryLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is LibrarySuccessState) {
              return ListView.builder(
                itemCount: state.mediaFiles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Icon(Icons.video_library),
                    title: Text(state.mediaFiles[index].path),
                    onTap: () {

                    },
                  );
                },
              );
            } else if (state is LibraryErrorState) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            } else if (state is LibraryEmptyState) {
              return const Center(child: Text('No videos found.'));
            }
            return const Center(child: Text('Unexpected state.'));
          },
        ),
      ),
    );
  }
}
