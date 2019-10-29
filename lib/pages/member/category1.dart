class CategoryBigModel {
  String mallCategoryId;
  String mallCategoryName;
  List<BxMallSubDto> bxMallSubDto;
  Null comments;
  String image;

  CategoryBigModel(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.bxMallSubDto,
      this.comments,
      this.image});

  factory CategoryBigModel.fromJson(Map<String, dynamic> json) {
//
//    var bxMallSubDto = new List<BxMallSubDto>();
//    if (json['bxMallSubDto'] != null) {
//      json['bxMallSubDto'].forEach((v) {
//        bxMallSubDto.add(new BxMallSubDto.fromJson(v));
//      });
//    }

    var list = json['BxMallSubDto'] as List;
    print('运行类型1111111111111111111:${list.runtimeType}');
    List<BxMallSubDto> bxMallSubDtoList =
        list.map((i) => BxMallSubDto.fromJson(i)).toList();

    return CategoryBigModel(
      mallCategoryId: json['mallCategoryId'],
      mallCategoryName: json['mallCategoryName'],
      bxMallSubDto: bxMallSubDtoList,
      comments: json['comments'],
      image: json['image'],
    );
  }
}

class BxMallSubDto {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  BxMallSubDto(
      {this.mallSubId, this.mallCategoryId, this.mallSubName, this.comments});

  factory BxMallSubDto.fromJson(Map<String, dynamic> json) {
    return BxMallSubDto(
      mallSubId: json['mallSubId'],
      mallCategoryId: json['mallCategoryId'],
      mallSubName: json['mallSubName'],
      comments: json['comments'],
    );
  }
}

class CategoryBigListModel {
  List<CategoryBigModel> data;

  CategoryBigListModel(this.data);

  factory CategoryBigListModel.formJson(List json) {
    return CategoryBigListModel(
        json.map((i) => CategoryBigModel.fromJson((i))).toList());
  }
}
