import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_live_wallpaper/src/screens/main_screens/library/bloc/library_bloc.dart';
import 'package:set_live_wallpaper/src/util/proccess/not_found.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Images'),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => LibraryBloc()..add(LibraryMediaLoadEvent()),
        child: BlocBuilder<LibraryBloc, LibraryState>(
          builder: (context, state) {
            if (state is LibraryLoadingState) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is LibrarySuccessState) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<LibraryBloc>().add(LibraryMediaLoadEvent());
                },
                child: GridView.builder(
                  padding: const EdgeInsets.all(8),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: state.mediaFiles.length,
                  itemBuilder: (context, index) {
                    final imageFile = state.mediaFiles[index];
                    return GestureDetector(
                      onTap: () {
                        // Ko'rsatilgan rasmga ishlov berish
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade200,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.file(
                            imageFile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            } else if (state is LibraryErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 80, color: Colors.red),
                    const SizedBox(height: 16),
                    Text('Error: ${state.errorMessage}'),
                    TextButton(
                      onPressed: () {
                        context.read<LibraryBloc>().add(LibraryMediaLoadEvent());
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is LibraryEmptyState) {
              return const NotFound();
            }
            return const Center(child: Text('Unexpected state'));
          },
        ),
      ),
    );
  }
}
