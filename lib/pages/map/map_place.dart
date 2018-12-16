import 'package:json_annotation/json_annotation.dart';

part 'map_place.g.dart';

@JsonSerializable()
class MapPlace extends Object with _$MapPlaceSerializerMixin {
  MapPlace(this.mId, this.mAddress, this.mName, this.mCoordX, this.mCoordY);

  int mId;
  String mAddress;
  String mName;
  double mCoordX;
  double mCoordY;
  void log() {
    print("Place:mId" +
        mId.toString() +
        ",mAddress=" +
        mAddress +
        ",mName=" +
        mName +
        ",mCoordX=" +
        mCoordX.toString() +
        ",mCoordY=" +
        mCoordY.toString());
  }

  factory MapPlace.fromJson(Map<String, dynamic> json) =>
      _$MapPlaceFromJson(json);
}
