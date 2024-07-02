import React, { useState } from 'react';
import '../src/App.css';
import Button from './components/Button';
import Counter from './components/Counter';

function App(): JSX.Element {
  const [count, setCount] = useState<number>(0);

  const increaseCount = (): void => {
    setCount(count + 1);
  };

  const resetCount = (): void => {
    setCount(0);
  };

  return (
    <div className='container'>
      <div className='counter'>
        <Counter count={count} />
      </div>
      <div className='btns'>
        <Button title="Increase" func={increaseCount} disabled={count >= 5} />
        <Button title="Reset" func={resetCount} disabled={count === 0} />
      </div>
    </div>
  );
}

export default App;
