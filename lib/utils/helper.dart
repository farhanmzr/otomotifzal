import 'package:flutter/material.dart';
import 'package:otomotifzal/utils/colors.dart';

final inputDecoration = InputDecoration(
  hintStyle: const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  ),
  enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueGrey.shade200, width: 1.0),
      borderRadius: BorderRadius.circular(12)),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: blue, width: 2.0),
    borderRadius: BorderRadius.circular(12),
  ),
  isDense: true, // important line
  contentPadding:
  const EdgeInsets.fromLTRB(16, 10, 16, 10), // control your hints text size
  fillColor: Colors.white30,
  filled: true,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
  ),
);