class PatternValidator {
  static String? inputPatternValidator({
    required String? input,
}) {
    String pattern = r'^\S+$';
    RegExp rexExp = new RegExp(pattern);
    return rexExp.hasMatch(input ?? '')
        ? null
        : 'El valor no puede tener espacios';
  }
}