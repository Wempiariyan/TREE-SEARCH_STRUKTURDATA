import 'dart:io';

// Node class untuk BST
class Node<T extends Comparable> {
  T data;
  Node<T>? left;
  Node<T>? right;
  Node<T>? parent;

  Node(this.data, {this.parent});
}

// Kelas BinarySearchTree
class SearchTree<T extends Comparable> {
  Node<T>? root;
  int size = 0;

  bool insert(T value) {
    if (root == null) {
      root = Node<T>(value);
      size++;
      return true;
    }

    Node<T>? current = root;
    Node<T>? parent;

    while (current != null) {
      int cmp = value.compareTo(current.data);
      if (cmp == 0) return false;
      parent = current;
      current = cmp < 0 ? current.left : current.right;
    }

    Node<T> newNode = Node(value, parent: parent);
    if (value.compareTo(parent!.data) < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    size++;
    return true;
  }

  T minimum() {
    if (root == null) throw Exception("Tree Kosong");
    Node<T> current = root!;
    while (current.left != null) {
      current = current.left!;
    }
    return current.data;
  }

  T maximum() {
    if (root == null) throw Exception("Tree Kosong");
    Node<T> current = root!;
    while (current.right != null) {
      current = current.right!;
    }
    return current.data;
  }

  void inorderTraversal() {
    Node<T>? current = root;
    List<Node<T>> stack = [];

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      current = stack.removeLast();
      stdout.write("${current.data} ");
      current = current.right;
    }

    print("");
  }
}

void main() {
  final tree = SearchTree<int>();

  // Menambahkan elemen
  tree.insert(35);
  tree.insert(18);
  tree.insert(25);
  tree.insert(48);
  tree.insert(20);

  // Menampilkan nilai minimum dan maksimum
  print("Nilai minimum: ${tree.minimum()}");
  print("Nilai maksimum: ${tree.maximum()}");

  // Menampilkan traversal inorder
  print("\nTraversal inorder:");
  tree.inorderTraversal();
}
