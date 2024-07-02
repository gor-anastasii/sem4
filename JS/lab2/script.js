const height = document.getElementById('input-height'),
      width = document.getElementById('input-width'),
      diameter = document.getElementById('input-diameter'),
      saveBtn = document.getElementById('save-btn'),
      result = document.getElementById('result'),
      resultText = document.getElementById('result-text'),
      restart = document.getElementById('restart-btn'),
      ball = document.getElementById('ball'),
      rects = document.querySelectorAll('.rect')

const inputsArr = [height, width, diameter]
let isGood = true
let animationInProgress = false
let rectWidth = 250
let count = 0

saveBtn.addEventListener('click', () => {
    isGood = true
    checkInputs(inputsArr)

    if(isGood){
        rectWidth = +width.value

        rects.forEach( item => {
            item.style.borderBottom = `${height.value}px solid rgb(158, 77, 179)`
            item.style.width = `${rectWidth}px`
            item.style.borderLeft = `${diameter.value}px solid transparent`
            item.style.borderRight = `${diameter.value}px solid transparent`
        })
        renderBall()

        inputsArr.forEach( input => {
            input.value = ''
        })
    }

})

function checkInputs(arr){
    arr.forEach( item => {
        if(item.value <= 0 || !/\d/g.test(item.value) || item.value > 300){
            isGood = false
            alert("Введите корректные данные.")
        }
    })
}

rects.forEach((rect, index) => {
    rect.addEventListener('click', () => {
      const randNum = renderBall()
      if (!animationInProgress) {

        animationInProgress = true
        rect.style.transform = 'translateY(-150px)'

        if(index === randNum - 1){
            count++
            result.innerText = count

            resultText.style.color = '#81c45a'
            resultText.innerText = 'Верно!'
        } else {
            resultText.style.color = '#ec4141'
            resultText.innerText = 'Неверно!'
        }

        setTimeout(() => {
          rect.style.transform = 'translateY(0px)'
          animationInProgress = false
        }, 1000);
      }
    });
});

function renderBall(){
    const random = Math.floor(Math.random() * 3) + 1;
    const positionBall = random == 1 ?  1020-rectWidth*3-120 + rectWidth/2 :
                         random == 2 ?  1020-rectWidth*3-120 + rectWidth/2 + rectWidth + 60 :
                         1020-rectWidth*3-120 + rectWidth/2 + rectWidth*2 + 120

    console.log(positionBall)

    ball.style.left = `${positionBall}px`
    return random
}

restart.addEventListener('click', () => {
    count = 0 
    result.innerText = 0

    rects.forEach( item => {
        item.style.borderBottom = `150px solid rgb(158, 77, 179)`
        item.style.width = `250px`
        item.style.borderLeft = `60px solid transparent`
        item.style.borderRight = `60px solid transparent`
    })

    resultText.style.color = '#8f8f8f'
    resultText.innerText = 'Неверно!'

})