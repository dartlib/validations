part of validators.string;

class UrlValidator extends ConstraintValidator {
  final List<String> protocols;
  final bool requireTld;
  final bool requireProtocol;
  final bool allowUnderscore;
  final List<String> whitelist;
  final List<String> blacklist;
  UrlValidator({
    this.protocols = const ['http', 'https', 'ftp'],
    this.requireTld = true,
    this.requireProtocol = false,
    this.allowUnderscore = false,
    this.whitelist = const [],
    this.blacklist = const [],
  }) : super([
          protocols,
          requireTld,
          requireProtocol,
          allowUnderscore,
          whitelist,
          blacklist,
        ]);
  @override
  bool isValid(Object value, [ValueContext context]) {
    return value is String &&
        isURL(
          value,
          requireTld: requireTld,
          requireProtocol: requireProtocol,
          allowUnderscore: allowUnderscore,
          hostBlacklist: blacklist,
          hostWhitelist: whitelist,
        );
  }

  @override
  Function message = (
    List<String> protocols,
    bool requireTld,
    bool requireProtocol,
    bool allowUnderscore,
    List<String> whitelist,
    List<String> blacklist,
    Object validatedValue,
  ) =>
      'Invalid URL';
}
