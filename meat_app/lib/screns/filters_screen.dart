import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  //const FilterScreen({ Key? key }) : super(key: key);
  static const routeName = '/filter';

  final Function saveFilters;
  final Map<String, bool> currentFlters;

  FilterScreen(this.saveFilters, this.currentFlters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactosaFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFlters['gluten'] as bool;
    _lactosaFree = widget.currentFlters['lactosa'] as bool;
    _vegan = widget.currentFlters['vegan'] as bool;
    _vegetarian = widget.currentFlters['vegetarian'] as bool;
    super.initState();
  }

  Widget _bluidSwitchListTitle(String title, String description,
      bool currenteValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currenteValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Filters'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final selectedfilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactosaFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian
                  };
                  widget.saveFilters();
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Adjust youyr meal selection',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(
                child: ListView(
              children: <Widget>[
                _bluidSwitchListTitle(
                    'Gluten Free',
                    'Only include gluten-free meals',
                    _glutenFree, (bool newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _bluidSwitchListTitle(
                    'Lactosa Free',
                    'Only include lactosa-free meals',
                    _lactosaFree, (bool newValue) {
                  setState(() {
                    _lactosaFree = newValue;
                  });
                }),
                _bluidSwitchListTitle(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (bool newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _bluidSwitchListTitle(
                    'Vegan', 'Only include vegan meals', _vegan,
                    (bool newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
              ],
            ))
          ],
        ));
  }
}
