import 'review_model.dart';

/// id : 755898
/// page : 1
/// results : [{"author":"MovieGuys","author_details":{"name":"","username":"MovieGuys","avatar_path":null,"rating":6},"content":"Its amazing what you accomplish with a creative script, even on a limited budget. \r\n\r\n\"War of the Worlds\" isn't going to win any awards but  its nonetheless still quite entertaining. \r\n\r\nThe notion of the whole alien invasion playing out from the control room of a US NSA surveillance agent, is novel, as is the manner in which everything is nicely brought together. The acting  is decent too, so no complaints there, either. \r\n\r\nPerhaps the only limited downside is the special effects, which are only passable. That said, they still function well enough, to make the whole thing enjoyable. \r\n\r\nIn summary, a simple but watchable sci fi experience. A nice distraction for a wet weekend.","created_at":"2025-07-31T05:52:34.202Z","id":"688b04a2e6ed8e883ab5b289","updated_at":"2025-07-31T05:56:21.691Z","url":"https://www.themoviedb.org/review/688b04a2e6ed8e883ab5b289"},{"author":"Microcosmic","author_details":{"name":"","username":"Microcosmic","avatar_path":null,"rating":2},"content":"Trash. Uber trash. Worst use of an IP to date.","created_at":"2025-08-09T06:16:32.146Z","id":"6896e7c097e8b74ed492e923","updated_at":"2025-08-15T22:46:38.350Z","url":"https://www.themoviedb.org/review/6896e7c097e8b74ed492e923"},{"author":"r96sk","author_details":{"name":"","username":"r96sk","avatar_path":"/mwR7rFHoDcobAx1i61I3skzMW3U.jpg","rating":2},"content":"<em>'War of the Worlds'</em>... boy oh boy. I've been out of the film loop recently, but word of this disaster even reached me. I had to check it out for myself to get it watched before I got spoiled. Sometimes the internet piles in to jointly overhate a movie... this is not one of those times.\r\n\r\nWhat a mess, there are sadly no redeeming qualities to it. First and foremost, it takes itself way too seriously. There are (I think) a few jokes scattered in there, though they last for literal seconds - everything else is played straight. It had a better chance of working as a comedy, albeit barely.\r\n\r\nThe initial novelty of the \"screenlife\" (never knew that was a thing until now) set-up is kinda interesting, though it very quickly wears off completely. It ends up getting annoying, especially the constant calling noises - almost gave me a headache. It'd work as a short, not for 90mins!\r\n\r\nThe computer stuff looks quite awful too, the most boring and least creative way of utilizing the whole PC concept too. They literally just zoom in and out for the entire flick. There is one scene where they do the <em>'Jaws'</em> dolly zoom effect, which is minorly cool to be fair.\r\n\r\nThere is also a piece of photoshop right at the end that is hilariously bad, I'm pretty certain I could do a better job... OK, maybe not, but you know. The whole ending had me chuckling (negatively) at the film, with that aforementioned moment but also with that flying delivery thing.\r\n\r\nI've got this far into this (overly long) review without noting the acting talent. It has a few good names attached, but none of them do anything remotely standout - but, in fairness, have barely anything to work with. You could place any world leading lad or lass in this and it'd be the same.\r\n\r\nIce Cube... I'm gonna let this one slide, because I do like him. Same goes for Eva Longoria. Both of 'em are, erm, not good though. The only actor I'd give a tiny solace of praise to would be Devon Bostick (Rodrick to you and I), who has one scene where his teary eyes look kinda convincing. As you can see, I'm reaching!\r\n\r\nI don't know what's worse. This movie, or the fact that I've just typed up seven paragraphs about it. We're both as bad as each other! This only avoids the bottom rating from yours truly through comparison. Incredibly, I have seen worse.","created_at":"2025-08-17T12:32:15.871Z","id":"68a1cbcf459b98444f61c0da","updated_at":"2025-08-17T12:32:15.968Z","url":"https://www.themoviedb.org/review/68a1cbcf459b98444f61c0da"}]
/// total_pages : 1
/// total_results : 3

class ReviewsResponse {
  ReviewsResponse({
      this.id, 
      this.page, 
      this.reviews,
      this.totalPages, 
      this.totalResults,});

  ReviewsResponse.fromJson(dynamic json) {
    id = json['id'];
    page = json['page'];
    if (json['results'] != null) {
      reviews = [];
      json['results'].forEach((v) {
        reviews?.add(ReviewModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
  int? id;
  int? page;
  List<ReviewModel>? reviews;
  int? totalPages;
  int? totalResults;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['page'] = page;
    if (reviews != null) {
      map['results'] = reviews?.map((v) => v.toJson()).toList();
    }
    map['total_pages'] = totalPages;
    map['total_results'] = totalResults;
    return map;
  }

}