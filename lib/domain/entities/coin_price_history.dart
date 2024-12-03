class CoinPriceHistory {
  final String price;
  final timestamp;

  CoinPriceHistory({
    required this.price,
    required this.timestamp
  });

  factory CoinPriceHistory.fromJson(Map<String, dynamic> json) => CoinPriceHistory(
    price: json['price'], 
    timestamp: json['timestamp']
  );
}