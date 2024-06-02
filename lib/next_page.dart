// import 'package:favoriteapp/data_model.dart';
import 'package:favoriteapp/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NextPage extends StatefulWidget {
  const NextPage({super.key});

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    print('build');
    final providerFav = Provider.of<FavProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav Provider'),
      ),
      body: providerFav.newList.isEmpty
          ? const Center(
              child: Text('No data available'),
            )
          : ListView.builder(
              itemCount: providerFav.newList.length,
              itemBuilder: (context, index) {
                final item = providerFav.newList[index];
                return ListTile(
                  title: Text(item.name),
                  trailing: InkWell(
                    onTap: () {
                      providerFav.setnewlist(item);
                    },
                    child: Icon(
                      Icons.favorite,
                      color: item.fav ? Colors.red : Colors.grey,
                    ),
                  ),
                );
              }),
    );
  }
}
