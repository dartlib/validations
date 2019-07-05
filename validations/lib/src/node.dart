import 'package:meta/meta.dart';

class Node {
  String name;
  Node parent;
  List<Node> children = [];

  Node({
    @required this.name,
  });

  append(Node node) {
    node.parent = this;
    children.add(node);
  }

  // Could contain more info later.
  String get path {
    Node node = this;
    List<String> path = [];
    while (node != null) {
      path.add(node.name);
      node = node.parent;
    }
    return path.reversed.join('.');
  }

  Node clone() {
    return Node(
      name: this.name,
    )..parent = this.parent;
  }
}
