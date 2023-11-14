import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// criando um compontente customizado(widget)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // tirar o banner do debug
      //debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

//comando stful cria a classe abaixo para páginas que mudam de estados
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  void decrement() {
    setState(() {
      count --;
    });

    print (count);
  }

  void increment() {
    //setState é para o número '0' atualizar a cada clique
    setState(() {
      count ++;
    });
    print (count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        decoration: const BoxDecoration (
          image: DecorationImage (
            image: AssetImage ('assets/images/img.png'),
            // image: NetworkImage ('URL') trazer da net
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              isFull ? 'Lotado' : 'Pode entrar!',
              style: TextStyle(

                fontSize: 30,
                color: isFull ? Colors.redAccent : Colors.white,
                fontWeight: FontWeight.w700, //grossura da letra
                letterSpacing: 1,
                // shadows: [
                //   Shadow(
                //     color: Colors.black,
                //     offset: Offset(-2, -2),
                //   ),
                //   Shadow(
                //     color: Colors.black,
                //     offset: Offset(2, -2),
                //   ),
                //   Shadow(
                //     color: Colors.black,
                //     offset: Offset(-2, 2),
                //   ),
                //   Shadow(
                //     color: Colors.black,
                //     offset: Offset(2, 2),
                //   ),
                // ],
                //espaçamento das letras
              ),
            ),
            Padding (
              padding: const EdgeInsets.all(32),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 100,
                  color: isFull ? Colors.redAccent : Colors.white,
                  fontWeight: FontWeight.w700, //grossura da letra
                  letterSpacing: 4,
                  //espaçamento das letras
                ),
              ),

            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: isEmpty ? null : decrement,
                  style: TextButton.styleFrom(
                    backgroundColor: isEmpty ? Colors.red.withOpacity (0.2) : Colors.redAccent,
                    fixedSize: const Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.green, width: 5,)
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Saiu',
                    style: TextStyle(fontSize: 20, color: Colors.white),

                  ),
                ),
                const SizedBox(width: 15),
                TextButton(
                  onPressed: isFull ? null : increment,
                  style: TextButton.styleFrom(
                    backgroundColor: isFull ? Colors.red.withOpacity (0.2) : Colors.redAccent,
                    fixedSize: Size(100, 100),
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      //side: BorderSide(color: Colors.green, width: 5,)
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  //padding: const EdgeInsets.fromLTRB(32,32,32,32),
                  //outra forma de personalizar o botão
                  child: const Text(
                    'Entrou',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ) ,
    );
}




    // exemplo de drawer e app bar
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text ('Aplicativo da Ju'),
    //   ),
    //   drawer: Drawer(),
    // );

    // exemplo de texto centralizado
    // return Container(
    //   color: Colors.yellow,
    //   alignment: Alignment.center,
    //   child: const Text('Olá ju!'),
    // );
  }

