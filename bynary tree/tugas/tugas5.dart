// Versi berbeda: Diagram rekursif untuk menghitung kedalaman pohon biner

class Node<T> {
  T value;
  Node<T>? left;
  Node<T>? right;
  String name; // Nama label simpul

  Node(this.value, this.name);
}

class Tree<T> {
  Node<T>? root;

  // Tambah simpul berdasarkan urutan level
  void insertByLevel(T val, String label) {
    var newNode = Node<T>(val, label);
    if (root == null) {
      root = newNode;
      return;
    }

    var queue = <Node<T>>[];
    queue.add(root!);

    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);

      if (current.left == null) {
        current.left = newNode;
        return;
      } else {
        queue.add(current.left!);
      }

      if (current.right == null) {
        current.right = newNode;
        return;
      } else {
        queue.add(current.right!);
      }
    }
  }

  // Hitung kedalaman maksimum secara rekursif
  int depth(Node<T>? node) {
    if (node == null) return 0;
    int dLeft = depth(node.left);
    int dRight = depth(node.right);
    return (dLeft > dRight ? dLeft : dRight) + 1;
  }

  // Tampilkan penelusuran level-order
  void showLevelOrder() {
    if (root == null) {
      print("Pohon kosong.");
      return;
    }

    var queue = <Node<T>>[];
    queue.add(root!);

    print("Penelusuran Level-Order:");
    while (queue.isNotEmpty) {
      var current = queue.removeAt(0);
      print("${current.value} (${current.name})");

      if (current.left != null) queue.add(current.left!);
      if (current.right != null) queue.add(current.right!);
    }
  }

  // Diagram rekursif perhitungan kedalaman
  void traceDepth(Node<T>? node, String spasi) {
    if (node == null) {
      print("${spasi}null => 0");
      return;
    }

    print("${spasi}Simpul ${node.value} (${node.name}):");

    print("${spasi}  Kedalaman kiri:");
    traceDepth(node.left, "$spasi    ");

    print("${spasi}  Kedalaman kanan:");
    traceDepth(node.right, "$spasi    ");

    int leftD = depth(node.left);
    int rightD = depth(node.right);
    int total = (leftD > rightD ? leftD : rightD) + 1;

    print(
        "${spasi}  Total Kedalaman ${node.value} = max(${leftD}, ${rightD}) + 1 = $total");
  }

  // Jalankan visualisasi perhitungan dari root
  void runDepthTracing() {
    print("\n=== Visualisasi Kedalaman Pohon Biner ===\n");
    traceDepth(root, "");
    print("\nTotal Kedalaman Pohon: ${depth(root)}");
  }
}

void main() {
  var t = Tree<int>();

  // Bangun pohon sesuai struktur tertentu
  t.root = Node(10, "akar");
  t.root!.left = Node(20, "kiri");
  t.root!.right = Node(30, "kanan");
  t.root!.right!.left = Node(40, "kiri-anak-kanan");

  // Tampilkan struktur
  print("Struktur Awal Pohon:");
  print("Root: ${t.root!.value} (${t.root!.name})");
  print("Left: ${t.root!.left!.value} (${t.root!.left!.name})");
  print("Right: ${t.root!.right!.value} (${t.root!.right!.name})");
  print("Right->Left: ${t.root!.right!.left!.value} (${t.root!.right!.left!.name})");

  // Jalankan visualisasi rekursif
  t.runDepthTracing();

  // Tambahkan node secara level-order
  print("\n=== Tambah Simpul via Level-Order ===\n");
  var anotherTree = Tree<int>();
  anotherTree.insertByLevel(10, "akar");
  anotherTree.insertByLevel(20, "p");
  anotherTree.insertByLevel(30, "r");
  anotherTree.insertByLevel(40, "q");
  anotherTree.insertByLevel(50, "s");
  anotherTree.insertByLevel(60, "t");

  // Cetak level order tree
  anotherTree.showLevelOrder();

  // Hitung dan tampilkan kedalaman
  print(
      "\nKedalaman Pohon (Level-Order): ${anotherTree.depth(anotherTree.root)}");

  // Tampilkan diagram perhitungan kedalaman
  print("\n=== Visualisasi Rekursif Level-Order Tree ===\n");
  anotherTree.traceDepth(anotherTree.root, "");
}
