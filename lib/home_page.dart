import 'package:favoriteapp/dummy_data.dart';
import 'package:favoriteapp/next_page.dart';
import 'package:favoriteapp/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final providerFav = Provider.of<FavProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav Provider'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NextPage(),
                  ),
                );
              },
              child: const Icon(Icons.favorite),
            ),
          )
        ],
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            final item = list[index];
            return Consumer<FavProvider>(
              builder: (context, value, child) {
                return ListTile(
                  title: Text(item.fav.toString()),
                  trailing: InkWell(
                    onTap: () {
                      value.setnewlist(item);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: list[index].fav ? Colors.red : Colors.grey,
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
