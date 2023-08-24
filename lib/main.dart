import 'package:flutter/material.dart';

//crtl+alt+l == organiza codigo
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //remove o selo de debug
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int contador = 0;

  bool get vazio => contador == 0;

  bool get cheio => contador == 12;

  void menos() {
    setState(() {
      contador--;
    });
  }

  void mais() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/patos.jpg'),
          fit: BoxFit.cover,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cheio ? 'Lotado' : 'Pode entrar!',
              style: TextStyle(
                  fontSize: 30,
                  color: cheio ? Colors.red : Colors.black45,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 10),
            ),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Text(
                contador.toString(),
                style: TextStyle(
                  fontSize: 100,
                  color: cheio ? Colors.red : Colors.black45,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: vazio ? null : menos,
                  style: TextButton.styleFrom(
                      backgroundColor:
                          vazio ? Colors.white.withOpacity(0.2) : Colors.white,
                      fixedSize: const Size(100, 100),
                      foregroundColor: Colors.black,
                      //foregroundColor == primery
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24))
                      //padding: const EdgeInsets.all(32),
                      ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 32), //caixa vazia pra dar espaçamento
                TextButton(
                  onPressed: cheio ? null : mais,
                  style: TextButton.styleFrom(
                    backgroundColor:
                        cheio ? Colors.white.withOpacity(0.2) : Colors.white,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text(
                    'Entrou',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
