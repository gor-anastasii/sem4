import React, {useState} from "react";
import Cell from "./Cell";

interface RowProp {
    rowIndex: number;
    numbers: number[];
    currentNum: number;
    onSelectNum: (value: number) => void;
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

const Row: React.FC<RowProp> = ({ rowIndex, numbers, currentNum, onSelectNum, errorCell, gameMatrix, rightCell, isRefresh, errorRow, errorCol, errorSquare, fullMatrix, onUpdateMatrix}) => {
    
    const rowStyle = {
        backgroundColor: rowIndex === errorRow ? "#fa506f" : "transparent",
    }

    return (
        <tr style={rowStyle}>
            {numbers.map((cell, colIndex) => {
                return (
                    <Cell
                        value={cell}
                        key={colIndex}
                        rowIndex={rowIndex}
                        colIndex={colIndex}
                        currentNum={currentNum}
                        onSelectNum={onSelectNum}
                        errorCell={errorCell}
                        gameMatrix={gameMatrix}
                        rightCell={rightCell}
                        isRefresh={isRefresh}
                        errorRow={errorRow}
                        errorCol={errorCol}
                        errorSquare={errorSquare}
                        fullMatrix={fullMatrix}
                        onUpdateMatrix={onUpdateMatrix}
                    />
                );
            })}
        </tr>
    );
};

export default Row;
