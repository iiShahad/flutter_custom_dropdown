import 'package:flutter/material.dart';

class FlutterCustomDropdown extends StatefulWidget {
  final Function selectedItem;
  const FlutterCustomDropdown({Key? key, required this.selectedItem})
      : super(key: key);

  @override
  State<FlutterCustomDropdown> createState() => _FlutterCustomDropdown();
}

class _FlutterCustomDropdown extends State<FlutterCustomDropdown> {
  String title = 'Choose item';
  bool isOpen = false;
  List<String> listItems = [
    'item 1',
    'item 2',
    'item 3',
    'item 4'
  ]; // change this list to your desired items

  //=============================================================================

  Widget headOfList() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isOpen == false ? isOpen = true : isOpen = false;
        });
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          //you can change the color of the header here
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Icon(Icons.arrow_drop_down)
            ],
          ),
        ),
      ),
    );
  }

  //=============================================================================

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: isOpen ? 250 : 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black26),
        color: Colors.white,
      ),
      child: isOpen == false
          ? headOfList()
          : Column(
              children: [
                headOfList(),
                const Divider(color: Colors.black26),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    itemCount: listItems.length,
                    itemBuilder: (context, i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            title = listItems[i];
                            isOpen = false;
                            widget.selectedItem(
                              listItems[i],
                            ); // I use callback for communication between widgets, you can avoid this approach depending on your situation and store the selected item in a variable.
                          });
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            border: i == 0
                                ? const Border()
                                : const Border(
                                    top: BorderSide(
                                        width: 1, color: Colors.black26),
                                  ),
                          ),
                          child: Text(
                            listItems[i],
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
