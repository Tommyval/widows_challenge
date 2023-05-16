import 'package:stacked/stacked.dart';

class WidowsDataModel extends BaseViewModel {

  final int _numberOfPages = 10;
  int _currentPage = 0;

  int get numberOfPages => _numberOfPages;
  int get currentPage => _currentPage;
  void changePageIndex(int index) {
    _currentPage = index;
    notifyListeners();
  }
  
  final List<Map<String, String>> data = [
    {
      'name': 'John Doe',
      'date': '2023-05-01',
      'address': '123 Main St',
      'image':
           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIkj9z_td8x55pXbGvwXhHfd6d5U7oDpqNktU5zw1kSQ&s',
      'phoneNumber': '+234-233-222',
      'state': 'Ondo'
    },
    {
      'name': 'Jane Smith',
      'date': '2023-05-05',
      'address': '456 Elm St',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIkj9z_td8x55pXbGvwXhHfd6d5U7oDpqNktU5zw1kSQ&s',
      'phoneNumber': '+234-233-222',
      'state': 'Ondo'
    },
    {
      'name': 'Bob Johnson',
      'date': '2023-05-10',
      'address': '789 Oak St',
      'image':
           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIkj9z_td8x55pXbGvwXhHfd6d5U7oDpqNktU5zw1kSQ&s',
      'phoneNumber': '+234-233-222',
      'state': 'Ondo'
    },
    {
      'name': 'Bob Johnson',
      'date': '2023-05-10',
      'address': '789 Oak St',
      'image':
           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIkj9z_td8x55pXbGvwXhHfd6d5U7oDpqNktU5zw1kSQ&s',
      'phoneNumber': '+234-233-222',
      'state': 'Ondo'
    },
    {
      'name': 'Bob Johnson',
      'date': '2023-05-10',
      'address': '789 Oak St',
      'image':
           'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIkj9z_td8x55pXbGvwXhHfd6d5U7oDpqNktU5zw1kSQ&s',
      'phoneNumber': '+234-233-222',
      'state': 'Ondo'
    },
    {
      'name': 'Bob Johnson',
      'date': '2023-05-10',
      'address': '789 Oak St',
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSIkj9z_td8x55pXbGvwXhHfd6d5U7oDpqNktU5zw1kSQ&s',
      'phoneNumber': '+234-233-222',
      'state': 'Ondo'
    }
  ];
}
