import 'package:flutter/material.dart';

class CustomListile extends StatelessWidget {
  Color color;
  String name;
  int count;
  void Function() addbuttonPressed;
  void Function()? removebuttonPressed;

   CustomListile({required this.color, required this.name, required this.count, required this.addbuttonPressed,required this.removebuttonPressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    color: color,
                  ),
                  title: Text(
                    name,
                  ),
                  trailing: SizedBox(
                    width: 110,
                    child: Row(
                      children: [
                        IconButton(
                            color: Colors.blue.shade900,
                            onPressed: addbuttonPressed,
                            icon: Icon(Icons.add_circle)),
                        Text(
                          '$count',
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        IconButton(
                            disabledColor: Colors.blueGrey.shade500,
                            color: Colors.blue.shade900,
                            onPressed: removebuttonPressed,
                            icon: const Icon(Icons.remove_circle)),
                      ],
                    ),
                  ),
                );
  }
}