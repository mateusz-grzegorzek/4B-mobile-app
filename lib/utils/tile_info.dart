import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tile_info.g.dart';

@JsonSerializable()
class TileInfo extends Object {
  int mId;
  String mFamily;
  String mTitle;
  String mBody;

  TileInfo(this.mId, this.mFamily, this.mTitle, this.mBody);

  Card fGetTileCard() {
    return new Card(
      child: new ListTile(
        title: new Text(
          mTitle,
          style: new TextStyle(
            color: Colors.blue,
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        subtitle: new Text(mBody),
      ),
    );
  }

  void fLog() {
    print("TileInfo:mId=$mId,mFamily=$mFamily,mTitle=$mTitle,mBody=$mBody");
  }

  Map<String, dynamic> toJson() => _$TileInfoToJson(this);

  factory TileInfo.fromJson(Map<String, dynamic> json) =>
      _$TileInfoFromJson(json);
}
