function strip(x: string | number){
    if(typeof x === 'number'){
        return x.toFixed(2)
    }
    return x.trim()
}

class MyResponse {
    header = 'response header'
    result = 'response result'
}

class MyError {
    header = 'error header'
    mess = 'error message'
}

function handle(res: MyResponse | MyError){
    if(res instanceof MyResponse){
        return {
            info: res.header + res.result
        }
    } else {
        return {
            info: res.header + res.mess
        }
    }
}

//=======================================

type AlertType = 'success' | 'danger' | 'warning'

function setAlertType(type: AlertType){
    //...
}

setAlertType('success')
// setAlertType('default')