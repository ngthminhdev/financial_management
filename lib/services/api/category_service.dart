import 'package:financial_management/constant/app_constant.dart';
import 'package:financial_management/model/category_model.dart';
import 'package:financial_management/services/http_service.dart';

class CategoryService {
  String endpoint = 'category';
  late HttpService http;

  CategoryService() {
    http = HttpService();
    http.withHost(appConstant.apiHost);
    http.withPath(endpoint);
  }


  Future<List<CategoryModel>> getList(Map<String, String> queries) async {
    http.makeGet();
    http.withQueries(queries);

    Response response = await http.execute();
    List<CategoryModel> list = [];

    for (var json in List<dynamic>.from(response.data)) {
      final CategoryModel category = CategoryModel.fromJson(json);
      list.add(category);
    } 
    
    return list;
  }
}
