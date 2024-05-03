class SpaceToken {
  SpaceToken({
    double baseFactor = 4,
  }) : _baseFactor = baseFactor;

  late final double _baseFactor;

  double get zero => _baseFactor * 0;

  double get one => _baseFactor * 1;

  double get two => _baseFactor * 2;

  double get three => _baseFactor * 3;

  double get four => _baseFactor * 4;

  double get five => _baseFactor * 5;

  double get six => _baseFactor * 6;

  double get seven => _baseFactor * 7;

  double get eight => _baseFactor * 8;

  double get nine => _baseFactor * 9;
}
