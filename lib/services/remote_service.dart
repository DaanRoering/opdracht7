import 'package:opdracht7/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteService {
  Future<List<Post>?> getPosts(String kenteken) async {
    var client = http.Client();
    var uri = Uri.parse(
        'https://opendata.rdw.nl/resource/m9d7-ebf2.json/?kenteken=$kenteken');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}
