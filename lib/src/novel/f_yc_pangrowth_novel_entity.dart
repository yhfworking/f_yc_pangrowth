import 'dart:convert';

class FYcPangrowthNovelEntity {
  FYcPangrowthNovelEntity({
    required this.code,
    this.msg,
    this.data,
  });

  factory FYcPangrowthNovelEntity.fromJson(Map<String, dynamic> jsonRes) {
    final List<NovelEntityData>? data =
        jsonRes['data'] is List ? <NovelEntityData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(NovelEntityData.fromJson(Map<String, dynamic>.from(item)));
        }
      }
    }
    return FYcPangrowthNovelEntity(
      code: jsonRes['code']!,
      msg: jsonRes['msg'],
      data: data,
    );
  }

  bool code;
  String? msg;
  List<NovelEntityData>? data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'msg': msg,
        'data': data,
      };

  FYcPangrowthNovelEntity copy() {
    return FYcPangrowthNovelEntity(
      code: code,
      msg: msg,
      data: data?.map((NovelEntityData e) => e.copy()).toList(),
    );
  }
}

class NovelEntityData {
  NovelEntityData({
    required this.readUrl,
    required this.bookName,
    required this.type,
    required this.thumbUrl,
    required this.novelDetail,
  });

  factory NovelEntityData.fromJson(Map<String, dynamic> jsonRes) =>
      NovelEntityData(
        readUrl: jsonRes['readUrl']!,
        bookName: jsonRes['bookName']!,
        type: jsonRes['type']!,
        thumbUrl: jsonRes['thumbUrl']!,
        novelDetail: jsonRes['novelDetail']!,
      );

  String readUrl;
  String bookName;
  int type;
  String thumbUrl;
  String novelDetail;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'readUrl': readUrl,
        'bookName': bookName,
        'type': type,
        'thumbUrl': thumbUrl,
        'novelDetail': novelDetail,
      };

  NovelEntityData copy() {
    return NovelEntityData(
      readUrl: readUrl,
      bookName: bookName,
      type: type,
      thumbUrl: thumbUrl,
      novelDetail: novelDetail,
    );
  }
}
