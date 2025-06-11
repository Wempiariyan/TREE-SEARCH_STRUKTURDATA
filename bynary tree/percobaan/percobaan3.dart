// Kelas node generik
class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;

  TNode(this.nodeValue);
}

// Kelas pohon biner generik
class BinaryTree<T> {
  TNode<T>? root;

  // Traversal Inorder: kiri → akar → kanan
  void inOrderDisplay(TNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left);
      print('${node.nodeValue}');
      inOrderDisplay(node.right);
    }
  }

  // Traversal Preorder: akar → kiri → kanan
  void preOrderDisplay(TNode<T>? node) {
    if (node != null) {
      print('${node.nodeValue}');
      preOrderDisplay(node.left);
      preOrderDisplay(node.right);
    }
  }

  // Mulai traversal dari root
  void printInOrderFromRoot() {
    inOrderDisplay(root);
  }

  void printPreOrderFromRoot() {
    preOrderDisplay(root);
  }
}

void main() {
  // Membuat objek BinaryTree
  BinaryTree<int> t = BinaryTree<int>();

  // Membangun Binary Tree secara manual
  t.root = TNode<int>(10);
  t.root!.left = TNode<int>(20);
  t.root!.right = TNode<int>(30);
  t.root!.right!.left = TNode<int>(4);

  // Menampilkan hasil traversal Preorder
  print("Preorder Traversal dari Binary Tree:");
  t.printPreOrderFromRoot();

  // Menampilkan hasil traversal Inorder
  print("\nInorder Traversal dari Binary Tree:");
  t.printInOrderFromRoot();
}
