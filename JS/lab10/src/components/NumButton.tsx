import React from "react";

interface NumBtnProp {
    value: number;
    onSelectNum: (value: number) => void;
    selected: boolean;
}

const NumButton: React.FC<NumBtnProp> = (props) => {
    const handleClick = () => {
        props.onSelectNum(props.value);
    };

    const handleDoubleClick = () => {
        props.onSelectNum(0);
    };

    return (
        <button
            onClick={handleClick}
            onDoubleClick={handleDoubleClick}
            className={props.selected ? 'active-btn' : ''}
        >
            {props.value}
        </button>
    );
};

export default NumButton;