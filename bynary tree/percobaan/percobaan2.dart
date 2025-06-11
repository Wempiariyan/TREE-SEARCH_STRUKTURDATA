// Class Node generik
class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;

  TNode(this.nodeValue); // Konstruktor untuk nilai node
}

// Class BinaryTree generik
class BinaryTree<T> {
  TNode<T>? root;

  // Metode untuk traversal Inorder
  void inOrderDisplay(TNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left); // Rekursi ke anak kiri
      print('${node.nodeValue}'); // Cetak node saat ini
      inOrderDisplay(node.right); // Rekursi ke anak kanan
    }
  }

  // Memulai traversal dari root
  void printInOrderFromRoot() {
    inOrderDisplay(root);
  }
}

void main() {
  // Membuat objek BinaryTree
  BinaryTree<int> t = BinaryTree<int>();

  // Membangun Binary Tree secara manual
  t.root = TNode<int>(10); // Root
  t.root!.left = TNode<int>(20); // Anak kiri
  t.root!.right = TNode<int>(30); // Anak kanan
  t.root!.right!.left = TNode<int>(4); // Anak kiri dari node 30

  // Menampilkan hasil traversal Inorder
  print("Inorder Traversal dari Binary Tree:");
  t.printInOrderFromRoot();
}
