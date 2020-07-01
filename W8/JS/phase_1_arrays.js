Array.prototype.uniq = function() {
    let result = [];
    for (let i = 0; i < this.length; i++){
        let ele = this[i]
        if (!result.includes (ele)) {
            result.push(ele);
        }

    }
    return result;
}


Array.prototype.print = function () {
    console.log("Hello");
}


Array.prototype.twosum = function() {
    let pairs = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i + 1; j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                pairs.push([i,j]);
            }
        }
    }
    return pairs;
}

//[
    //[1, 2, 3]
    //[4, 5, 6]
    //[7, 8, 9]

Array.prototype.transpose = function() {
    let result = [];
    
    for (let i = 0; i < this.length; i++) {
        let temparray = [];
        this.forEach(subarray => {
            temparray.push(subarray[i]);
        })  
        result.push(temparray);
    }
    return result;
}
//[1,2,3]
Array.prototype.myEach = function(callback) {
    
    for (let i = 0; i < this.length; i++) {
        callback(this[i])  //fucntion(number) --->  
    }
}

Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        callback(this[i])
    }
}

Array.prototype.myMap = function(operation) {
    let result = [];
    let myEachCallback = function(ele) {

    }
}

Array.prototype.myMap = function(operation) { //This should be the operation that the user wants to perform on each iterati
   
    let result = [];

    let myEachCallBack = function(ele) {
        result.push(operation(ele));
   }
    this.myEach(myEachCallBack);
    return result;

}

Array.prototype.myReduce = function(callback, initialValue) {

    let result = [];
    let myInjectCallback = function(ele) {
        
        result = 
    }
    if (initialValue === true) {
        result.push(initialValue);
        for (let i = 1; i < this.length; i++) {
            this.myEach(callback);
        }
    } else {
        for (let i = 0; i < this.length; i++) {
            this.myEach(callback);
        }

    }



}

// Array.prototype.myMap = function (myMapCallBack) {
//     let newArr = [];
//     let myEachCallBack = function (ele) {
//         newArr.push(myMapCallBack(ele));
//     }
//     this.myEach(myEachCallBack);
//     return newArr;
// }

// myEach
// [1, 2, 3].myEach(function (num) {
//     console.log(num * 3)
// })
