$(function () {
    name_error = false;
    pwd_error = false;

    $('.name_input').blur(function () {
        checkUser()
    });

    $('.pass_input').blur(function () {
        checkPwd()
    });

    // if ({{error_name}}==1){
    //     $('.user_error').html('用户名错误').show();
    // }
    //
    // if({{error_pwd}}==1){
    //     $('.pwd_error').html('密码错误').show();
    // }

});

function checkUser() {
    if ($('.name_input').val().length==0){
        $('.user_error').html('请填写用户名').show();
        name_error=false;
    }else{
        $('.user_error').hide();
        name_error=true;
    }
}

function checkPwd() {
    if ($('.pass_input').val().length==0){
        $('.pwd_error').html('请输入密码').show();
        pwd_error=false;
    }else{
        $('.pwd_error').hide();
        pwd_error=true;
    }
}

$('#form').submit(function () {
    checkUser();
    checkPwd();

    if(error_pass==false && error_user==false){
        return true;
    }
    else {
        return false;
    }

});