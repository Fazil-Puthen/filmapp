class moviemodel {
  List<Result>? result;
  QueryParam? queryParam;
  int? code;
  String? message;

  moviemodel({this.result, this.queryParam, this.code, this.message});

  moviemodel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    queryParam = json['queryParam'] != null
        ? new QueryParam.fromJson(json['queryParam'])
        : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }
    if (this.queryParam != null) {
      data['queryParam'] = this.queryParam!.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Result {
  String? sId;
  String? description;
  List<String>? director;
  List<String>? writers;
  List<String>? stars;
  List<String>? productionCompany;
  int? pageViews;
  List<String>? upVoted;
  List<String>? downVoted;
  String? title;
  String? language;
  int? runTime;
  int? releasedDate;
  String? genre;
  List<Voted>? voted;
  String? poster;
  int? totalVoted;
  int? voting;

  Result(
      {this.sId,
      this.description,
      this.director,
      this.writers,
      this.stars,
      this.productionCompany,
      this.pageViews,
      this.upVoted,
      this.downVoted,
      this.title,
      this.language,
      this.runTime,
      this.releasedDate,
      this.genre,
      this.voted,
      this.poster,
      this.totalVoted,
      this.voting});

  Result.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    description = json['description'];
    
   director = json['director'] != null ? List<String>.from(json['director']) : null;
   writers = json['writers'] != null ? List<String>.from(json['writers']) : null;
   stars = json['stars'] != null ? List<String>.from(json['stars']) : null;
   productionCompany = json['productionCompany'] != null ? List<String>.from(json['productionCompany']) : null;
   pageViews = json['pageViews'];
   upVoted = json['upVoted'] != null ? List<String>.from(json['upVoted']) : null;
   downVoted = json['downVoted'] != null ? List<String>.from(json['downVoted']) : null;
    title = json['title'];
    language = json['language'];
    runTime = json['runTime'];
    releasedDate = json['releasedDate'];
    genre = json['genre'];
    if (json['voted'] != null) {
      voted = <Voted>[];
      json['voted'].forEach((v) {
        voted!.add(new Voted.fromJson(v));
      });
    }
    poster = json['poster'];
    totalVoted = json['totalVoted'];
    voting = json['voting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['description'] = this.description;
    data['director'] = this.director;
    data['writers'] = this.writers;
    data['stars'] = this.stars;
    data['productionCompany'] = this.productionCompany;
    data['pageViews'] = this.pageViews;
    data['upVoted'] = this.upVoted;
    data['downVoted'] = this.downVoted;
    data['title'] = this.title;
    data['language'] = this.language;
    data['runTime'] = this.runTime;
    data['releasedDate'] = this.releasedDate;
    data['genre'] = this.genre;
    if (this.voted != null) {
      data['voted'] = this.voted!.map((v) => v.toJson()).toList();
    }
    data['poster'] = this.poster;
    data['totalVoted'] = this.totalVoted;
    data['voting'] = this.voting;
    return data;
  }
}

class Voted {
  List<String>? upVoted;
  List<String>? downVoted;
  String? sId;
  int? updatedAt;
  String? genre;

  Voted({this.upVoted, this.downVoted, this.sId, this.updatedAt, this.genre});

  Voted.fromJson(Map<String, dynamic> json) {
    upVoted = json['upVoted'].cast<String>();
    downVoted = json['downVoted'].cast<String>();
    sId = json['_id'];
    updatedAt = json['updatedAt'];
    genre = json['genre'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upVoted'] = this.upVoted;
    data['downVoted'] = this.downVoted;
    data['_id'] = this.sId;
    data['updatedAt'] = this.updatedAt;
    data['genre'] = this.genre;
    return data;
  }
}

class QueryParam {
  String? category;
  String? language;
  String? genre;
  String? sort;

  QueryParam({this.category, this.language, this.genre, this.sort});

  QueryParam.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    language = json['language'];
    genre = json['genre'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['language'] = this.language;
    data['genre'] = this.genre;
    data['sort'] = this.sort;
    return data;
  }
}
