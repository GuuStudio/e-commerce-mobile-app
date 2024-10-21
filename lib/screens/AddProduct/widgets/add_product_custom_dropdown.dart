import 'package:e_commerce_app/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];

class AddProductCustomDropdown extends StatefulWidget {
  const AddProductCustomDropdown({super.key, required this.label, required this.onchange});

  final String label;
  final Function onchange;
  @override
  State<AddProductCustomDropdown> createState() => _AddProductCustomDropdownState();
}

class _AddProductCustomDropdownState extends State<AddProductCustomDropdown> {
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  List<CustomCategory> categories = customCategoriesList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ApiService().getCategories().then((list) {
      if (list != null) {
        setState(() {
          categories = list;
        });
      }
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.label,
              style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w800),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: double.infinity,
            height: 70,
            child: Card(
                elevation: 1,
                color: Colors.white,
                child: SizedBox(
                  width: double.infinity,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Text(
                        'Select Category',
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).hintColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      items: categories
                          .map((item) => DropdownMenuItem(
                                value: item.title,
                                child: Text(
                                  item.title,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value.toString();
                        });
                        widget.onchange(value.toString());
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        height: 40,
                        width: 200,
                      ),
                      dropdownStyleData: const DropdownStyleData(
                        maxHeight: 200,
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                      ),
                      dropdownSearchData: DropdownSearchData(
                        searchController: textEditingController,
                        searchInnerWidgetHeight: 50,
                        searchInnerWidget: Container(
                          height: 50,
                          padding: const EdgeInsets.only(
                            top: 8,
                            bottom: 4,
                            right: 8,
                            left: 8,
                          ),
                          child: TextFormField(
                            expands: true,
                            maxLines: null,
                            controller: textEditingController,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 8,
                              ),
                              hintText: 'Search for an category...',
                              hintStyle: const TextStyle(fontSize: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                        searchMatchFn: (item, searchValue) {
                          return item.value.toString().contains(searchValue);
                        },
                      ),
                      //This to clear the search value when you close the menu
                      onMenuStateChange: (isOpen) {
                        if (!isOpen) {
                          textEditingController.clear();
                        }
                      },
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
