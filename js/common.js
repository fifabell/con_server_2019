function section_call(get_pointer){
    // choose and display
    var get_type = get_pointer.dataset.type;
    var section_length = document.getElementsByClassName("section").length;
    // if(!($(get_pointer).hasClass("on"))){
    //     $(".section").removeClass("on");
    //     get_pointer.classList.add("on");
    // }
    for(var i=1; i<=section_length; i++){
        document.getElementById("section"+i).style.display="none";
    }
    document.getElementById(get_type).style.display="block";

    // child_display toggle
    if(!(document.getElementsByClassName(get_type)[0])){
        
    } else {
        get_child_display = document.getElementsByClassName(get_type)[0].getAttribute("style");
        if(get_child_display=="display:block"){
            document.getElementsByClassName(get_type)[0].setAttribute("style","display:none");
        } else {
            document.getElementsByClassName(get_type)[0].setAttribute("style","display:block");
        }
    }
}

function nav_btn_off_function() {
    $(document).find(".overlay").css("display","none");
    $("#left").removeClass("mobile");
    $("#nav_btn_off").removeClass("mobile");
    $("#nav_btn_open").css("display","block");
}

function nav_btn_open_function() {
    $(document).find(".overlay").css("display","block");
    $("#nav_btn_open").css("display","none");
    $("#left").addClass("mobile");
    $("#nav_btn_off").addClass("mobile");
}

$(document).ready(function(){
    $("#logout").click(function(){
        var logout_mid = $("#logout_mid").val();
        $.ajax({
            type : "POST"
            , url : "/INC/userlogin_ajax.php"
            , dataType : "JSON"
            , data : "mode=logout&logout_mid="+logout_mid
            , success : function(res){
                if(res.code!="0") {
                    location.href = "/main/main.html";
                } else {
                    alert("로그아웃 실패!");
                    return false;
                }
            }
        });
    });
});