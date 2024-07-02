interface Rect{
    readonly id: string
    color?: string
    size: {
        width: number
        height: number
    }
}

const rect1: Rect = {
    id: '1234',
    size: {
        width: 20,
        height: 30
    },
    color: '#fff'
}

const rect2: Rect = {
    id: '3445',
    size: {
        width: 10,
        height: 3
    }
}

rect2.color = '#000'

const rect3 = {} as Rect
const rect4 = <Rect>{}

// ======================================

interface RectWithArea extends Rect{
    getArea: () => number
}

const rect5: RectWithArea = {
    id: '3467',
    size: {
        width: 15,
        height: 20
    },
    color: '#ff0000',
    getArea():number {
        return this.size.width * this.size.heigth
    }
}

//=======================================

interface IClock{
    time: Date
    setTime(date: Date): void
}

class Clock implements IClock{
    time: Date = new Date()
    setTime(date: Date): void {
        this.time = date
    }
}

//======================================
interface Styles{
    [key:string]: string
}

const css:Styles= {
    border: '1px solid black',
    marginTop: '2px',
    borderRadius: '5px',
}