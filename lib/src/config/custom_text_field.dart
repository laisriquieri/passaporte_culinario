import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final String label;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;

  const CustomTextField({
    Key? key,
    required this.icon,
    required this.label,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;
  bool isFocused = false;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    isObscure = widget.isSecret;
    focusNode = FocusNode();
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        focusNode: focusNode,
        readOnly: widget.readOnly,
        initialValue: widget.initialValue,
        inputFormatters: widget.inputFormatters,
        obscureText: isObscure,
        style: const TextStyle(
          color: Colors.black, // Cor do texto quando em foco
        ),
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: BorderSide(
              color: isFocused
                  ? Colors.black
                  : Colors.grey, // Define a cor da borda quando em foco
              width: 2.0, // Define a largura da borda
            ),
          ),
          prefixIcon: IconTheme(
            data: IconThemeData(
              color: isFocused
                  ? Colors.black
                  : Colors.grey, // Cor do ícone quando em foco
            ),
            child: Icon(widget.icon),
          ),
          labelText: widget.label,
          isDense: true,
          suffixIcon: widget.isSecret
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isObscure = !isObscure;
                    });
                  },
                  icon: Icon(
                    isObscure ? Icons.visibility : Icons.visibility_off,
                    color: isFocused
                        ? Colors.black
                        : Colors.grey, // Cor do ícone quando em foco
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
            borderSide: const BorderSide(
              color: Color(0xff707070),
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
