enum AppButtonType { regular, link, detail }

extension AppButtonTypeFromStringExtension on Iterable<AppButtonType> {
  AppButtonType? fromString(String val) {
    final override = {
      'regular': AppButtonType.regular,
      'link': AppButtonType.link,
      'detail': AppButtonType.detail,
    }[val];

    return this.contains(override) ? override : null;
  }
}

extension AppButtonTypeEnhancedEnum on AppButtonType {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        AppButtonType.regular: 'regular',
        AppButtonType.link: 'link',
        AppButtonType.detail: 'detail',
      }[this]!;
  bool get isRegular => this == AppButtonType.regular;
  bool get isLink => this == AppButtonType.link;
  bool get isDetail => this == AppButtonType.detail;
  T when<T>({
    required T Function() regular,
    required T Function() link,
    required T Function() detail,
  }) =>
      {
        AppButtonType.regular: regular,
        AppButtonType.link: link,
        AppButtonType.detail: detail,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? regular,
    T? Function()? link,
    T? Function()? detail,
    required T Function() orElse,
  }) =>
      {
        AppButtonType.regular: regular,
        AppButtonType.link: link,
        AppButtonType.detail: detail,
      }[this]
          ?.call() ??
      orElse();
}
