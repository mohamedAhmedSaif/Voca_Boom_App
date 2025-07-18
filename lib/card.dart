// payment_method_page.dart
import 'package:flutter/material.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({super.key});

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  // تعريف الألوان بناءً على تصميمك
  static const Color _primaryPurple = Color(0xFF6A4CEE); // لون الشعار وزر الدفع
  static const Color _secondaryBlue = Color(0xFF4C9EEE); // لون الشعار
  static const Color _textColor = Colors.black; // لون النص الأساسي
  static const Color _textFieldFillColor = Color(0xFFE0E0E0); // لون خلفية حقول الإدخال
  static const Color _blueButtonColor = Color(0xFF4C4CEE); // لون زر "Pay Now"

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // 🔙 يرجع للصفحة اللي قبله
          },
        ),
      ),// خلفية بيضاء للصفحة
      body: SafeArea(
        child: SingleChildScrollView( // SingleChildScrollView للسماح بالتمرير إذا كانت الشاشة صغيرة
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // محاذاة العناصر في المنتصف أفقياً
            children: [
              // --- شعار VocaBoom ---
              Center(
                child: Image.asset(
                  'assets/images/logo.png', // تأكد من وجود الشعار في مجلد assets
                  height: 100,
                  width: 100,
                ),
              ),
              const SizedBox(height: 20),

              // --- عنوان "select a payment method" ---
              Text(
                'select a payment method',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _textColor,
                ),
              ),
              const SizedBox(height: 30),

              // --- خيارات طرق الدفع (InstaPay, Visa, Mastercard) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround, // توزيع الخيارات بالتساوي
                children: [
                  _buildPaymentOption(
                    context,
                    'assets/images/image card1.png', // استبدل بمسار شعار Instapay
                    'InstaPay',
                  ),
                  _buildPaymentOption(
                    context,
                    'assets/images/image card2.png', // استبدل بمسار شعار Visa
                    'Visa',
                  ),
                  _buildPaymentOption(
                    context,
                    'assets/images/image card3.png', // استبدل بمسار شعار Mastercard
                    'Mastercard',
                    isImage: false, // هذا الخيار هو صورة بطاقة كاملة وليس مجرد شعار
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- حقول إدخال بيانات البطاقة ---
              _buildTextField('cardholder name', _cardholderNameController),
              const SizedBox(height: 20),
              _buildTextField('card number', _cardNumberController, keyboardType: TextInputType.number),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _buildTextField('Expiry date', _expiryDateController, keyboardType: TextInputType.datetime),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildTextField('cvc', _cvcController, keyboardType: TextInputType.number),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // --- "select your pay ment" (مع Checkbox أو ما يعادله) ---
              // في التصميم، تبدو وكأنها Checkbox مع نص.
              Row(
                children: [
                  Container( // مربع الأيقونة/checkbox
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: _blueButtonColor, // لون مربع الأيقونة
                      borderRadius: BorderRadius.circular(4),
                    ),
                    // يمكنك استبدال هذا بـ Checkbox إذا أردت وظائف حقيقية
                    // أو جعلها IconButton لإظهار/إخفاء تفاصيل الدفع المحفوظة.
                    // حاليًا، هي مجرد مربع لوني مطابق للتصميم.
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'select your pay ment',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: _textColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),

              // --- مبلغ الدفع ---
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'payment amount $_paymentAmount',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: _textColor,
                  ),
                ),
              ),
              const SizedBox(height: 50),

              // --- زر "pay now" ---
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    // هذا هو التحكم الرئيسي لعملية الدفع
                    _handlePayment();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _blueButtonColor, // لون خلفية الزر
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15), // حواف دائرية
                    ),
                    elevation: 5, // ظل الزر
                  ),
                  child: const Text(
                    'pay now',
                    style: TextStyle(
                      fontSize: 22,
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
          borderRadius: BorderRadius.circular(15), // حواف دائرية
          borderSide: BorderSide.none, // إزالة حدود المربع (مبني على التصميم)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18), // حشوة داخلية
      ),
      style: TextStyle(color: _textColor, fontSize: 18), // لون وحجم النص المدخل
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
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
            ? Image.asset(imagePath, height: 50) // إذا كانت صورة شعار
            : Image.asset(imagePath, height: 70), // إذا كانت صورة بطاقة كاملة أكبر
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