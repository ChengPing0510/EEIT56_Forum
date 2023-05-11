function Jquerry(selecton) {//selecton可能是#id,也可能是其他選擇器

    if (typeof selecton == "string") {
        if (selecton.charAt(0) == "#") {
            //selecton是一個id選擇器
            domObj = document.getElementById(selecton.substring(1))
            //return domObj
            return new Jquerry()
        }
    }
    if (typeof selecton == "function") {
        window.onload = selecton
    }
    this.html = function (htmlStr) {
        domObj.innerHTML = htmlStr
    }
    this.click = function (fun) {
        domObj.onclick = fun
    }
    this.focus = function (fun) {
        domObj.onfocus = fun
    }
    this.blur = function (fun) {
        domObj.onblur = fun
    }
    this.change = function (fun) {
        domObj.onchange = fun
    }
    this.val = function (v) {
        if (v == undefined) {
            return domObj.value
        } else {
            domObj.value = v
        }
    }
    // 靜態方法，發送ajax請求


    Jquerry.ajax = function (jsonArgs) {
        let xhr = new XMLHttpRequest()
        xhr.onreadystatechange = function () {
            if (this.readyState == 4) {
                if (this.status == 200) {
                    let jsonObj = JSON.parse(this.responseText)
                    //調用函數
                    jsonArgs.success(jsonObj)
                }
            }

        }

        if (jsonArgs.type.toUpperCase() == "POST") {
            xhr.open("POST", jsonArgs.url, jsonArgs.async)
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
            xhr.send(jsonArgs.data)
        }
        if (jsonArgs.type.toUpperCase() == "GET") {
            xhr.open("GET", url + "?" + data, jsonArgs.async)
            xhr.send()
        }



        // 調用jQuery的工具類中的ajax方法來發送ajax請求
    }
}



$ = Jquerry
//執行這個目的是為了讓靜態方法ajax生效
new Jquerry()