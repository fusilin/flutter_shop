class CategoryBigModel {
  String mallCategoryId; //类别编号
  String mallCategoryName; //类别名称
  List<dynamic> bxMallSubDto; //小类列表
//  List<BxMallSubDto> bxMallSubDto;
  String image; //类别图片
  Null comments; //列表描述

  //构造函数
  CategoryBigModel(
      {this.mallCategoryId,
      this.mallCategoryName,
      this.comments,
      this.image,
      this.bxMallSubDto});

  //工厂模式-用这种模式可以省略New关键字
  factory CategoryBigModel.fromJson(dynamic json) {
//    var list = (json['bxMallSubDto'] as List).cast();
//    print('运行类型1111111111111111111:${list.runtimeType}');
//    List<BxMallSubDto> bxMallSubDtoList =
//        list.map((i) => BxMallSubDto.fromJson(i)).toList();

    return CategoryBigModel(
        mallCategoryId: json['mallCategoryId'],
        mallCategoryName: json['mallCategoryName'],
        comments: json['comments'],
        image: json['image'],
//        bxMallSubDto: json['bxMallSubDto']);
        bxMallSubDto: json['bxMallSubDto']);
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
