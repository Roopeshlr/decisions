import 'package:http/http.dart' as http;
import 'package:remote_api/response/form_list_response.dart';
import 'package:remote_api/response/item_list_response.dart';

Future<List<FormItemsResponse>> RemoteApiServicesFormData(baseUrl)async{
  var url = baseUrl;
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return formItemsResponseFromJson(response.body);
}

Future<List<ItemsResponse>> RemoteApiServicesHomePageData(baseUrl)async{
  var url = baseUrl;
  var response = await http.get(url);
  print('Response body: ${response.body}');
  return itemsResponseFromJson(response.body);
}