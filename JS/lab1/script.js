const inputSurname = document.getElementById('surname'),
      inputName = document.getElementById('name'),
      inputEmail = document.getElementById('email'),
      inputTel = document.getElementById('tel'),
      inputInfo = document.getElementById('info'),
      flagSurname = document.getElementById('flag-surname'),
      flagName = document.getElementById('flag-name'),
      flagEmail = document.getElementById('flag-email'),
      flagTel = document.getElementById('flag-tel'),
      flagInfo = document.getElementById('flag-info'),
      select = document.getElementById('select'),
      checkbox = document.getElementById('check'),
      radio3 = document.getElementById('course3'),
      confirmFlag = document.getElementById('confirm'),
      btn = document.getElementById('form-btn')

const flagsArr = [flagSurname, flagName, flagEmail, flagTel, flagInfo, confirmFlag]
const inputsArr = [inputSurname, inputName, inputEmail, inputTel, inputInfo]
let flagCount = 0
let isGood = true

btn.addEventListener('click', (e) => {
    e.preventDefault()
    flagsArr.forEach((item) => {
        item.innerText = ''
    })
    isGood = true

    checkName(inputSurname.value, flagSurname)
    checkName(inputName.value, flagName)
    checkEmail(inputEmail.value, flagEmail)
    checkTel(inputTel.value, flagTel)
    checkInfo(inputInfo.value, flagInfo)
    if(isGood){
        if(!(select.options[0].selected && checkbox.checked && radio3.checked)){
            let confirmModal = confirm('Вы уверены в своём выборе?')
            if(confirmModal){
                flagsArr.forEach((item) => {
                    item.innerText = ''
                })
                inputsArr.forEach((item) => {
                    item.value = ''
                })
                confirmFlag.innerText = 'Данные отправлены на сервер'
            }
        } else {
            flagsArr.forEach((item) => {
                item.innerText = ''
            })
            inputsArr.forEach((item) => {
                item.value = ''
            })
            confirmFlag.innerText = 'Данные отправлены на сервер'
        }
    }
})

function checkName(word, flag){
    if(isEmpty(word)){
        flag.innerText = 'Поле не должно быть пустым'
        isGood = false
    }else if(word.length > 20){
        flag.innerText = 'Поле не должно превышать 20 символов'
        isGood = false
    }else if(!/^[A-Za-zА-Яа-я]+$/.test(word)){
        flag.innerText = 'Поле не должно содержать недопустимые символы'
        isGood = false
    }
}

function checkEmail(word, flag){
    if(isEmpty(word)){
        flag.innerText = 'Поле не должно быть пустым'
        isGood = false
    }else if(!/^[^\s@]+@[a-zA-Z]{2,5}\.[a-zA-Z]{2,3}$/.test(word)){
        flag.innerText = 'Поле не должно содержать недопустимые символы'
        isGood = false
    }
}

function checkTel(word, flag){
    if(isEmpty(word)){
        flag.innerText = 'Поле не должно быть пустым'
        isGood = false
    }else if(!/^\(0\d{2}\)\d{3}-\d{2}-\d{2}$/.test(word)){
        flag.innerText = 'Поле не должно содержать недопустимые символы'
        isGood = false
    }
}

function checkInfo(word, flag){
    if(isEmpty(word)){
        flag.innerText = 'Поле не должно быть пустым'
        isGood = false
    }else if(word.length > 250){
        flag.innerText = 'Поле не должно содержать больше 250 символов'
        isGood = false
    }
}

function isEmpty(word){
    return word.length <= 0 ? true : false
}