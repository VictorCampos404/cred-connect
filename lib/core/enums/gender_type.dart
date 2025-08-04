enum GenderType {
  male(label: "Male"),
  female(label: "Female"),
  unkno(label: "Unkno");

  final String label;
  const GenderType({required this.label});
}
