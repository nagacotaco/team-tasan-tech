enum Themes {
  shibuya,
  weekend,
  phone,
  friend,
  hackathon,
  cafe,
  airport,
  taxi,
  hotel,
  restaurant,
  library,
  supermarket,
  hospital,
  gym,
  ;

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
      case Themes.cafe:
        return 'You are ordering a drink at a cafe.';
      case Themes.airport:
        return 'You are at the airport and want to check in for your flight.';
      case Themes.taxi:
        return 'You want to go to a specific location using a taxi.';
      case Themes.hotel:
        return 'You want to check out from the hotel.';
      case Themes.restaurant:
        return 'You want to order food at a restaurant.';
      case Themes.library:
        return 'You are at the library and want to borrow a book.';
      case Themes.supermarket:
        return 'You are doing grocery shopping at the supermarket.';
      case Themes.hospital:
        return 'You are at the hospital for an appointment.';
      case Themes.gym:
        return 'You are at the gym and want to know how to use a machine.';
    }
  }

  String get keyStringJp {
    switch (this) {
      case Themes.shibuya:
        return '渋谷駅で海外旅行者を助ける 💁';
      case Themes.weekend:
        return '友人に今週末の予定を話す 📅';
      case Themes.phone:
        return '新しいスマホを買う📱';
      case Themes.friend:
        return '友人との金曜日💬';
      case Themes.hackathon:
        return 'ハッカソンの懇親会にて 🐱‍💻';
      case Themes.cafe:
        return 'カフェで英語で注文 ☕';
      case Themes.airport:
        return '空港でチェックイン ✈️';
      case Themes.taxi:
        return 'タクシーで目的地まで 🚕';
      case Themes.hotel:
        return 'ホテルでチェックアウト 🏨';
      case Themes.restaurant:
        return 'レストランで料理を頼む 🍣';
      case Themes.library:
        return '図書館で本を借りる 📚';
      case Themes.supermarket:
        return 'スーパーマーケットで買い物 🛒';
      case Themes.hospital:
        return '病院で診察を受ける 🏥';
      case Themes.gym:
        return 'ジムでトレーニング 🏋️‍♂️';
    }
  }
}
