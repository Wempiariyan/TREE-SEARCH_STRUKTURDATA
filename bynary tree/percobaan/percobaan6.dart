class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;

  TNode(this.nodeValue);
}

class BinaryTree<T> {
  TNode<T>? root;

  // Menghitung kedalaman (depth) tree
  int maxDepth(TNode<T>? node) {
    if (node == null) {
      return 0;
    } else {
      int leftDepth = maxDepth(node.left);
      int rightDepth = maxDepth(node.right);
      return (leftDepth > rightDepth ? leftDepth : rightDepth) + 1;
    }
  }

  // Alias height = depth
  int height(TNode<T>? node) {
    return maxDepth(node);
  }

  // Mencetak semua node pada level tertentu
  void printCurrentLevel(TNode<T>? node, int level) {
    if (node != null) {
      if (level == 0) {
        print('${node.nodeValue}');
      } else {
        printCurrentLevel(node.left, level - 1);
        printCurrentLevel(node.right, level - 1);
      }
    }
  }

  // Mencetak traversal level-order
  void printLevelOrder() {
    int h = height(root);
    print("Level Order Traversal dari Binary Tree:");
    for (int i = 0; i < h; i++) {
      printCurrentLevel(root, i);
    }
  }
}

void main() {
  BinaryTree<int> t = BinaryTree<int>();

  // Membangun struktur pohon
  t.root = TNode<int>(10);
  t.root!.left = TNode<int>(20);
  t.root!.right = TNode<int>(30);
  t.root!.right!.left = TNode<int>(4);

  // Menampilkan level-order traversal
  t.printLevelOrder();
}
