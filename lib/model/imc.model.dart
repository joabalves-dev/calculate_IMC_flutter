class Imc {
  Imc({required this.altura, required this.peso});

  String altura;
  String peso;

  String calcular() {
    late double newAltura = double.parse(altura.replaceAll(',', '.'));
    late double newPeso = double.parse(peso.replaceAll(',', '.'));

    late double result = newPeso / (newAltura * newAltura);

    if (result >= 40) {
      return 'Obesidade Grave III';
    } else if (result >= 30) {
      return 'Obesidade II';
    } else if (result >= 25) {
      return 'SobrePeso';
    } else if (result >= 18.5) {
      return 'Normal';
    } else {
      return 'Magreza';
    }
  }
}
