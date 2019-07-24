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

  Node findNode(String path) {
    final parts = path.split('.');

    var node = this;

    for (var i = 0; i < parts.length; i++) {
      final part = parts[i];

      node = _getChildByName(part);

      if (node == null) {
        return null;
      }
    }

    return node;
  }

  Node _getChildByName(String name) {
    return children.firstWhere(
      (child) => child.name == name,
      orElse: () => null,
    );
  }

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
