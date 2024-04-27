import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resep Makanan',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipeListPage(),
    );
  }
}

class RecipeListPage extends StatelessWidget {
  final List<Map<String, dynamic>> recipes = [
       {
      'title': 'Nasi Goreng',
      'ingredients': [
        '2 piring nasi putih',
        '2 butir telur',
        '100 gr daging ayam, potong kecil',
        '2 sdm kecap manis',
        '1 sdm saus sambal',
        '2 siung bawang putih, cincang halus',
        '1 buah bawang bombay, cincang halus',
        'Garam dan merica secukupnya',
        'Minyak untuk menumis',
      ],
      'steps': [
        'Panaskan minyak, tumis bawang putih dan bawang bombay sampai harum.',
        'Masukkan daging ayam, masak sampai berubah warna.',
        'Pecahkan telur di atas wajan, aduk sampai setengah matang.',
        'Masukkan nasi, kecap manis, dan saus sambal. Aduk rata.',
        'Bumbui dengan garam dan merica, masak beberapa menit lagi.',
        'Sajikan hangat.'
      ]
    },
    {
      'title': 'Soto Ayam',
      'ingredients': [
        '1 kg ayam, potong menjadi beberapa bagian',
        '2 liter air',
        '4 batang serai, memarkan',
        '6 lembar daun jeruk',
        '3 cm jahe, memarkan',
        '2 sdm minyak goreng',
        'Bumbu halus:',
        '8 butir bawang merah',
        '4 siung bawang putih',
        '4 butir kemiri, sangrai',
        '2 cm kunyit, bakar',
        '1 sdt ketumbar',
        'Garam dan penyedap rasa secukupnya',
      ],
      'steps': [
        'Rebus ayam hingga matang, angkat dan suwir-suwir dagingnya.',
        'Panaskan minyak, tumis bumbu halus sampai harum.',
        'Masukkan serai, jahe, dan daun jeruk, aduk rata.',
        'Tuang tumisan bumbu ke dalam rebusan ayam, masak dengan api kecil.',
        'Tambahkan garam dan penyedap rasa, koreksi rasa.',
        'Sajikan soto dengan nasi, taburi dengan bawang goreng dan seledri.'
      ]
    }
 // Masukkan data resep seperti yang sudah Anda definisikan sebelumnya
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resep Makanan'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text(recipes[index]['title']),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipeDetailPage(recipe: recipes[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class RecipeDetailPage extends StatelessWidget {
  final Map<String, dynamic> recipe;

  RecipeDetailPage({required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['title']),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Ingredients:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              for (var ingredient in recipe['ingredients']) Text(ingredient),
              SizedBox(height: 10),
              Text('Steps:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              for (int i = 0; i < recipe['steps'].length; i++)
                Text('${i + 1}. ${recipe['steps'][i]}'),
            ],
          ),
        ),
      ),
    );
  }
}
