import React from "react";

interface BtnProps {
    title: string,
    className: string,
    func: () => void
}

const Button : React.FC<BtnProps> = (props) => {
    return (
        <button className={props.className} onClick={props.func}>{props.title}</button>
    )
}

export default Button