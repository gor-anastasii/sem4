import React from "react"
import './Card.css'

interface CardProp {
    id: number;
    image: string;
    title: string;
    year: number;
    category: string;
}

const Card: React.FC<CardProp> = ({ id, title, year, category, image }) => {
    return (
        <div className="card" key={id}>
            <img src={image} alt={title} />
            <div className="card-info">
                <p>{category}</p>
                <h3>{title}</h3>
                <p>Год выхода: {year}</p>
            </div> 
        </div>
    )
}

export default Card