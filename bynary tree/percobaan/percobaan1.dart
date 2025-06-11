// Definisi kelas TNode untuk Binary Tree
class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;


  TNode(this.nodeValue)
      : left = null,
        right = null;
}


// Definisi kelas BinaryTree
class BinaryTree<T> {
  TNode<T>? root;


  BinaryTree() {
    root = null; // Inisialisasi root sebagai null
  }
}


void main() {
  // Membuat objek BinaryTree
  BinaryTree<int> t = BinaryTree<int>();


  // Membangun Binary Tree secara manual
  t.root = TNode<int>(10); // Node akar
  t.root!.left = TNode<int>(20); // Anak kiri dari root
  t.root!.right = TNode<int>(30); // Anak kanan dari root
  t.root!.right!.left = TNode<int>(4); // Anak kiri dari node 30


  // Output untuk memverifikasi struktur Binary Tree
  print("Root: ${t.root?.nodeValue}"); // Output: Root: 10
  print(
      "Left Child of Root: ${t.root?.left?.nodeValue}"); // Output: Left Child of Root: 20
  print(
      "Right Child of Root: ${t.root?.right?.nodeValue}"); // Output: Right Child of Root: 30
  print(
      "Left Child of Node 30: ${t.root?.right?.left?.nodeValue}"); // Output: Left Child of Node 30: 4
}


