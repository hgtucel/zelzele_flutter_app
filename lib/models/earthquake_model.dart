class EarthquakeModel {
  String? depth;
  String? city;
  String? size;
  String? district;
  String? time;

  EarthquakeModel({this.depth, this.city, this.size, this.district, this.time});

  EarthquakeModel.fromJson(Map<String, dynamic> json) {
    depth = json['depth'];
    city = json['city'];
    size = json['size'];
    district = json['district'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['depth'] = depth;
    data['city'] = city;
    data['size'] = size;
    data['district'] = district;
    data['time'] = time;
    return data;
  }
}
