import 'package:app_demo/src/shared/constants/images_constants.dart';
import 'package:app_demo/src/shared/widgets/text_field_custom.dart';
import 'package:flutter/material.dart';

class DatePickerCustom extends StatefulWidget {
  const DatePickerCustom({
    super.key,
    required this.hintText,
    this.icon = MyImages.userIcon,
    this.initialDate,
    this.firstDate,
    this.lastDate,
    this.errorText,
    this.onChanged,
  });

  final String hintText;
  final String icon;
  final DateTime? initialDate;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? errorText;
  final ValueChanged<DateTime>? onChanged;

  @override
  State<DatePickerCustom> createState() => _DatePickerCustomState();
}

class _DatePickerCustomState extends State<DatePickerCustom> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  DateTime? _selectedDate;

  @override
  void initState() {
    _focusNode = FocusNode();
    _controller = TextEditingController();
    _selectedDate = widget.initialDate;
    _controller.text = _formatDate(_selectedDate);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant DatePickerCustom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialDate != widget.initialDate) {
      _selectedDate = widget.initialDate;
      _controller.text = _formatDate(_selectedDate);
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    return '${date.day.toString().padLeft(2, '0')}/'
        '${date.month.toString().padLeft(2, '0')}/'
        '${date.year}';
  }

  Future<void> _selectDate() async {
    final DateTime now = DateTime.now();
    final DateTime firstDate = DateTime(1700);
    final DateTime lastDate = DateTime(now.year + 100);

    final DateTime initial =
        _selectedDate ??
        (widget.initialDate ?? DateTime(now.year - 18, now.month, now.day));

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initial.isBefore(firstDate)
          ? firstDate
          : (initial.isAfter(lastDate) ? lastDate : initial),
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (picked == null) return;
    setState(() {
      _selectedDate = picked;
      _controller.text = _formatDate(_selectedDate);
    });

    widget.onChanged?.call(picked);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: TextFieldCustom(
        icon: widget.icon,
        hintText: widget.hintText,
        controller: _controller,
        focusNode: _focusNode,
        errorText: widget.errorText,
      ),
    );
  }
}
