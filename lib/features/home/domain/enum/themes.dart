enum Themes {
  shibuya,
  weekend,
  phone,
  friend,
  hackathon;

  String get keyStringEn {
    switch (this) {
      case Themes.shibuya:
        return 'You are a tourist traveling to Japan. Ask me how to get to Harajuku from Shibuya station.';
      case Themes.weekend:
        return 'You are my friend. Ask about my plans for this weekend.';
      case Themes.phone:
        return 'I am a customer who has come to the store to buy a new smart phone. You are a sales clerk.';
      case Themes.friend:
        return 'You are my friend. Invite me only for tonight.';
      case Themes.hackathon:
        return 'You and I are attending a reception at an app development event. Please talk to me.';
    }
  }

  String get keyStringJp {
    switch (this) {
      case Themes.shibuya:
        return '渋谷駅で海外旅行者を助ける💁';
      case Themes.weekend:
        return '友人に今週末の予定を話す📅';
      case Themes.phone:
        return '新しいスマホを買う📱';
      case Themes.friend:
        return '友人との金曜日💬';
      case Themes.hackathon:
        return 'ハッカソンの懇親会にて🐱‍💻';
    }
  }
}
