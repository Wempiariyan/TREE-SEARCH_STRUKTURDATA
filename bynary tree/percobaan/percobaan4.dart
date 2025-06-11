class TNode<T> {
  T nodeValue;
  TNode<T>? left;
  TNode<T>? right;

  TNode(this.nodeValue);
}

class BinaryTree<T> {
  TNode<T>? root;

  void inOrderDisplay(TNode<T>? node) {
    if (node != null) {
      inOrderDisplay(node.left);
      print('${node.nodeValue}');
      inOrderDisplay(node.right);
    }
  }

  void preOrderDisplay(TNode<T>? node) {
    if (node != null) {
      print('${node.nodeValue}');
      preOrderDisplay(node.left);
      preOrderDisplay(node.right);
    }
  }

  void postOrderDisplay(TNode<T>? node) {
    if (node != null) {
      postOrderDisplay(node.left);
      postOrderDisplay(node.right);
      print('${node.nodeValue}');
    }
  }

  void printInOrderFromRoot() {
    inOrderDisplay(root);
  }

  void printPreOrderFromRoot() {
    preOrderDisplay(root);
  }

  void printPostOrderFromRoot() {
    postOrderDisplay(root);
  }
}

void main() {
  BinaryTree<int> t = BinaryTree<int>();

  t.root = TNode<int>(10);
  t.root!.left = TNode<int>(20);
  t.root!.right = TNode<int>(30);
  t.root!.right!.left = TNode<int>(4);

  print("Preorder Traversal dari Binary Tree:");
  t.printPreOrderFromRoot();

  print("\nInorder Traversal dari Binary Tree:");
  t.printInOrderFromRoot();

  print("\nPostorder Traversal dari Binary Tree:");
  t.printPostOrderFromRoot();
}
