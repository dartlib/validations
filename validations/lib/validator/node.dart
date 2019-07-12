part of validator;

class Node {
  String name;
  Node parent;
  List<Node> children = [];

  Node({
    @required this.name,
  });

  void append(Node node) {
    node.parent = this;
    children.add(node);
  }

  // Could contain more info later.
  String get path {
    var node = this;
    final path = <String>[];
    while (node != null) {
      path.add(node.name);
      node = node.parent;
    }
    return path.reversed.join('.');
  }

  Node clone() {
    return Node(
      name: name,
    )..parent = parent;
  }
}
