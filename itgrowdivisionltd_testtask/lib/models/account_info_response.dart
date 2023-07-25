class AccountInfoResponse {
  AccountInfoResponse({
      String? address, 
      num? balance, 
      String? city, 
      String? country, 
      num? currency, 
      num? currentTradesCount, 
      num? currentTradesVolume, 
      num? equity, 
      num? freeMargin, 
      bool? isAnyOpenTrades, 
      bool? isSwapFree, 
      num? leverage, 
      String? name, 
      String? phone, 
      num? totalTradesCount, 
      num? totalTradesVolume, 
      num? type, 
      num? verificationLevel, 
      String? zipCode,}){
    _address = address;
    _balance = balance;
    _city = city;
    _country = country;
    _currency = currency;
    _currentTradesCount = currentTradesCount;
    _currentTradesVolume = currentTradesVolume;
    _equity = equity;
    _freeMargin = freeMargin;
    _isAnyOpenTrades = isAnyOpenTrades;
    _isSwapFree = isSwapFree;
    _leverage = leverage;
    _name = name;
    _phone = phone;
    _totalTradesCount = totalTradesCount;
    _totalTradesVolume = totalTradesVolume;
    _type = type;
    _verificationLevel = verificationLevel;
    _zipCode = zipCode;
}

  AccountInfoResponse.fromJson(dynamic json) {
    _address = json['address'];
    _balance = json['balance'];
    _city = json['city'];
    _country = json['country'];
    _currency = json['currency'];
    _currentTradesCount = json['currentTradesCount'];
    _currentTradesVolume = json['currentTradesVolume'];
    _equity = json['equity'];
    _freeMargin = json['freeMargin'];
    _isAnyOpenTrades = json['isAnyOpenTrades'];
    _isSwapFree = json['isSwapFree'];
    _leverage = json['leverage'];
    _name = json['name'];
    _phone = json['phone'];
    _totalTradesCount = json['totalTradesCount'];
    _totalTradesVolume = json['totalTradesVolume'];
    _type = json['type'];
    _verificationLevel = json['verificationLevel'];
    _zipCode = json['zipCode'];
  }
  String? _address;
  num? _balance;
  String? _city;
  String? _country;
  num? _currency;
  num? _currentTradesCount;
  num? _currentTradesVolume;
  num? _equity;
  num? _freeMargin;
  bool? _isAnyOpenTrades;
  bool? _isSwapFree;
  num? _leverage;
  String? _name;
  String? _phone;
  num? _totalTradesCount;
  num? _totalTradesVolume;
  num? _type;
  num? _verificationLevel;
  String? _zipCode;
AccountInfoResponse copyWith({  String? address,
  num? balance,
  String? city,
  String? country,
  num? currency,
  num? currentTradesCount,
  num? currentTradesVolume,
  num? equity,
  num? freeMargin,
  bool? isAnyOpenTrades,
  bool? isSwapFree,
  num? leverage,
  String? name,
  String? phone,
  num? totalTradesCount,
  num? totalTradesVolume,
  num? type,
  num? verificationLevel,
  String? zipCode,
}) => AccountInfoResponse(  address: address ?? _address,
  balance: balance ?? _balance,
  city: city ?? _city,
  country: country ?? _country,
  currency: currency ?? _currency,
  currentTradesCount: currentTradesCount ?? _currentTradesCount,
  currentTradesVolume: currentTradesVolume ?? _currentTradesVolume,
  equity: equity ?? _equity,
  freeMargin: freeMargin ?? _freeMargin,
  isAnyOpenTrades: isAnyOpenTrades ?? _isAnyOpenTrades,
  isSwapFree: isSwapFree ?? _isSwapFree,
  leverage: leverage ?? _leverage,
  name: name ?? _name,
  phone: phone ?? _phone,
  totalTradesCount: totalTradesCount ?? _totalTradesCount,
  totalTradesVolume: totalTradesVolume ?? _totalTradesVolume,
  type: type ?? _type,
  verificationLevel: verificationLevel ?? _verificationLevel,
  zipCode: zipCode ?? _zipCode,
);
  String? get address => _address;
  num? get balance => _balance;
  String? get city => _city;
  String? get country => _country;
  num? get currency => _currency;
  num? get currentTradesCount => _currentTradesCount;
  num? get currentTradesVolume => _currentTradesVolume;
  num? get equity => _equity;
  num? get freeMargin => _freeMargin;
  bool? get isAnyOpenTrades => _isAnyOpenTrades;
  bool? get isSwapFree => _isSwapFree;
  num? get leverage => _leverage;
  String? get name => _name;
  String? get phone => _phone;
  num? get totalTradesCount => _totalTradesCount;
  num? get totalTradesVolume => _totalTradesVolume;
  num? get type => _type;
  num? get verificationLevel => _verificationLevel;
  String? get zipCode => _zipCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = _address;
    map['balance'] = _balance;
    map['city'] = _city;
    map['country'] = _country;
    map['currency'] = _currency;
    map['currentTradesCount'] = _currentTradesCount;
    map['currentTradesVolume'] = _currentTradesVolume;
    map['equity'] = _equity;
    map['freeMargin'] = _freeMargin;
    map['isAnyOpenTrades'] = _isAnyOpenTrades;
    map['isSwapFree'] = _isSwapFree;
    map['leverage'] = _leverage;
    map['name'] = _name;
    map['phone'] = _phone;
    map['totalTradesCount'] = _totalTradesCount;
    map['totalTradesVolume'] = _totalTradesVolume;
    map['type'] = _type;
    map['verificationLevel'] = _verificationLevel;
    map['zipCode'] = _zipCode;
    return map;
  }

}