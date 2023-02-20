import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../custom_listile.dart';
import '../providers/provider_shop.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        title:
            Text('Total Cart Items : ${context.watch<ShopList>().cartCount}'),
        centerTitle: true,
      ),
      body: context.watch<ShopList>().cartCount == 0
          ? Center(
              child: Text(
                "No Items in cart",
                style: TextStyle(
                  color: Colors.blueGrey.shade400.withOpacity(0.5),
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )
          : ListView.separated(
              separatorBuilder: (_, index) => const Divider(
                    thickness: 2,
                  ),
              itemCount: context.watch<ShopList>().cartItemCount,
              itemBuilder: (_, index) {
                return CustomListile(
                  color: context.read<ShopList>().cartItems[index].color,
                  name: context.read<ShopList>().cartItems[index].name,
                  count: context.watch<ShopList>().cartItems[index].count,
                  addbuttonPressed: () {
                    context
                        .read<ShopList>()
                        .addToCart(context.read<ShopList>().cartItems[index]);
                    print(context.read<ShopList>().cartItems);
                  },
                  removebuttonPressed: () {
                    context.read<ShopList>().removeFromCart(
                        context.read<ShopList>().cartItems[index]);
                    print(context.read<ShopList>().cartItems);
                  },
                );

                // return ListTile(
                //   leading: Container(
                //     width: 40,
                //     height: 40,
                //     color: context.read<ShopList>().cartItems[index].color,
                //   ),
                //   title: Text(
                //     context.read<ShopList>().cartItems[index].name,
                //   ),
                //   trailing: SizedBox(
                //     width: 110,
                //     child: Row(
                //       children: [
                //         IconButton(
                //             color: Colors.blue.shade900,
                //             onPressed: () {
                //               context.read<ShopList>().addToCart(
                //                   context.read<ShopList>().cartItems[index]);
                //               print(context.read<ShopList>().cartItems);
                //             },
                //             icon: Icon(Icons.add_circle)),
                //         Text(
                //           '${context.watch<ShopList>().cartItems[index].count}',
                //           style: const TextStyle(
                //             fontSize: 18,
                //           ),
                //         ),
                //         IconButton(
                //             disabledColor: Colors.blueGrey.shade500,
                //             color: Colors.blue.shade900,
                //             onPressed: () {
                //               context.read<ShopList>().removeFromCart(
                //                   context.read<ShopList>().cartItems[index]);
                //               print(context.read<ShopList>().cartItems);
                //             },
                //             icon: const Icon(Icons.remove_circle)),
                //       ],
                //     ),
                //   ),
                // );
              }),
    );
  }
}
