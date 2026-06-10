import 'package:flutter/material.dart';
import '../models/product.dart';
import '../service/api_service.dart';

class ProductProvider extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  bool _isLoading = false;
  String? _errorMessage = '';
  String _selectedCategory = 'all';

  final List<Map<String, String>> categories = [
    {'key': 'all', 'label': 'Semua'},
    {'key': 'beauty', 'label': 'Cosmetic'},
    {'key': 'furniture', 'label': 'Furniture'},
    {'key': 'groceries', 'label': 'Food'},
      

  ];

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;  
  String get selectedCategory => _selectedCategory;

  get product => null; 
   

  Future<void> fetchProducts(String category) async {
    _selectedCategory = category;
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); 
    try {
      _products = await _apiService.getProducts(category);
    } catch (e) {
      _errorMessage = 'Gagal memuat produk.Coba lagi nanti.';
    } finally {
      _isLoading = false;
      notifyListeners();


    }
  }

  void fetchCategories() {}
}