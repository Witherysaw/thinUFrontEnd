import 'package:flutter/material.dart';
import 'colors.dart';


class SearchPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  void _onSearchTextChanged(String query) {
    _searchQuery = query;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSearchBar(),
            SizedBox(height: 12.0),
            Text('Search Results for: $_searchQuery'),
            // Add your search result content here based on _searchQuery
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      decoration: InputDecoration(
        focusColor: tuLightBlue,
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
      onChanged: _onSearchTextChanged,
    );
  }
}
