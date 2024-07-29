function orderByRecommand() {
    let url = window.location.pathname;
    let command = url.substring(url.lastIndexOf('/') + 1); // "MAIN_1"
    
    console.log(url);
    console.log(command);

    $.ajax({
        data : {"command" : command }
    })
}


/* 

SELECT *
FROM CLASS
WHERE CATEGORY_CODE = "SUB_1"
ORDER BY CLASS_CREATE_DT

*/
