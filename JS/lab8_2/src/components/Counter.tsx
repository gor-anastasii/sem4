import React from "react";

interface CounterProps {
  count: number;
}

const Counter: React.FC<CounterProps> = (props) => {
  return <p>{props.count}</p>;
}

export default Counter;