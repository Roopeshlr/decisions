import 'dart:convert';
import 'package:entities/dummy/dummy_form_data.dart';

List<FormItemsResponse> formItemsResponseFromJson(String str) => List<FormItemsResponse>.from(json.decode(str).map((x) => FormItemsResponse.fromJson(x)));

String formItemsResponseToJson(List<FormItemsResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FormItemsResponse {
  FormItemsResponse({
    this.caption,
    this.type,
    this.mandatory,
    this.defaultValue,
    this.validationMessage,
  });

  String caption;
  String type;
  bool mandatory;
  String defaultValue;
  String validationMessage;

  factory FormItemsResponse.fromJson(Map<String, dynamic> json) => FormItemsResponse(
    caption: json["caption"] == null ? null : json["caption"],
    type: json["type"] == null ? null : json["type"],
    mandatory: json["mandatory"] == null ? null : json["mandatory"],
    defaultValue: json["defaultValue"] == null ? null : json["defaultValue"],
    validationMessage: json["validationMessage"] == null ? null : json["validationMessage"],
  );

  Map<String, dynamic> toJson() => {
    "caption": caption == null ? null : caption,
    "type": type == null ? null : type,
    "mandatory": mandatory == null ? null : mandatory,
    "defaultValue": defaultValue == null ? null : defaultValue,
    "validationMessage": validationMessage == null ? null : validationMessage,
  };
}