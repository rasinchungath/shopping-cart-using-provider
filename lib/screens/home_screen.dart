import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/provider_shop.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title: const Text('Shopping list'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/shopList');
              },
              icon: context.read<ShopList>().cartCount == 0
                  ? const Icon(
                      CupertinoIcons.cart,
                      size: 30,
                    )
                  : Stack(
                      children: [
                        const Icon(
                          CupertinoIcons.cart,
                          size: 30,
                        ),
                        Positioned(
                          left: 15,
                          top: 0,
                          bottom: 12,
                          child: CircleAvatar(
                            radius: 8,
                            backgroundColor: Colors.red,
                            child:
                                Text('${context.watch<ShopList>().cartCount}',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                    )),
                          ),
                        ),
                      ],
                    ))
        ],
      ),
      body: ListView.separated(
          itemBuilder: (_, index) => const Divider(
                thickness: 2,
              ),
          separatorBuilder: (_, index) => ListTile(
              leading: Container(
                width: 40,
                height: 40,
                color: context.read<ShopList>().items[index].color,
              ),
              title: Text(
                context.read<ShopList>().items[index].name,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              trailing: SizedBox(
                width: 110,
                child: Row(
                  children: [
                    IconButton(
                        color: Colors.blue.shade900,
                        onPressed: () {
                          context
                              .read<ShopList>()
                              .addToCart(context.read<ShopList>().items[index]);
                          print(context.read<ShopList>().cartItems);
                        },
                        icon: const Icon(Icons.add_circle)),
                    //item count
                    Text(
                      '${context.watch<ShopList>().items[index].count}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    IconButton(
                        color: Colors.blue.shade900,
                        onPressed:
                            context.watch<ShopList>().items[index].count == 0
                                ? null
                                : () {
                                    context.read<ShopList>().removeFromCart(
                                        context.read<ShopList>().items[index]);
                                    print(context.read<ShopList>().cartItems);
                                  },
                        icon: const Icon(Icons.remove_circle)),
                  ],
                ),
              )),
          itemCount: context.read<ShopList>().itemCount),
    );
  }
}
