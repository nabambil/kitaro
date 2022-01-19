import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    required this.labelText,
    required this.errorText,
    required this.value,
    required this.items,
    this.onSelected,
    this.labelTextColor = const Color(0x424D627B),
    Key? key,
  }) : super(key: key);

  final String? labelText;
  final Color? labelTextColor;
  final String? errorText;
  final String? value;
  final List<String> items;
  final ValueChanged? onSelected;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    String? _textValue = widget.value;
    return FormField<String>(
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 43,
              child: Stack(
                children: [
                  InputDecorator(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: widget.errorText != null
                              ? Colors.red.shade900
                              : const Color(0xff969FAA),
                        ),
                      ),
                    ),
                    isEmpty: _textValue == '',
                  ),
                  DropdownButtonHideUnderline(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      width: double.infinity,
                      height: double.infinity,
                      child: DropdownButton<String>(
                        hint: Text(
                          widget.labelText!,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: widget.errorText != null ? Colors.red.shade900 : widget.labelTextColor,
                              fontWeight: widget.errorText != null ? FontWeight.normal : FontWeight.bold
                          ),
                        ),
                        value: widget.value,
                        isDense: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            widget.onSelected?.call(newValue);
                            _textValue = newValue;
                          });
                        },
                        items: widget.items.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (widget.errorText != null)
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                child: Text(
                  widget.errorText!,
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 12.0,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
