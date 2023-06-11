class PatternValidator {
  static String? inputPatternValidator({
    required String? input,
}) {
    String pattern = r'^\S+$';
    RegExp rexExp = new RegExp(pattern);

    if (input == null || input.isEmpty) {
      return 'El valor no puede estar vacio.';
    }

    return rexExp.hasMatch(input ?? '')
        ? null
        : 'El valor no puede tener espacios';
  }
}