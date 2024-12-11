import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:set_live_wallpaper/src/model/media/media_from_db_model.dart' as mediaModel;
import 'package:set_live_wallpaper/src/screens/main_screens/library/bloc/library_bloc.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final libraryBloc = BlocProvider.of<LibraryBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kutubxona'),
        actions: [
          PopupMenuButton<MediaType>(
            onSelected: (mediaType) {
              libraryBloc.add(FilterMediaEvent(mediaType));
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: MediaType.all,
                child: Text("Barchasi"),
              ),
              const PopupMenuItem(
                value: MediaType.images,
                child: Text("Rasmlar"),
              ),
              const PopupMenuItem(
                value: MediaType.videos,
                child: Text("Videolar"),
              ),
            ],
          ),
        ],
      ),
      body: BlocBuilder<LibraryBloc, LibraryState>(
        builder: (context, state) {
          if (state is LibraryLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LibraryErrorState) {
            return Center(
              child: Text(state.error),
            );
          } else if (state is LibraryLoadedState) {
            final mediaList = state.media;

            if (mediaList.isEmpty) {
              return const Center(
                child: Text("Media topilmadi."),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemCount: mediaList.length,
                itemBuilder: (context, index) {
                  final media = mediaList[index];
                  return GestureDetector(
                    onTap: () {

                    },
                    child: GridTile(
                      footer: GridTileBar(
                        backgroundColor: Colors.black54,
                        title: Text(
                          media.type == mediaModel.MediaType.images
                              ? "Rasm"
                              : "Video",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      ),
                      child: media.type == mediaModel.MediaType.images
                          ? Image.file(
                        File(media.path),
                        fit: BoxFit.cover,
                      )
                          : const Icon(
                        Icons.video_library,
                        size: 40.0,
                        color: Colors.grey,
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return const Center(
            child: Text("Noma'lum holat."),
          );
        },
      ),
    );
  }
}
