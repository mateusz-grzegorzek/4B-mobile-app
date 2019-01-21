import 'package:json_annotation/json_annotation.dart';

part 'tile_info.g.dart';

@JsonSerializable()
class TileInfo extends Object {
  int mId;
  String mFamily;
  String mTitle;
  String mBody;

  TileInfo(this.mId, this.mFamily, this.mTitle, this.mBody);

  TileInfo.setTileInfo(TileInfo aTileInfo) {
    this.mId = aTileInfo.mId;
    this.mFamily = aTileInfo.mFamily;
    this.mTitle = aTileInfo.mTitle;
    this.mBody = aTileInfo.mBody;
  }

  void fLog() {
    print("TileInfo:mId=$mId,mFamily=$mFamily,mTitle=$mTitle,mBody=$mBody");
  }

  Map<String, dynamic> toJson() => _$TileInfoToJson(this);

  factory TileInfo.fromJson(Map<String, dynamic> json) =>
      _$TileInfoFromJson(json);
}
