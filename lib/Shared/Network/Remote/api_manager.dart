import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:islami_app/Models/SourcesResponse.dart';

class ApiManager {

  static Future<SourcesResponse> getSources() async{
    Uri url = Uri.https("newsapi.org", "/v2/top-headlines/sources",
    {
      "apiKey":"ed55dbb9aff04e9a9086358b5753f9bf"
    }
    );
    Response response=await http.get(url);
    var jsonData=jsonDecode(response.body);
    SourcesResponse data= SourcesResponse.fromJson(jsonData);
    return data;
  }
}