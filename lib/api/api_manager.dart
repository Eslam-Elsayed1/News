

import 'dart:convert';


import '../models/articles_response.dart';
import '../models/sources_response.dart';
import 'api_constants.dart';

class ApiManager {
  /// Fetching News `Sourses`
  static Future<SourcesResponse?> getNewsSourses(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.soursesEndpoint, {
      'apiKey': '7e883fc9bfd14d3ba75fca0738b2ca19',
      'category': categoryId,
    });
    var http;
    try {
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      return SourcesResponse.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }

  /// Fetch News `Articles` by News [Sourse Id]
  static Future<ArticlesResponse?> getNewsArticles(String sourceID,
      {int? pageSize, int? page}) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.articlesEndpoint, {
      'apiKey': '7e883fc9bfd14d3ba75fca0738b2ca19',
      'sources': sourceID,
      'pageSize': "10",
      'page': "$page"
    });
    var http;
    try {
      var response = await http.get(url);
      var jsonData = jsonDecode(response.body);
      return ArticlesResponse.fromJson(jsonData);
    } catch (e) {
      throw e;
    }
  }

  /// Fetch News `Articles` with [query] of the `User` input in `SearchBar`
  static Future<ArticlesResponse?> getSearchedNewsArticles(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.articlesEndpoint,
        {'apiKey': '7e883fc9bfd14d3ba75fca0738b2ca19', 'q': query});
    var http;
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    return ArticlesResponse.fromJson(jsonData);
  }
  /**
   * https://newsapi.org/v2/top-headlines/sources?apiKey=
   * 1f947e49d6534e428bdda6cc3e84d7d6
   */
}
