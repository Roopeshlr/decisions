import 'dart:convert';

List<ItemsResponse> itemsResponseFromJson(String str) => List<ItemsResponse>.from(json.decode(str).map((x) => ItemsResponse.fromJson(x)));

String itemsResponseToJson(List<ItemsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemsResponse {
  ItemsResponse({
    this.name,
    this.definitionUrl,
  });

  String name;
  String definitionUrl;

  factory ItemsResponse.fromJson(Map<String, dynamic> json) => ItemsResponse(
    name: json["name"] == null ? null : json["name"],
    definitionUrl: json["definitionUrl"] == null ? null : json["definitionUrl"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "definitionUrl": definitionUrl == null ? null : definitionUrl,
  };
}
