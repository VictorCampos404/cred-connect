enum TermType {
  x3(label: '3x'),
  x6(label: '6x'),
  x9(label: '9x'),
  x12(label: '12x'),
  x24(label: '24x');

  final String label;
  const TermType({required this.label});
}
