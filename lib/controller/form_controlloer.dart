// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import '../model/product.dart';
// import '../../controller/products_controller.dart';

// class FormController extends GetxController {
//   final ProductsController productsController = Get.find();
//   final _priceFocusNode = FocusNode();
//   final _descriptionFocusNode = FocusNode();
//   final _imageUrlController = TextEditingController();
//   final _imageUrlFocusNode = FocusNode();
//   final _form = GlobalKey<FormState>();

//   var _editedProduct = Product(
//     id: '',
//     title: '',
//     price: 0,
//     description: '',
//     imageUrl: '',
//   ).obs;

//   var _initValues = <String, String>{
//     'title': '',
//     'description': '',
//     'price': '',
//     'imageUrl': '',
//   }.obs;

//   var _isInit = true.obs;

//   @override
//   void onInit() {
//     _imageUrlFocusNode.addListener(_updateImageUrl);

//     if (_isInit.value) {
//       final productId = ModalRoute.of(context)!.settings.arguments as String?;
//       if (productId != null) {
//         _editedProduct.value =
//             productsController.findById(productId);
//         _initValues.value = {
//           //NullSafety
//           'title': _editedProduct.value.title,
//           'description': _editedProduct.value.description,
//           'price': _editedProduct.value.price.toString(),
//           // 'imageUrl': _editedProduct.imageUrl,
//           'imageUrl': '',
//         };
//         _imageUrlController.text = _editedProduct.value.imageUrl;
//       }
//       //NullSafety
//     }
//     _isInit.value = false;
//     super.onInit();
//   }

//   @override
//   void onClose() {
//     _imageUrlFocusNode.removeListener(_updateImageUrl);
//     _priceFocusNode.dispose();
//     _descriptionFocusNode.dispose();
//     _imageUrlController.dispose();
//     _imageUrlFocusNode.dispose();
//     super.onClose();
//   }

//   void _updateImageUrl() {
//     if (!_imageUrlFocusNode.hasFocus) {
//       if ((!_imageUrlController.text.startsWith('http') &&
//               !_imageUrlController.text.startsWith('https')) ||
//           (!_imageUrlController.text.endsWith('.png') &&
//               !_imageUrlController.text.endsWith('.jpg') &&
//               !_imageUrlController.text.endsWith('.jpeg'))) {
//         return;
//       }
//     }
//   }

//   void _saveForm() {
//     final isValid = _form.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _form.currentState!.save();
//     if (_editedProduct.value.id != '') {
      
//           productsController.updateProduct(_editedProduct.value.id, _editedProduct.value);
//     } else {
//       productsController.addProduct(_editedProduct.value);
//     }
//     Get.back();
//   }
// }
