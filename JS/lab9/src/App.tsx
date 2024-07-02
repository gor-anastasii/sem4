import React, { useState } from 'react';
import './App.css';
import Table from './components/Table';
import Button from './components/Button';
import NumsContainer from './components/NumsContainer';
import { generateSudoku, compareMatrices, createEmptyMatrix } from './logic';

function App() {
  const [currentNum, setCurrentNum] = useState<number>(0)
  const [errorCell, setErrorCell] = useState<Array<{ rowIndex: number; colIndex: number }>>([])
  const [rightCell, setRightCell] = useState<1|0>(0)
  const [startMatrix, setStartMatrix] = useState<number[][]>([])
  const [fullStartMatrix, setFullStartMatrix] = useState<number[][]>([])
  const [startGameMatrix, setGameStartMatrix] = useState<number[][]>([])
  const [isRefresh, setIsRefresh] = useState<boolean>(false)
  const [errorRow, setErrorRow] = useState<number>(-1);
  const [errorColumn, setErrorColumn] = useState<number>(-1);
  const [errorSquare, setErrorSquare] = useState<number>(-1);

  const resetGame = () => {
    setIsRefresh(true)
    setStartMatrix(createEmptyMatrix());
    setFullStartMatrix(createEmptyMatrix());
    setGameStartMatrix(createEmptyMatrix());
    setErrorCell([]);
  };

  const newGame = () => {
    resetGame()
    const { matrix, fullMatrix } = generateSudoku();
    setStartMatrix(matrix.map(row => [...row]));
    setFullStartMatrix(fullMatrix.map(row => [...row]));
    setGameStartMatrix(matrix.map(row => [...row]));
    setErrorCell([]);
    setIsRefresh(false)
    console.table(fullMatrix);
  };

  const handleCheckMatrix = () => {
    const errorIndices = compareMatrices(startGameMatrix, fullStartMatrix);
    console.log(errorIndices);

    if (errorIndices.length > 0) {
      const {rowIndex, colIndex} = errorIndices[0];
      setErrorRow(rowIndex);
      setErrorColumn(colIndex);

      const squareSize = Math.sqrt(startGameMatrix.length);
      const squareRowIndex = Math.floor(rowIndex / squareSize);
      const squareColIndex = Math.floor(colIndex / squareSize);
      const errorSquareIndex = squareRowIndex * squareSize + squareColIndex;
      setErrorSquare(errorSquareIndex);
    } else {
      setRightCell(1)
      setErrorRow(-1);
      setErrorColumn(-1);
      setErrorSquare(-1);
    }

    setTimeout(() => {
      setRightCell(0)
      setErrorRow(-1);
      setErrorColumn(-1);
      setErrorSquare(-1);
    }, 2000)
  };

  const handleSelectNum = (value: number) => {
    setCurrentNum(value);
  }

  return (
    <div className='wrapper'>
      <Button title="Новая игра" className='' func={newGame} />

      <Table matrix={startMatrix} 
             gameMatrix={startGameMatrix} 
             currentNum={currentNum} 
             onSelectNum={handleSelectNum} 
             errorCell={errorCell}
             rightCell={rightCell}
             isRefresh={isRefresh}
             errorRow={errorRow}
             errorCol={errorColumn}
             errorSquare={errorSquare}
      />

      <NumsContainer currentNum={currentNum} onSelectNum={handleSelectNum}/>
      <Button title="Проверить" className='check-btn' func={handleCheckMatrix} />
    </div>
  );
}

export default App;
