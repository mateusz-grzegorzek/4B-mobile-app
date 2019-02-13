import 'package:json_annotation/json_annotation.dart';

part 'news_info.g.dart';

@JsonSerializable()
class NewsInfo extends Object {
  NewsInfo(this.mId, this.mTitle, this.mBody, this.mDate);

  int mId;
  String mTitle;
  String mBody;
  String mDate;

  void fLog() {
    print(
        "NewsInfo:mId=$mId,mTitle=$mTitle,mBody=$mBody,mDate=$mDate");
  }

  Map<String, dynamic> toJson() => _$NewsInfoToJson(this);

  factory NewsInfo.fromJson(Map<String, dynamic> json) =>
      _$NewsInfoFromJson(json);
}
