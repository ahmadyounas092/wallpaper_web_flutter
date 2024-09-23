class WallpapersModel {
  final String photographer;
  final String photographerUrl;
  final int photographerId;
  final SrcModel src;

  WallpapersModel({
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.src,
  });

  factory WallpapersModel.fromMap(Map<String, dynamic> jsonData) {
    print('WallpapersModel.fromMap: $jsonData'); // Debug print
    return WallpapersModel(
      photographer: jsonData['photographer'],
      photographerUrl: jsonData['photographer_url'],
      photographerId: jsonData['photographer_id'],
      src: SrcModel.fromMap(jsonData['src']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'src': src.toMap(),
    };
  }
}

class SrcModel {
  final String original;
  final String small;
  final String portrait;

  SrcModel({
    required this.original,
    required this.small,
    required this.portrait,
  });

  factory SrcModel.fromMap(Map<String, dynamic> jsonData) {
    print('SrcModel.fromMap: $jsonData'); // Debug print
    return SrcModel(
      original: jsonData['original'],
      small: jsonData['small'],
      portrait: jsonData['portrait'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'original': original,
      'small': small,
      'portrait': portrait,
    };
  }
}
