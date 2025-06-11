import 'dart:io';

// Definisi kelas node untuk Binary Search Tree
class STNode<T> {
  T nodeValue;
  STNode<T>? left;
  STNode<T>? right;

  STNode(this.nodeValue);
}

// Definisi kelas Binary Search Tree
class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;

  STNode<T>? getRoot() => root;

  // Menambahkan elemen ke dalam BST
  void add(T value) {
    root = _insert(root, value);
  }

  STNode<T> _insert(STNode<T>? node, T value) {
    if (node == null) {
      return STNode<T>(value);
    }

    if (value.compareTo(node.nodeValue) < 0) {
      node.left = _insert(node.left, value);
    } else if (value.compareTo(node.nodeValue) > 0) {
      node.right = _insert(node.right, value);
    }
    return node;
  }

  // Menemukan node berdasarkan nilai
  STNode<T> findNode(T item) {
    STNode<T>? t = root;
    while (t != null) {
      int cmp = item.compareTo(t.nodeValue);
      if (cmp == 0) {
        return t;
      } else if (cmp < 0) {
        t = t.left;
      } else {
        t = t.right;
      }
    }
    throw Exception('Node not found');
  }

  // Cetak semua node (preorder secara rekursif untuk testing)
  void printNode(STNode<T>? node) {
    if (node == null) return;
    print("${node.nodeValue}");
    printNode(node.left);
    printNode(node.right);
  }

  // Inorder traversal iteratif
  void inorderIterative(STNode<T>? node) {
    var stack = <STNode<T>>[];
    var current = node;

    while (current != null || stack.isNotEmpty) {
      while (current != null) {
        stack.add(current);
        current = current.left;
      }

      current = stack.removeLast();
      stdout.write("${current.nodeValue} ");
      current = current.right;
    }
  }

  // Preorder traversal iteratif
  void preorderIterative(STNode<T>? node) {
    if (node == null) return;

    var stack = <STNode<T>>[];
    stack.add(node);

    while (stack.isNotEmpty) {
      var current = stack.removeLast();
      stdout.write("${current.nodeValue} ");

      if (current.right != null) stack.add(current.right!);
      if (current.left != null) stack.add(current.left!);
    }
  }

  // Postorder traversal iteratif
  void postorderIterative(STNode<T>? node) {
    if (node == null) return;

    var stack1 = <STNode<T>>[];
    var stack2 = <STNode<T>>[];

    stack1.add(node);

    while (stack1.isNotEmpty) {
      var current = stack1.removeLast();
      stack2.add(current);

      if (current.left != null) stack1.add(current.left!);
      if (current.right != null) stack1.add(current.right!);
    }

    while (stack2.isNotEmpty) {
      stdout.write("${stack2.removeLast().nodeValue} ");
    }
  }
}

void main() {
  var BSTree = BinarySearchTree<int>();

  // Tambahkan nilai ke BST
  BSTree.add(7);
  BSTree.add(4);
  BSTree.add(5);
  BSTree.add(9);
  BSTree.add(11);
  BSTree.add(12);

  // Cetak semua node
  print("Cetak node preorder (rekursif):");
  BSTree.printNode(BSTree.getRoot());

  print('\n\nInorder Traversal:');
  BSTree.inorderIterative(BSTree.getRoot());

  print('\nPreorder Traversal:');
  BSTree.preorderIterative(BSTree.getRoot());

  print('\nPostorder Traversal:');
  BSTree.postorderIterative(BSTree.getRoot());

  // Temukan node dengan nilai tertentu
  print('\n\nFind Node with value 9:');
  print(BSTree.findNode(9).nodeValue);
}
