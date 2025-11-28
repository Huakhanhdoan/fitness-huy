import 'package:base_project_flutter/app/core/base/base_get_view.dart';
import 'package:base_project_flutter/app/core/utils/navigation_utils.dart';
import 'package:base_project_flutter/app/presentation/validators/index.dart';
import 'package:base_project_flutter/app/presentation/widgets/base_background.dart';
import '../controllers/login_controller.dart';

class LoginView extends BaseGetView<LoginController> {
  LoginView({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget myBuild(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BaseBackground(
            title: "Welcome to Login!",
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: _buildFormContainer(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFormContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(32), // Rounded corners for the form container
        ),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Login to your account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            _buildAvatar(),
            const SizedBox(height: 16),
            _buildEmailField(),
            const SizedBox(height: 16),
            _buildPasswordField(),
            const SizedBox(height: 8),
            _buildForgotPassword(),
            const SizedBox(height: 24),
            _buildLoginButton(),
            const SizedBox(height: 24),
            _buildRegisterText(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return const SizedBox(
      width: 60,
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.green,
        child: Icon(Icons.person, size: 40, color: Colors.white),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: controller.emailController,
      decoration: InputDecoration(
        labelText: "Email",
        labelStyle: const TextStyle(color: Colors.green),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        prefixIcon: const Icon(Icons.email, color: Colors.green),
      ),
      // Add email validation
      validator: EmailValidator.validate,
    );
  }

  // Update the LoginView
  Widget _buildPasswordField() {
    return Obx(() {
      return TextFormField(
        controller: controller.passwordController,
        obscureText: !controller.isPasswordVisible.value,
        decoration: InputDecoration(
          labelText: "Password",
          labelStyle: const TextStyle(color: Colors.green),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIcon: const Icon(Icons.lock, color: Colors.green),
          suffixIcon: IconButton(
            icon: Icon(
              controller.isPasswordVisible.value
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: Colors.green,
            ),
            onPressed: controller.togglePasswordVisibility,
          ),
        ),
        // Add password validation
        validator: (value) => value != null
            ? PasswordValidator.validate(value)
            : 'Password is required',
      );
    });
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: NavigationUtils.toForgotPassword,
        child: const Text(
          "Forgot Password?",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: NavigationUtils.toRegister,
          child: const Text(
            "Register here",
            style: TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            controller.login();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
