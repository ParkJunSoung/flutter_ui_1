class NewsInfo {
  List<Result> result;
  NewsInfo({this.result});
  NewsInfo.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = [];
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class Result {
  String id;
  int imageId;
  int imageThumbId;
  Metadata metadata;
  List<Paragraphs> paragraphs;
  Publication publication;
  String subtitle;
  String title;
  String url;
  Result(
      {this.id,
        this.imageId,
        this.imageThumbId,
        this.metadata,
        this.paragraphs,
        this.publication,
        this.subtitle,
        this.title,
        this.url});
  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    imageThumbId = json['imageThumbId'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['paragraphs'] != null) {
      paragraphs = new List<Paragraphs>();
      json['paragraphs'].forEach((v) {
        paragraphs.add(new Paragraphs.fromJson(v));
      });
    }
    publication = json['publication'] != null
        ? new Publication.fromJson(json['publication'])
        : null;
    subtitle = json['subtitle'];
    title = json['title'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageId'] = this.imageId;
    data['imageThumbId'] = this.imageThumbId;
    if (this.metadata != null) {
      data['metadata'] = this.metadata.toJson();
    }
    if (this.paragraphs != null) {
      data['paragraphs'] = this.paragraphs.map((v) => v.toJson()).toList();
    }
    if (this.publication != null) {
      data['publication'] = this.publication.toJson();
    }
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    data['url'] = this.url;
    return data;
  }
}
class Metadata {
  Author author;
  String date;
  int readTimeMinutes;
  Metadata({this.author, this.date, this.readTimeMinutes});
  Metadata.fromJson(Map<String, dynamic> json) {
    author =
    json['author'] != null ? new Author.fromJson(json['author']) : null;
    date = json['date'];
    readTimeMinutes = json['readTimeMinutes'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    data['date'] = this.date;
    data['readTimeMinutes'] = this.readTimeMinutes;
    return data;
  }
}
class Author {
  String name;
  String url;
  Author({this.name, this.url});
  Author.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
class Paragraphs {
  List<Markups> markups;
  String text;
  String type;
  Paragraphs({this.markups, this.text, this.type});
  Paragraphs.fromJson(Map<String, dynamic> json) {
    if (json['markups'] != null) {
      markups = new List<Markups>();
      json['markups'].forEach((v) {
        markups.add(new Markups.fromJson(v));
      });
    }
    text = json['text'];
    type = json['type'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.markups != null) {
      data['markups'] = this.markups.map((v) => v.toJson()).toList();
    }
    data['text'] = this.text;
    data['type'] = this.type;
    return data;
  }
}
class Markups {
  int end;
  int start;
  String type;
  String href;
  Markups({this.end, this.start, this.type, this.href});
  Markups.fromJson(Map<String, dynamic> json) {
    end = json['end'];
    start = json['start'];
    type = json['type'];
    href = json['href'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['end'] = this.end;
    data['start'] = this.start;
    data['type'] = this.type;
    data['href'] = this.href;
    return data;
  }
}
class Publication {
  String logoUrl;
  String name;
  Publication({this.logoUrl, this.name});
  Publication.fromJson(Map<String, dynamic> json) {
    logoUrl = json['logoUrl'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['logoUrl'] = this.logoUrl;
    data['name'] = this.name;
    return data;
  }
}