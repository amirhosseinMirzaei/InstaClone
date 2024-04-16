class StoryData {
  final int id;
  final String name;
  final String imageFileName;

  final bool isViewed;

  StoryData(
      {required this.id,
      required this.name,
      required this.imageFileName,
      required this.isViewed});
}

class PostData {
  final int id;
  final String caption;
  final String personName;
  final String userName;
  final String likes;
  final String interaction;
  final String view;
  final String imageFileName;
  final String profileImage;
  final DateTime dateTime;

  PostData(
      {required this.id,
      required this.caption,
      required this.personName,
      required this.userName,
      required this.likes,
      required this.interaction,
      required this.view,
      required this.imageFileName,
      required this.profileImage,
      required this.dateTime});
}

class AppDatabase {
  static List<StoryData> get stories {
    return [
      StoryData(
          id: 1001,
          name: 'Emilia',
          imageFileName: 'story_9.jpg',
          isViewed: false),
      StoryData(
          id: 1002,
          name: 'Richard',
          imageFileName: 'story_10.jpg',
          isViewed: false),
      StoryData(
          id: 1003,
          name: 'Jasmine',
          imageFileName: 'story_1.jpg',
          isViewed: true),
      StoryData(
          id: 1004,
          name: 'Lucas',
          imageFileName: 'story_3.jpg',
          isViewed: false),
      StoryData(
          id: 1005,
          name: 'Isabella',
          imageFileName: 'story_4.jpg',
          isViewed: false),
      StoryData(
          id: 1006,
          name: 'Olivia',
          imageFileName: 'story_6.jpg',
          isViewed: false),
      StoryData(
          id: 1007,
          name: 'Amelia',
          imageFileName: 'story_7.jpg',
          isViewed: false),
      StoryData(
          id: 1008,
          name: 'Grace',
          imageFileName: 'story_2.jpg',
          isViewed: false),
    ];
  }

  static List<PostData> get posts {
    return [
      PostData(
        userName: 'albert901',
        caption:
            'What do you think about AI? You are thinking of a limited scale or should be the development of the next step? Maybe humanity doesn’t ready for this situation. Who knows?  #AI #humanity #chatgpt #ArtificialIntelligence',
        likes: '245k',
        imageFileName: 'post1.png',
        personName: 'Albert 901',
        id: 3,
        interaction: '256K',
        view: '20K',
        profileImage: 'story_2.jpg',
        dateTime: DateTime.now(),
      ),
      PostData(
          id: 0,
          caption:
              'Amerika’da “Citizen” diye bir uygulama var. Çevrende olan suçları anlık olarak sana bildiriyor. Bi süredir bakıyordum insana anksiyete veriyor full. Bugün gördüm, lokasyon bazlı olarak offenderları listelemeye başlamışlar. İyi mi kötü mü bilmiyorum.',
          likes: '1.2k',
          imageFileName: 'post2.png',
          personName: 'Delsa',
          userName: 'Ayemunt',
          interaction: '250K',
          view: '30K',
          profileImage: 'story_4.jpg',
          dateTime: DateTime.now().subtract(const Duration(days: 40))),
    ];
  }
}
