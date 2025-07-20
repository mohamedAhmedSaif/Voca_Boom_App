// payment_method_page.dart
import 'package:flutter/material.dart';
import 'package:voca_boom_app/core/resources/colors_manager.dart';
import 'package:voca_boom_app/core/resources/font_manager.dart';
import 'package:voca_boom_app/core/resources/height_manager.dart';
import 'package:voca_boom_app/core/resources/utils.dart';
import 'package:voca_boom_app/core/widgets/app_logo_widget.dart';

import 'core/resources/border_radius_manager.dart';
import 'core/resources/width_manager.dart';
import 'core/widgets/Image.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  // تعريف الألوان بناءً على تصميمك
  static const Color _primaryPurple = ColorsManager.blueColor; // لون الشعار وزر الدفع
  static const Color _secondaryBlue = ColorsManager.primaryColor; // لون الشعار
  static const Color _textColor = ColorsManager.blackColor; // لون النص الأساسي
  static const Color _textFieldFillColor = ColorsManager.light1GreyColor; // لون خلفية حقول الإدخال
  static const Color _blueButtonColor = ColorsManager.primaryColor; // لون زر "Pay Now"

  // متحكمات حقول النص (TextEditingControllers) للوصول إلى قيم المدخلات
  final TextEditingController _cardholderNameController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  // متغير لتتبع طريقة الدفع المختارة (يمكن أن يكون سلسلة نصية مثل 'InstaPay', 'Visa', 'Mastercard')
  String? _selectedPaymentMethod; // يمكن أن يكون null في البداية

  // قيمة المبلغ (ثابتة في هذه الصفحة حسب التصميم)
  final double _paymentAmount = 1200.0;

  @override
  void dispose() {
    // يجب التخلص من المتحكمات لمنع تسرب الذاكرة
    _cardholderNameController.dispose();
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvcController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorsManager.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorsManager.blackColor),
          onPressed: () {
            Navigator.pop(context); // 🔙 يرجع للصفحة اللي قبله
          },
        ),
      ),// خلفية بيضاء للصفحة
      body: SafeArea(
        child: SingleChildScrollView( // SingleChildScrollView للسماح بالتمرير إذا كانت الشاشة صغيرة
          padding: EdgeInsets.all(HeightManager.h20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // محاذاة العناصر في المنتصف أفقياً
            children: [
              // --- شعار VocaBoom ---
              Center(
                child: AppLogoWidget()
              ),
               SizedBox(height: HeightManager.h20),

              // --- عنوان "select a payment method" ---
              Text(
                Utils.kselectapaymentmethod,
                style: TextStyle(
                  fontSize: FontSizeManger.f22,
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
              ),
               SizedBox(height: HeightManager.h20),

              // --- خيارات طرق الدفع (InstaPay, Visa, Mastercard) ---
              Container(
                height: HeightManager.h100,
                child: ListView(

                  scrollDirection: Axis.horizontal,
                   children: [
                    _buildPaymentOption(
                      context,
                     ImageAssets.instpay, // استبدل بمسار شعار Instapay
                      Utils.kInstaPay,
                    ),
                    _buildPaymentOption(
                      context,
                     ImageAssets.visa, // استبدل بمسار شعار Visa
                      Utils.kvisa,
                    ),
                    _buildPaymentOption(
                      context,
                      ImageAssets.mastercard, // استبدل بمسار شعار Mastercard
                     Utils.kMastercard,
                      isImage: false, // هذا الخيار هو صورة بطاقة كاملة وليس مجرد شعار
                    ),
                  ],
                ),
              ),
               SizedBox(height: HeightManager.h30),

              // --- حقول إدخال بيانات البطاقة ---
              _buildTextField('cardholder name', _cardholderNameController),
               SizedBox(height: HeightManager.h20),
              _buildTextField('card number', _cardNumberController, keyboardType: TextInputType.number),
               SizedBox(height: HeightManager.h20),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('Expiry date', _expiryDateController, keyboardType: TextInputType.datetime),
                  ),
                   SizedBox(width: HeightManager.h20),
                  Expanded(
                    child: _buildTextField('cvc', _cvcController, keyboardType: TextInputType.number),
                  ),
                ],
              ),
               SizedBox(height: HeightManager.h30),

              // --- "select your pay ment" (مع Checkbox أو ما يعادله) ---
              // في التصميم، تبدو وكأنها Checkbox مع نص.
              Row(
                children: [
                  Container( // مربع الأيقونة/checkbox
                    width: WidthManager.w24,
                    height: HeightManager.h24,
                    decoration: BoxDecoration(
                      color: _blueButtonColor, // لون مربع الأيقونة
                      borderRadius: BorderRadius.circular(BorderRadiusManager.br5),
                    ),
                    // يمكنك استبدال هذا بـ Checkbox إذا أردت وظائف حقيقية
                    // أو جعلها IconButton لإظهار/إخفاء تفاصيل الدفع المحفوظة.
                    // حاليًا، هي مجرد مربع لوني مطابق للتصميم.
                  ),
                   SizedBox(width: WidthManager.w10),
                  Text(
                    Utils.kselectyourpayment,
                    style: TextStyle(
                      fontSize: FontSizeManger.f20,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                ],
              ),
               SizedBox(height: HeightManager.h40),

              // --- مبلغ الدفع ---
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'payment amount $_paymentAmount',
                  style: TextStyle(
                    fontSize: FontSizeManger.f22,
                    fontWeight: FontWeight.bold,
                    color: _textColor,
                  ),
                ),
              ),
               SizedBox(height: HeightManager.h50),

              // --- زر "pay now" ---
              SizedBox(
                width: double.infinity,
                height: HeightManager.h60,
                child: ElevatedButton(
                  onPressed: () {
                    // هذا هو التحكم الرئيسي لعملية الدفع
                    _handlePayment();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _blueButtonColor, // لون خلفية الزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(BorderRadiusManager.br15), // حواف دائرية
                    ),
                    elevation: 5, // ظل الزر
                  ),
                  child:  Text(
                    Utils.kpaynow,
                    style: TextStyle(
                      fontSize: FontSizeManger.f22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- دوال مساعدة (Widgets للتحكم) ---

  // دالة مساعدة لبناء حقول الإدخال النصية
  Widget _buildTextField(String hintText, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return TextField(
      controller: controller, // متحكم يسمح بالوصول إلى النص المدخل
      keyboardType: keyboardType, // نوع لوحة المفاتيح (رقمية، تاريخ، نص)
      decoration: InputDecoration(
        hintText: hintText, // النص الظاهر داخل الحقل قبل الإدخال
        hintStyle: TextStyle(color: _textColor.withOpacity(0.6)), // لون النص التلميحي
        filled: true,
        fillColor: _textFieldFillColor, // لون خلفية الحقل
        border: OutlineInputBorder( // شكل الحدود
          borderRadius: BorderRadius.circular(BorderRadiusManager.br15), // حواف دائرية
          borderSide: BorderSide.none, // إزالة حدود المربع (مبني على التصميم)
        ),
        contentPadding:  EdgeInsets.symmetric(horizontal: WidthManager.w20, vertical: HeightManager.h20), // حشوة داخلية
      ),
      style: TextStyle(color: _textColor, fontSize: FontSizeManger.f18), // لون وحجم النص المدخل
    );
  }

  // دالة مساعدة لبناء خيارات طريقة الدفع
  Widget _buildPaymentOption(BuildContext context, String imagePath, String methodType, {bool isImage = true}) {
    // InkWell يسمح لجزء من الواجهة أن يكون قابلاً للنقر مع تأثير تموج
    return InkWell(
      onTap: () {
        setState(() {
          _selectedPaymentMethod = methodType; // تحديث طريقة الدفع المختارة
          print('Selected payment method: $_selectedPaymentMethod');
        });
      },
      child: AnimatedContainer( // AnimatedContainer لتحريك التغييرات بسلاسة
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding:  EdgeInsets.all(HeightManager.h10),
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(BorderRadiusManager.br15),
          border: Border.all(
            color: _selectedPaymentMethod == methodType ? _primaryPurple : Colors.transparent, // حدود أرجوانية عند التحديد
            width: _selectedPaymentMethod == methodType ? 3.0 : 0.0, // سمك الحدود عند التحديد
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: isImage
            ? Image.asset(imagePath, height: HeightManager.h50) // إذا كانت صورة شعار
            : Image.asset(imagePath, height: HeightManager.h70), // إذا كانت صورة بطاقة كاملة أكبر
        // يمكنك ضبط الارتفاعات لتناسب صورك
      ),
    );
  }

  // دالة لمعالجة عملية الدفع عند النقر على زر "pay now"
  void _handlePayment() {
    // هنا يمكنك جمع البيانات من حقول النص
    final String cardholderName = _cardholderNameController.text;
    final String cardNumber = _cardNumberController.text;
    final String expiryDate = _expiryDateController.text;
    final String cvc = _cvcController.text;

    // طباعة البيانات للتحقق (في التطبيق الحقيقي، سترسلها إلى خادم الدفع)
    print('Processing payment...');
    print('Cardholder Name: $cardholderName');
    print('Card Number: $cardNumber');
    print('Expiry Date: $expiryDate');
    print('CVC: $cvc');
    print('Selected Payment Method: ${_selectedPaymentMethod ?? "None selected"}');
    print('Payment Amount: $_paymentAmount');

    // هنا يمكنك إضافة منطق التحقق من صحة المدخلات
    if (cardholderName.isEmpty || cardNumber.isEmpty || expiryDate.isEmpty || cvc.isEmpty) {
      // إظهار رسالة خطأ للمستخدم إذا كانت الحقول فارغة
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all card details!')),
      );
      return;
    }

    if (_selectedPaymentMethod == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a payment method!')),
      );
      return;
    }

    // هنا يمكنك استدعاء API الدفع أو تنفيذ أي منطق دفع آخر
    // For demonstration:
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment of $_paymentAmount processed via $_selectedPaymentMethod!')),
    );

    // بعد الدفع الناجح، يمكنك الانتقال إلى صفحة تأكيد أو العودة للصفحة الرئيسية
    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SuccessPage()));
  }
}