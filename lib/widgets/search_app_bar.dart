import 'package:flutter/material.dart';
import 'package:wagon/widgets/filter_dropdown.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Function(String, String)? onChanged;
  SearchAppBar({
    Key? key,
    this.onChanged,
  })  : preferredSize = Size.fromHeight(120.0),
        super(key: key);

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {
  String dropdownValue = 'All';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Service History'),
      bottom: PreferredSize(
        preferredSize: widget.preferredSize,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: searchController,
                onChanged: (value) {
                  widget.onChanged!(value, dropdownValue);
                },
                decoration: InputDecoration(
                  hintText: "Search $dropdownValue",
                  suffixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FilterDropdown(
                      dropdownValue: dropdownValue,
                      onChanged: (String? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                ),
              ),
            ),
            SizedBox(height: 8.0)
          ],
        ),
      ),
    );
  }
}
