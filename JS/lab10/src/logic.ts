const MATRIX_SIZE = 9
const BOX_SIZE = 3
const COUNT = 40
type CellPosition = { row: number; col: number; }

export function generateSudoku(){
    const sudoku = createEmptyMatrix()
    resolveSudoku(sudoku)
    const fullMatrix = [...sudoku].map(row => [...row])
    const matrix = removeCells(sudoku)
    return {matrix, fullMatrix}
}

export function compareMatrices(currentMatrix: number[][], correctMatrix: number[][]): { rowIndex: number; colIndex: number }[] {
    const errorIndices: { rowIndex: number; colIndex: number }[] = [];
  
    for (let i = 0; i < currentMatrix.length; i++) {
      for (let j = 0; j < currentMatrix[i].length; j++) {
        if (currentMatrix[i][j] !== correctMatrix[i][j] && currentMatrix[i][j] !== 0) {
          errorIndices.push({ rowIndex: i, colIndex: j });
        }
      }
    }
  
    return errorIndices;
}

export function createEmptyMatrix(): number[][]{
    return Array.from({ length: MATRIX_SIZE }, () => new Array(MATRIX_SIZE).fill(0));
}

function resolveSudoku(matrix: number[][]): boolean {
    const emptyCell = findEmptyCell(matrix);
    if (!emptyCell) return true;

    const numbers: number[] = getRandNumbers();
    for (let i = 0; i < numbers.length; i++) {
        if (!validate(matrix, emptyCell.row, emptyCell.col, numbers[i])) continue;

        matrix[emptyCell.row][emptyCell.col] = numbers[i];

        if (resolveSudoku(matrix)) return true;
        matrix[emptyCell.row][emptyCell.col] = 0;
    }
    return false
}

export function findEmptyCell(matrix: number[][]): CellPosition | null {
    if (matrix && Array.isArray(matrix) && matrix.length > 0 && Array.isArray(matrix[0])) {
      const numRows = matrix.length;
      const numCols = matrix[0].length;
  
      for (let row = 0; row < numRows; row++) {
        for (let col = 0; col < numCols; col++) {
          if (matrix[row][col] === 0) {
            return { row, col };
          }
        }
      }
    }
  
    return null;
}

function getRandNumbers(): number[] {
    const numbers: number[] = [1, 2, 3, 4, 5, 6, 7, 8, 9];

    for (let i: number = numbers.length - 1; i >= 0; i--) {
        const randIndex: number = Math.floor(Math.random() * (i + 1));
        [numbers[i], numbers[randIndex]] = [numbers[randIndex], numbers[i]];
    }

    return numbers;
}

function validate(matrix: number[][], row: number, col: number, value: number): boolean{
    return isValidCol(matrix, row, col, value)
           && isValidRow(matrix, row, col, value)
           && isValidBox(matrix, row, col, value)
}

function isValidCol(matrix: number[][], row: number, col: number, value: number): boolean{
    for(let iRow = 0; iRow < MATRIX_SIZE; iRow++){
        if(matrix[iRow][col] === value && iRow !== row) return false 
    }
    return true
}

function isValidRow(matrix: number[][], row: number, col: number, value: number): boolean{
    for(let iCol = 0; iCol < MATRIX_SIZE; iCol++){
        if(matrix[row][iCol] === value && iCol !== col) return false 
    }
    return true
}

function isValidBox(matrix: number[][], row: number, col: number, value: number): boolean{
   const firstRowInBox = row - row % BOX_SIZE
   const firstColInBox = col - col % BOX_SIZE

   for(let iRow = firstRowInBox; iRow < firstRowInBox + BOX_SIZE; iRow++){
    for(let iCol = firstColInBox; iCol < firstColInBox + BOX_SIZE; iCol++){
        if(matrix[iRow][iCol] === value && iRow !== row && iCol !== col) return false
    }
   }

   return true
}

function removeCells(matrix: number[][]){
    const resultMatrix = [...matrix].map(row => [...row])

    let i = 0
    while(i < COUNT){
        const row = Math.floor(Math.random() * MATRIX_SIZE)
        const col = Math.floor(Math.random() * MATRIX_SIZE)

        if(resultMatrix[row][col] !== 0){
            resultMatrix[row][col] = 0
            i++
        }
    }
    return resultMatrix
}