var rect1 = {
    id: '1234',
    size: {
        width: 20,
        height: 30
    },
    color: '#fff'
};
var rect2 = {
    id: '3445',
    size: {
        width: 10,
        height: 3
    }
};
rect2.color = '#000';
var rect3 = {};
var rect4 = {};
var rect5 = {
    id: '3467',
    size: {
        width: 15,
        height: 20
    },
    color: '#ff0000',
    getArea: function () {
        return this.size.width * this.size.heigth;
    }
};
var Clock = /** @class */ (function () {
    function Clock() {
        this.time = new Date();
    }
    Clock.prototype.setTime = function (date) {
        this.time = date;
    };
    return Clock;
}());
var css = {
    border: '1px solid black',
    marginTop: '2px',
    borderRadius: '5px',
};
