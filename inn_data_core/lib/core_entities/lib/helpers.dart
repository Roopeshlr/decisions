///This is class can be used when you want to group two values,
/// Example cases :
///  1. If you want to return two values from a method
///  2. If you want to pass two values to a method
///  3. Contain two values in a map or list
class Pair<F, S> {
  final F first;
  final S second;

  Pair(this.first, this.second);
}

///Same as Pair, but if you want to bind three values together
class Triplet<F, S, T> {
  final F first;
  final S second;
  final T third;

  Triplet(this.first, this.second, this.third);
}
