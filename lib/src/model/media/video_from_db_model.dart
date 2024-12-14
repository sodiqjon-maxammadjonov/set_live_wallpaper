class VideoModel {
  final String path;
  final String name;
  final String resolution;
  final String duration;
  final String thumbnail;

  VideoModel({
    required this.path,
    required this.name,
    required this.resolution,
    required this.duration,
    required this.thumbnail,
  });

  @override
  String toString() {
    return '''
Name: $name
Path: $path
Resolution: $resolution
Duration: $duration
Thumbnail: $thumbnail
''';
  }
}
