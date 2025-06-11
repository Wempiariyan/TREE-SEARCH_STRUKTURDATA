import 'dart:io';

// Node class dengan parent
class STNode<T> {
  T nodeValue;
  STNode<T>? left;
  STNode<T>? right;
  STNode<T>? parent;

  STNode(this.nodeValue, {this.parent});
}

class BinarySearchTree<T extends Comparable> {
  STNode<T>? root;
  int _size = 0;

  // Getter
  STNode<T>? getRoot() => root;
  int get treeSize => _size;

  void add(T value) {
    if (root == null) {
      root = STNode<T>(value);
      _size++;
      return;
    }

    STNode<T>? current = root;
    STNode<T>? parent;

    while (current != null) {
      parent = current;
      if (value.compareTo(current.nodeValue) < 0) {
        current = current.left;
      } else if (value.compareTo(current.nodeValue) > 0) {
        current = current.right;
      } else {
        return; // duplicate, tidak ditambahkan
      }
    }

    var newNode = STNode<T>(value, parent: parent);
    if (value.compareTo(parent!.nodeValue) < 0) {
      parent.left = newNode;
    } else {
      parent.right = newNode;
    }

    _size++;
  }

  // Mencari node berdasarkan nilai
  STNode<T>? findNode(T item) {
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
    return null;
  }

  bool find(T item) => findNode(item) != null;

  void printNode(STNode<T>? node) {
    if (node == null) return;
    print("${node.nodeValue}");
    printNode(node.left);
    printNode(node.right);
  }

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

  // Menghapus node
  void removeNode(STNode<T>? dNode) {
    if (dNode == null) return;

    STNode<T>? pNode = dNode.parent;
    STNode<T>? rNode;

    // Case: hanya 1 anak atau tidak ada anak
    if (dNode.left == null || dNode.right == null) {
      rNode = dNode.left ?? dNode.right;

      if (rNode != null) rNode.parent = pNode;

      if (pNode == null) {
        root = rNode;
      } else if (dNode == pNode.left) {
        pNode.left = rNode;
      } else {
        pNode.right = rNode;
      }
    }
    // Case: dua anak
    else {
      STNode<T> successor = dNode.right!;
      while (successor.left != null) {
        successor = successor.left!;
      }

      dNode.nodeValue = successor.nodeValue;
      removeNode(successor);
      return; // Ukuran pohon dikurangi di akhir
    }

    _size--;
  }
}
void main() {
  BinarySearchTree<int> BSTree = BinarySearchTree();

  BSTree.add(7);
  BSTree.add(4);
  BSTree.add(5);
  BSTree.add(9);
  BSTree.add(11);
  BSTree.add(12);

  print("Preorder print (rekursif):");
  BSTree.printNode(BSTree.getRoot());

  print('\n\nInorder:');
  BSTree.inorderIterative(BSTree.getRoot());

  print('\nPreorder:');
  BSTree.preorderIterative(BSTree.getRoot());

  print('\nPostorder:');
  BSTree.postorderIterative(BSTree.getRoot());

  print('\n\nFind node:');
  var node = BSTree.findNode(5);
  if (node != null) {
    print('Found node with value: ${node.nodeValue}');
  }

  print('Tree Size: ${BSTree.treeSize}');

  print('\nRemoving node with value 5...');
  BSTree.removeNode(node);

  print('After deletion:');
  BSTree.printNode(BSTree.getRoot());

  print('\nUpdated Tree Size: ${BSTree.treeSize}');
}
