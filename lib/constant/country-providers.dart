class CountryProvider {
  final String? name;
  final String? prefix;
  CountryProvider({this.name, this.prefix});
}

var countryList = [
  CountryProvider(name: 'canada', prefix: "+1"),
  CountryProvider(name: 'nigeria', prefix: "+234"),
  CountryProvider(name: 'ghana', prefix: "+223"),
  CountryProvider(name: 'kenya', prefix: "+254"),
  CountryProvider(name: 'england', prefix: "+44"),
  CountryProvider(name: 'rwanda', prefix: "+250"),
];
