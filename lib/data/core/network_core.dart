class NetworkCore {
  Uri getURI(String path) {
    if (path.contains('voteCount')) {
      return Uri.http('192.168.196.118:8000', path);
    } else {
      return Uri.http('192.168.196.118:8000', '$path/');
    }
  }
}
