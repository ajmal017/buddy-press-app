class BuddyPressActivityModal {
  int userId;
  String component;
  Content content;
  String date;
  int id;
  String link;
  int primaryItemId;
  int secondaryItemId;
  String status;
  String title;
  String type;
  bool favorited;
  UserAvatar userAvatar;
  Links lLinks;

  BuddyPressActivityModal(
      {this.userId,
        this.component,
        this.content,
        this.date,
        this.id,
        this.link,
        this.primaryItemId,
        this.secondaryItemId,
        this.status,
        this.title,
        this.type,
        this.favorited,
        this.userAvatar,
        this.lLinks});

  BuddyPressActivityModal.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    component = json['component'];
    content =
    json['content'] != null ? new Content.fromJson(json['content']) : null;
    date = json['date'];
    id = json['id'];
    link = json['link'];
    primaryItemId = json['primary_item_id'];
    secondaryItemId = json['secondary_item_id'];
    status = json['status'];
    title = json['title'];
    type = json['type'];
    favorited = json['favorited'];
    userAvatar = json['user_avatar'] != null
        ? new UserAvatar.fromJson(json['user_avatar'])
        : null;
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['component'] = this.component;
    if (this.content != null) {
      data['content'] = this.content.toJson();
    }
    data['date'] = this.date;
    data['id'] = this.id;
    data['link'] = this.link;
    data['primary_item_id'] = this.primaryItemId;
    data['secondary_item_id'] = this.secondaryItemId;
    data['status'] = this.status;
    data['title'] = this.title;
    data['type'] = this.type;
    data['favorited'] = this.favorited;
    if (this.userAvatar != null) {
      data['user_avatar'] = this.userAvatar.toJson();
    }
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
}

class Content {
  String rendered;

  Content({this.rendered});

  Content.fromJson(Map<String, dynamic> json) {
    rendered = json['rendered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rendered'] = this.rendered;
    return data;
  }
}

class UserAvatar {
  String full;
  String thumb;

  UserAvatar({this.full, this.thumb});

  UserAvatar.fromJson(Map<String, dynamic> json) {
    full = json['full'];
    thumb = json['thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full'] = this.full;
    data['thumb'] = this.thumb;
    return data;
  }
}

class Links {
  List<Self> self;
  List<Self> collection;
  List<User> user;
  List<Self> favorite;

  Links({this.self, this.collection, this.user, this.favorite});

  Links.fromJson(Map<String, dynamic> json) {
    if (json['self'] != null) {
      self = new List<Self>();
      json['self'].forEach((v) {
        self.add(new Self.fromJson(v));
      });
    }
    if (json['collection'] != null) {
      collection = new List<Self>();
      json['collection'].forEach((v) {
        collection.add(new Self.fromJson(v));
      });
    }
    if (json['user'] != null) {
      user = new List<User>();
      json['user'].forEach((v) {
        user.add(new User.fromJson(v));
      });
    }
    if (json['favorite'] != null) {
      favorite = new List<Self>();
      json['favorite'].forEach((v) {
        favorite.add(new Self.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.map((v) => v.toJson()).toList();
    }
    if (this.collection != null) {
      data['collection'] = this.collection.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user.map((v) => v.toJson()).toList();
    }
    if (this.favorite != null) {
      data['favorite'] = this.favorite.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class User {
  bool embeddable;
  String href;

  User({this.embeddable, this.href});

  User.fromJson(Map<String, dynamic> json) {
    embeddable = json['embeddable'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['embeddable'] = this.embeddable;
    data['href'] = this.href;
    return data;
  }
}