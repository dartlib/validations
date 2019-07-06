import 'package:meta/meta.dart';

import 'node.dart';

class ValueContext {
  Node node;
  Object value;
  ValueContext({
    @required this.node,
    @required this.value,
  });
}
