class OpenTradeResponse {
  OpenTradeResponse({
      num? currentPrice, 
      String? comment, 
      num? digits, 
      num? login, 
      num? openPrice, 
      String? openTime, 
      num? profit, 
      num? sl, 
      num? swaps, 
      String? symbol, 
      num? tp, 
      num? ticket, 
      num? type, 
      num? volume,}){
    _currentPrice = currentPrice;
    _comment = comment;
    _digits = digits;
    _login = login;
    _openPrice = openPrice;
    _openTime = openTime;
    _profit = profit;
    _sl = sl;
    _swaps = swaps;
    _symbol = symbol;
    _tp = tp;
    _ticket = ticket;
    _type = type;
    _volume = volume;
}

  OpenTradeResponse.fromJson(dynamic json) {
    _currentPrice = json['currentPrice'];
    _comment = json['comment'];
    _digits = json['digits'];
    _login = json['login'];
    _openPrice = json['openPrice'];
    _openTime = json['openTime'];
    _profit = json['profit'];
    _sl = json['sl'];
    _swaps = json['swaps'];
    _symbol = json['symbol'];
    _tp = json['tp'];
    _ticket = json['ticket'];
    _type = json['type'];
    _volume = json['volume'];
  }
  num? _currentPrice;
  String? _comment;
  num? _digits;
  num? _login;
  num? _openPrice;
  String? _openTime;
  num? _profit;
  num? _sl;
  num? _swaps;
  String? _symbol;
  num? _tp;
  num? _ticket;
  num? _type;
  num? _volume;
OpenTradeResponse copyWith({  num? currentPrice,
  String? comment,
  num? digits,
  num? login,
  num? openPrice,
  String? openTime,
  num? profit,
  num? sl,
  num? swaps,
  String? symbol,
  num? tp,
  num? ticket,
  num? type,
  num? volume,
}) => OpenTradeResponse(  currentPrice: currentPrice ?? _currentPrice,
  comment: comment ?? _comment,
  digits: digits ?? _digits,
  login: login ?? _login,
  openPrice: openPrice ?? _openPrice,
  openTime: openTime ?? _openTime,
  profit: profit ?? _profit,
  sl: sl ?? _sl,
  swaps: swaps ?? _swaps,
  symbol: symbol ?? _symbol,
  tp: tp ?? _tp,
  ticket: ticket ?? _ticket,
  type: type ?? _type,
  volume: volume ?? _volume,
);
  num? get currentPrice => _currentPrice;
  String? get comment => _comment;
  num? get digits => _digits;
  num? get login => _login;
  num? get openPrice => _openPrice;
  String? get openTime => _openTime;
  num? get profit => _profit;
  num? get sl => _sl;
  num? get swaps => _swaps;
  String? get symbol => _symbol;
  num? get tp => _tp;
  num? get ticket => _ticket;
  num? get type => _type;
  num? get volume => _volume;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPrice'] = _currentPrice;
    map['comment'] = _comment;
    map['digits'] = _digits;
    map['login'] = _login;
    map['openPrice'] = _openPrice;
    map['openTime'] = _openTime;
    map['profit'] = _profit;
    map['sl'] = _sl;
    map['swaps'] = _swaps;
    map['symbol'] = _symbol;
    map['tp'] = _tp;
    map['ticket'] = _ticket;
    map['type'] = _type;
    map['volume'] = _volume;
    return map;
  }

}