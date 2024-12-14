// Test Screen
import 'dart:developer';

import 'package:flutter/material.dart';

import '../../function/media/media_function.dart';
import '../main_screens/library/bloc/library_bloc.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Test Media Function')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final mediaFunction = MediaFunction(emit: (state) {
                  log('State: $state');
                  if (state is LibrarySuccessState) {
                    log('Videolar soni: ${state.mediaFiles.length}');
                  } else if (state is LibraryErrorState) {
                    log('Xatolik: ${state.errorMessage}');
                  }
                });
                await mediaFunction.fetchImages();
              },
              child: const Text('Fetch Videos'),
            ),
          ],
        ),
      ),
    );
  }
}