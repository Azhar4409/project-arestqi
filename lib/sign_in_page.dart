import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Masuk',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  labelText: "Email Anda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              SizedBox(height: 16),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  labelText: "Kata Sandi Anda",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                    if (email == 'arestqi@gmail.com' && password == '12345') {
                      Navigator.pushReplacementNamed(context, '/home');
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Email atau password salah')),
                      );
                    }
                  },
                  child: Text('Masuk'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Login dengan',
                style: TextStyle(color: Colors.grey[600]),
              ),

              SizedBox(height: 12),

              Column(
                children: [
                  _buildSocialButton(
                    icon: Icons.email_outlined,
                    text: 'Lanjutkan dengan email',
                    onPressed: () {},
                  ),
                  SizedBox(height: 8),
                  _buildSocialButton(
                    icon: Icons.apple,
                    text: 'Lanjutkan dengan Apple',
                    onPressed: () {},
                  ),
                  SizedBox(height: 8),
                  _buildSocialButton(
                    icon: Icons.g_mobiledata, // Google icon substitute
                    text: 'Lanjutkan dengan Google',
                    onPressed: () {},
                  ),
                  SizedBox(height: 8),
                  _buildSocialButton(
                    icon: Icons.facebook,
                    text: 'Lanjutkan dengan Facebook',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton(
      {required IconData icon, required String text, required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: OutlinedButton.icon(
        icon: Icon(icon, size: 20),
        label: Text(text),
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          side: BorderSide(color: Colors.grey.shade300),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          textStyle: TextStyle(fontSize: 14),
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}