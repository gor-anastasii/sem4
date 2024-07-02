import React, { useEffect, useState } from "react";
import { createEmptyMatrix } from "../logic";

interface CellProp {
    value: number;
    rowIndex: number;
    colIndex: number;
    currentNum: number;
    onSelectNum: (value: number ) => void;
    errorCell: Array<{ rowIndex: number; colIndex: number }>;
    gameMatrix: number[][];
    rightCell: number;
    isRefresh: boolean;
    errorRow: number;
    errorCol: number;
    errorSquare: number;
    fullMatrix: number[][];
    onUpdateMatrix: () => void;
}

const Cell: React.FC<CellProp> = ({ value, rowIndex, colIndex, currentNum, onSelectNum, errorCell, gameMatrix, rightCell, isRefresh, errorRow, errorCol, errorSquare, fullMatrix, onUpdateMatrix }) => {
    const indexOfCell = {row: rowIndex, col: colIndex}
    const [matrix, setMatrix] = useState(createEmptyMatrix())
    const [errorCurrCell, setErrCurrCell] = useState(false)

    useEffect(() => {
        if (isRefresh) {
          setMatrix(createEmptyMatrix());
          setMatrix(gameMatrix.map(row => [...row]))
        }
    }, [isRefresh]);

    const setNumber = () => {
        if (currentNum !== 0) {
            gameMatrix[rowIndex][colIndex] = currentNum;
            setMatrix(gameMatrix.map(row => [...row]));
            onUpdateMatrix();
        } 
    };

    const clearCell = () => {
        gameMatrix[rowIndex][colIndex] = 0;
        setMatrix(gameMatrix.map(row => [...row]));
        setErrCurrCell(false)
        onSelectNum(0)
    };

    const cellStyle = {
        backgroundColor:
            colIndex === errorCol
            ? "#fa506f"
            : rowIndex === errorRow
            ? "#fa506f"
            : errorSquare !== -1 &&
            Math.floor(rowIndex / 3) * 3 + Math.floor(colIndex / 3) === errorSquare
            ? "#fa506f"
            : rightCell === 1
            ? "#fff45e"
            : "white",
    };

    return (
        <td style={cellStyle}>
            {value === 0 && !isRefresh ? (
                <p onClick={setNumber} onDoubleClick={clearCell}>
                    {matrix[rowIndex][colIndex] !== 0 ? matrix[rowIndex][colIndex] : ""}
                </p>
                ) : (
                <p>{isRefresh ? "" : value}</p>
                )
            }
        </td>
    );
};

export default Cell;