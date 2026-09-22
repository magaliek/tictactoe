let title = "Tic Tac Toe"

let size = 3
var turnCount = 0
var turns: Int = 0
var row: Int = 0
var col: Int = 0
var isOver: Bool = false
let red = "\u{1B}[31m"

let lines = [
    [(0,0), (0,1), (0,2)],
    [(1,0), (1,1), (1,2)],
    [(2,0), (2,1), (2,2)],
    [(0,0), (1,1), (2,2)]
]

var board: [[String]] = Array(repeating: Array(repeating: ".", count: size), count: size)

@MainActor
func turnCountIncrement() {
    turnCount = (turnCount + 1) % 2
    turns += 1
}

print("\(title) - Turn \(turnCount)")

4
while (turns < size * size && !isOver) {
    for line in lines {
        let (row, col) = line[0]
        let first = board[row][col]
        if first != "." && line.allSatisfy({ board[$0.0][$0.1] == first }) {
            isOver = true
            print("\(first) wins!")
        } else if turns == size * size - 1 {
            isOver = true
            print("It's a draw!")
        }
    }

    for row in board {
        print(row.joined(separator: " "))
    }

    switch turnCount {
    case 0:
        print("X's turn")
    case 1:
        print("O's turn")
    default:
        print("\(red)Error: Invalid turn count")
    }

    print("Enter row (0-\(size - 1)):")
    guard let raw = readLine(), let rowInt = Int(raw), rowInt >= 0 && rowInt < size, board[rowInt][col] == "."
    else {
        print("\(red)Please enter a valid row (0-\(size - 1)):")
        continue
    }
    row = rowInt

    print("Enter column (0-\(size - 1)):")
    guard let raw = readLine(), let colInt = Int(raw), colInt >= 0 && colInt < size, board[row][colInt] == "."
    else {
        print("\(red)Please enter a valid column (0-\(size - 1)):")
        continue
    }
    col = colInt

    board[row][col] = turnCount == 0 ? "X" : "O"

    turnCountIncrement()
}

