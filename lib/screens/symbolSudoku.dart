import 'package:flutter/material.dart';

class SymbolSudoku extends StatefulWidget {
  const SymbolSudoku({super.key});

  @override
  State<SymbolSudoku> createState() => _SymbolSudokuState();
}

class _SymbolSudokuState extends State<SymbolSudoku> {
  final List<String> symbols = ['🟩', '🌸', '⭐', '▲', '🔵', '❤️'];

 
 
  final List<int> initialBoard = [
     0, -1,  2, -1,  4,  5,
    -1,  3,  4,  5, -1,  1,
     4,  5, -1,  1,  2, -1,
     1, -1,  3,  4, -1,  0,
     3,  4, -1,  0,  1, -1,
    -1,  0,  1, -1,  3,  4,
  ];

  late List<int> board;
  late List<bool> fixedCells;

  int? selectedCell;
  bool gameWon = false;

  @override
  void initState() {
    super.initState();
    _startBoard();
  }

  void _startBoard() {
    board = List<int>.from(initialBoard);
    fixedCells =
        initialBoard.map((value) => value != -1).toList();

    selectedCell = null;
    gameWon = false;
  }

  bool isCorrect(int index, int symbol) {
    final row = index ~/ 6;
    final col = index % 6;

  
    for (int c = 0; c < 6; c++) {
      final otherIndex = row * 6 + c;

      if (otherIndex != index &&
          board[otherIndex] == symbol) {
        return false;
      }
    }

   
    for (int r = 0; r < 6; r++) {
      final otherIndex = r * 6 + col;

      if (otherIndex != index &&
          board[otherIndex] == symbol) {
        return false;
      }
    }

   
    final startRow = (row ~/ 3) * 3;
    final startCol = (col ~/ 2) * 2;

    for (int r = startRow; r < startRow + 3; r++) {
      for (int c = startCol; c < startCol + 2; c++) {
        final otherIndex = r * 6 + c;

        if (otherIndex != index &&
            board[otherIndex] == symbol) {
          return false;
        }
      }
    }

    return true;
  }

  bool isBoardCompleteAndValid() {
    for (int i = 0; i < board.length; i++) {
      if (board[i] == -1 ||
          !isCorrect(i, board[i])) {
        return false;
      }
    }

    return true;
  }

  void chooseSymbol(int symbol) {
    if (selectedCell == null || gameWon) return;

    final index = selectedCell!;

    if (fixedCells[index]) return;

    if (!isCorrect(index, symbol)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Not quite! Try another symbol. ✨'),
          duration: Duration(milliseconds: 900),
        ),
      );
      return;
    }

    setState(() {
      board[index] = symbol;
    });

    if (isBoardCompleteAndValid()) {
      setState(() {
        gameWon = true;
      });

      showWinDialog();
    }
  }

  void clearSelectedCell() {
    if (selectedCell == null || gameWon) return;

    final index = selectedCell!;

    if (fixedCells[index]) return;

    setState(() {
      board[index] = -1;
    });
  }

  void resetGame() {
    setState(_startBoard);
  }

  void showWinDialog() {
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 8, 8, 8),
          title: const Text(
            '✨ MAGIC SOLVED!',
            style: TextStyle(color: Colors.amber),
          ),
          content: const Text(
            'Amazing! You completed the ITC challenge.',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                resetGame();
              },
              child: const Text('PLAY AGAIN'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
                Navigator.pop(context);
              },
              child: const Text('HOME'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100D20),
      appBar: AppBar(
        title: const Text('ITC Magic Challenge'),
        backgroundColor: const Color(0xFF21183D),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 16),

            const Text(
              'Complete the Magic Grid!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'No repeats in any row, column, or block.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 12),

            Expanded(
              child: Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: GridView.builder(
                      physics:
                          const NeverScrollableScrollPhysics(),
                      itemCount: 36,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        crossAxisSpacing: 3,
                        mainAxisSpacing: 3,
                      ),
                      itemBuilder: (context, index) {
                        final value = board[index];
                        final selected =
                            selectedCell == index;
                        final fixed = fixedCells[index];

                        return GestureDetector(
                          onTap: () {
                            if (gameWon || fixed) return;

                            setState(() {
                              selectedCell = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(
                              milliseconds: 180,
                            ),
                            decoration: BoxDecoration(
                              color: selected
                                  ? const Color(0xFF7555C7)
                                  : fixed
                                      ? const Color(0xFF3B3155)
                                      : const Color(0xFF29223F),
                              borderRadius:
                                  BorderRadius.circular(8),
                              border: Border.all(
                                color: selected
                                    ? Colors.amber
                                    : Colors.white24,
                                width: selected ? 2 : 1,
                              ),
                            ),
                            child: Center(
                              child: value == -1
                                  ? const SizedBox.shrink()
                                  : Text(
                                      symbols[value],
                                      style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),

            const Text(
              'CHOOSE YOUR MAGIC SYMBOL',
              style: TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              children: List.generate(
                symbols.length,
                (symbol) {
                  return IconButton(
                    onPressed: () => chooseSymbol(symbol),
                    icon: Text(
                      symbols[symbol],
                      style: const TextStyle(fontSize: 28),
                    ),
                  );
                },
              ),
            ),

            TextButton.icon(
              onPressed: clearSelectedCell,
              icon: const Icon(Icons.backspace_outlined),
              label: const Text('Clear selected cell'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white70,
              ),
            ),

            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}