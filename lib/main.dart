import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

import 'app.dart';

/// Kept alive so the framework keeps producing semantics for the whole session.
late final SemanticsHandle appSemanticsHandle;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  appSemanticsHandle = SemanticsBinding.instance.ensureSemantics();
  runApp(const RealityAnchorApp());
}
