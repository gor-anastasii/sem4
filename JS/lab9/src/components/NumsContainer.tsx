import React from "react";
import NumButton from "./NumButton";

interface NumsContainerProps {
    onSelectNum: (value: number) => void;
    currentNum: number;
}

const NumsContainer: React.FC<NumsContainerProps> = ({ onSelectNum, currentNum }) => {
    return (
        <div className="nums-container">
            {[1, 2, 3, 4, 5, 6, 7, 8, 9].map((num) => (
                <NumButton
                    key={num}
                    value={num}
                    onSelectNum={onSelectNum}
                    selected={currentNum === num}
                />
            ))}
        </div>
    );
};

export default NumsContainer;