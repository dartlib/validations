part of validators.string;

/// Checks whether the value is a valid url.
///
/// Supported types: [String]
class UrlValidator extends ConstraintValidator {
  final List<String> protocols;
  final bool requireTld;
  final bool requireProtocol;
  final bool allowUnderscore;
  final List<String> whitelist;
  final List<String> blacklist;
  UrlValidator({
    /// Allowed protocols.
    this.protocols = const ['http', 'https', 'ftp'],

    /// Whether to required a top level domain.
    this.requireTld = true,

    /// Whether to required a protocol.
    this.requireProtocol = false,

    /// Whether to allow underscores in the url.
    this.allowUnderscore = false,

    /// A list of allowed hosts.
    this.whitelist = const [],

    /// A list of disallowed hosts.
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
  bool isValid(Object value, ValueContext context) {
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
