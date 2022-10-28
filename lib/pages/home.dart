import 'package:calculator_imc/model/imc.model.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController controllerInputTextHeight = TextEditingController();
  TextEditingController controllerInputTextWeight = TextEditingController();

  late String _textinf = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator IMC'),
        actions: [
          IconButton(onPressed: clear, icon: const Icon(Icons.refresh))
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: controllerInputTextHeight,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe uma altura';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Altura (cm)',
                        hintText: 'Ex: 1,83',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: controllerInputTextWeight,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Informe o Peso';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Peso (kg)',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Card(
                        margin: const EdgeInsets.all(0),
                        child: Row(
                          children: [
                            SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(_textinf),
                                ))
                          ],
                        ))
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Calculate'),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            setState(() {
              Imc imc = Imc(
                  altura: controllerInputTextHeight.text,
                  peso: controllerInputTextWeight.text);
              _textinf = imc.calcular();
            });
          }
        },
        icon: const Icon(Icons.calculate),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void clear() {
    setState(() {
      controllerInputTextHeight.text = '';
      controllerInputTextWeight.text = '';
      _textinf = '';
    });
  }
}
