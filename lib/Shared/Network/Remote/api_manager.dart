import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:islami_app/Models/NewsResponse.dart';
import 'package:islami_app/Models/SourcesResponse.dart';
import 'package:islami_app/Shared/Components/constants.dart';

class ApiManager {

  static Future<SourcesResponse> getSources(String catID) async{
    Uri url = Uri.https(BASE_URL, "/v2/top-headlines/sources",
    {
      "apiKey":API_KEY,
      "category":catID,

    }
    );
    Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourcesResponse data= SourcesResponse.fromJson(jsonData);
    return data;
  }

  static Future<NewsResponse> getNewsData(String sourceID)async{
    Uri url = Uri.https(BASE_URL, "/v2/everything",
        {
          "apiKey":API_KEY,
          "sources":sourceID,
        }
    );
    http.Response response=await http.get(url);
    var jsonData= jsonDecode(response.body);
    NewsResponse newsResponse=NewsResponse.fromJson(jsonData);
    return newsResponse;
  }

  // static Future<NewsResponse> getSpecificArticle(String sourceID)async{
  //   Uri url = Uri.https(BASE_URL, "/v2/everything",
  //       {
  //         "apiKey":API_KEY,
  //         "sources":sourceID,
  //       }
  //   );
  //   http.Response response=await http.get(url);
  //   var jsonData= jsonDecode(response.body);
  //   NewsResponse newsResponse=NewsResponse.fromJson(jsonData);
  //   return newsResponse;
  // }

  static Future<NewsResponse> searchNewsData(String sourceID,String search)async{
    Uri url = Uri.https(BASE_URL, "/v2/everything",
        {
          "apiKey":API_KEY,
          "sources":sourceID,
          "q":search
        }
    );
    http.Response response=await http.get(url);
    var jsonData= jsonDecode(response.body);
    NewsResponse newsResponse=NewsResponse.fromJson(jsonData);
    return newsResponse;
  }
}