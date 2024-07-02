import React from "react";
import Row from "./Row";

interface TableProps {
    matrix: number[][];
    gameMatrix: number[][];
    currentNum: number ;
    onSelectNum: (value: number) => void;
    errorCell: Array<{ rowIndex: number; colIndex: number }>;
    rightCell: number;
    isRefresh: boolean;
    errorRow: number;
    errorCol: number;
    errorSquare: number;
    fullMatrix: number[][];
    onUpdateMatrix: () => void;
}

const Table: React.FC<TableProps> = ({ matrix, gameMatrix, currentNum, onSelectNum, errorCell, rightCell, isRefresh, errorRow, errorCol, errorSquare, fullMatrix, onUpdateMatrix }) => {
    return (
        <table >
            {matrix.map((row, index) => {
                return (
                    <Row
                        rowIndex={index}
                        key={index}
                        numbers={row}
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
        </table>
    );
};

export default Table;
