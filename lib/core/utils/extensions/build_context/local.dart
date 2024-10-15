import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Shorthand for [AppLocalizations.of(context)!]
extension Localization on BuildContext {
  AppLocalizations get local => AppLocalizations.of(this)!;
}
