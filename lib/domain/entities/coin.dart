class Coin {
    String uuid;
    String symbol;
    String? description;
    String? name;
    String? color;
    String? iconUrl;
    String? marketCap;
    String? price;
    int listedAt;
    int tier;
    String? change;
    int rank;
    String? websiteUrl;
    // List<String?> sparkline;
    bool lowVolume;
    String? coinrankingUrl;
    String? the24HVolume;
    String? btcPrice;
    List<dynamic> contractAddresses;

    Coin({
        required this.uuid,
        required this.symbol,
        required this.name,
        required this.color,
        required this.iconUrl,
        required this.marketCap,
        required this.price,
        required this.listedAt,
        required this.tier,
        required this.change,
        required this.rank,
        this.description,
        this.websiteUrl,
        required this.lowVolume,
        required this.coinrankingUrl,
        required this.the24HVolume,
        required this.btcPrice,
        required this.contractAddresses,
    });

    factory Coin.fromJson(Map<String, dynamic> json) => Coin(
      uuid: json['uuid'], 
      symbol: json['symbol'], 
      name: json['name'], 
      color: json['color'], 
      iconUrl: json['iconUrl'], 
      marketCap: json['marketCap'], 
      price: json['price'], 
      listedAt: json['listedAt'], 
      tier: json['tier'], 
      change: json['change'], 
      rank: json['rank'], 
      lowVolume: json['lowVolume'], 
      description: json['description'], 
      websiteUrl: json['websiteUrl'], 
      coinrankingUrl: json['coinrankingUrl'], 
      the24HVolume: json['24hVolume'], 
      btcPrice: json['btcPrice'], 
      contractAddresses: json['contractAddresses']
    );

}
