class HomeResponse {
  bool? status;
  List<Sliders>? sliders;
  List<void>? stories;
  String? bannerStatic;
  List<void>? testimonials;
  List<Associates>? associates;

  HomeResponse(
      {this.status,
      this.sliders,
      this.stories,
      this.bannerStatic,
      this.testimonials,
      this.associates});

  HomeResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['sliders'] != null) {
      sliders = <Sliders>[];
      json['sliders'].forEach((v) {
        sliders!.add(Sliders.fromJson(v));
      });
    }
    bannerStatic = json['banner_static'];
    if (json['associates'] != null) {
      associates = <Associates>[];
      json['associates'].forEach((v) {
        associates!.add(Associates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (sliders != null) {
      data['sliders'] = sliders!.map((v) => v.toJson()).toList();
    }
    data['banner_static'] = bannerStatic;
    if (associates != null) {
      data['associates'] = associates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sliders {
  String? title;
  String? id;
  String? description;
  String? sliderImage;

  Sliders({this.title, this.id, this.description, this.sliderImage});

  Sliders.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    id = json['id'];
    description = json['description'];
    sliderImage = json['slider_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['id'] = id;
    data['description'] = description;
    data['slider_image'] = sliderImage;
    return data;
  }
}

class Associates {
  String? associateName;
  String? image;
  String? address;

  Associates({this.associateName, this.image, this.address});

  Associates.fromJson(Map<String, dynamic> json) {
    associateName = json['associate_name'];
    image = json['image'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['associate_name'] = associateName;
    data['image'] = image;
    data['address'] = address;
    return data;
  }
}
