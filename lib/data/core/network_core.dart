class NetworkCore {
  Uri getURI(String path) {
    if (path.contains('voteCount')) {
      return Uri.http('127.0.0.1:8000', path);
    } else {
      return Uri.http('127.0.0.1:8000', '$path/');
    }
  }
}
