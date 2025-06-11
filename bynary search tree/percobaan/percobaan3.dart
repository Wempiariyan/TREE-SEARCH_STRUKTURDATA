import 'dart:io';

// Definisi node untuk Binary Search Tree
class STNode<T> {
  T nodeValue;
  STNode<T>? left;
  STNode<T>? right;

  STNode(this.nodeValue);
}

// Definisi Binary Search Tree
class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;
  int _size = 0;

  // Getter untuk root
  STNode<T>? getRoot() => root;

  // Getter untuk ukuran pohon
  int get treeSize => _size;

  // Tambah node ke BST
  void add(T value) {
    root = _insert(root, value);
    _size++;
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
    STNode<T>? current = root;

    while (current != null) {
      int cmp = item.compareTo(current.nodeValue);

      if (cmp == 0) {
        return current;
      } else if (cmp < 0) {
        current = current.left;
      } else {
        current = current.right;
      }
    }

    throw Exception('Node not found');
  }

  // Cek apakah node ditemukan
  bool find(T item) {
    try {
      findNode(item);
      return true;
    } catch (e) {
      return false;
    }
  }

  // Cetak semua node (preorder rekursif)
  void printNode(STNode<T>? node) {
    if (node == null) return;
    print("${node.nodeValue}");
    printNode(node.left);
    printNode(node.right);
  }

  // Inorder traversal (iteratif)
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

  // Preorder traversal (iteratif)
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

  // Postorder traversal (iteratif)
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

// Fungsi main
void main() {
  var BSTree = BinarySearchTree<int>();

  // Tambahkan data ke BST
  BSTree.add(7);
  BSTree.add(4);
  BSTree.add(5);
  BSTree.add(9);
  BSTree.add(11);
  BSTree.add(12);

  // Cetak node preorder (rekursif)
  print("Cetak node preorder (rekursif):");
  BSTree.printNode(BSTree.getRoot());

  print('\n\nInorder Traversal:');
  BSTree.inorderIterative(BSTree.getRoot());

  print('\nPreorder Traversal:');
  BSTree.preorderIterative(BSTree.getRoot());

  print('\nPostorder Traversal:');
  BSTree.postorderIterative(BSTree.getRoot());

  // Cek pencarian node
  print('\n\nFind node with value 9:');
  print('Ditemukan: ${BSTree.findNode(9).nodeValue}');

  print('\nTree Size: ${BSTree.treeSize}');

  // Cek node ada/tidak
  try {
    var node = BSTree.findNode(5);
    print('Node found with value: ${node.nodeValue}');
  } catch (e) {
    print('Node not found.');
  }

  bool nodeFound = BSTree.find(5);
  print(nodeFound ? 'Node found' : 'Node not found');
}
