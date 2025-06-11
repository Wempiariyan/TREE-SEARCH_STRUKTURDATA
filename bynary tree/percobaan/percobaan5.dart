// Definisi class TNode<T>
class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;

  TNode(this.nodeValue);
}

// Definisi class BinaryTree<T>
class BinaryTree<T> {
  TNode<T>? root;

  // Metode menghitung kedalaman maksimal
  int maxDepth(TNode<T>? node) {
    if (node == null) {
      return 0;
    } else {
      int leftDepth = maxDepth(node.left);
      int rightDepth = maxDepth(node.right);
      return leftDepth > rightDepth ? leftDepth + 1 : rightDepth + 1;
    }
  }
}

void main() {
  // Membuat objek BinaryTree
  BinaryTree<int> t = BinaryTree<int>();

  // Membangun Binary Tree
  t.root = TNode<int>(10);           // Root
  t.root!.left = TNode<int>(20);     // Anak kiri dari root
  t.root!.right = TNode<int>(30);    // Anak kanan dari root
  t.root!.right!.left = TNode<int>(4); // Anak kiri dari node 30

  // Menampilkan kedalaman
  print("Kedalaman Binary Tree: ${t.maxDepth(t.root)}");
}
