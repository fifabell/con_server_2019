<? include "../include/head.html"?>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<?

    if(!$mid OR !$uname) {
        $common->error("데이터가 없습니다. 정상적으로 접근해 주세요.","previous","");
        exit;
    }
// un escape string
// https://dever.tistory.com/120
// https://www.w3resource.com/php/function-reference/mysqli_real_escape_string.php
    // $upw = array_map(mysql_escape_string($_POST['upw']));
    // $uname = array_map(mysql_escape_string($_POST['uname']));
     
    # 인젝션
    $mid = escape_string($_POST['mid'],1);
    $uname = escape_string($_POST['uname'],1);
    $upw = escape_string($_POST['upw'],1);
    
    $reg_date = date("Y-m-d H:i:s");
    $ip_addrs = getenv("REMOTE_ADDR");
    # 암호화처리
    // if($uptel) $uptel = $common->aes_encrypt($uptel);

    // echo $mid."<br>";
    // echo $uname."<br>";
    // echo $upw."<br>";

    $membercheck = member_check($mid);
    if($membercheck[midok]) {
        $common->error("$mid 는 중복된 아이디입니다. 확인 후 가입해 주세요.","previous","");
    } else {
        $query = "INSERT INTO tb_member (uid,mid,uname,upasswd,reg_date,ip_addrs) VALUES ('','$mid','$uname',password('$upw'),'$reg_date','$ip_addrs')";
        //echo $query."<br>";
        $result = $db->query($query);
    }
    
    # 로그인
    $query1 = "select uid,mid,uname from tb_member where mid='$mid' and upasswd=password('$upw')";
    
    $result1 = $db->row($query1);
    $uid        = $result1[uid];
    $memberMid  = $result1[mid];
    $uname      = $result1[uname];

    # 사용자 세션 설정
    $_SESSION["SITE_USER_UID"]      = $uid;
    $_SESSION["SITE_USER_MID"]      = $memberMid;
    $_SESSION["SITE_USER_NAME"]     = $uname;

    # 회원가입 완료 시 이메일 발송
    // $title = "회원가입을 축하드립니다.";
    // ob_start();
    // include_once ($_SERVER[DOCUMENT_ROOT]."/mail/mail_1.html");
    // $send = ob_get_contents();
    // ob_end_clean();
    // MAILsend($mid,$uname,$title,$send,"N");

    # 회원가입 완료 시 SMS 발송
    // if($uptel_info) {
    //     $send = "[${SiteName}] 안녕하세요. ${uname}님 회원가입을 축하드립니다. 가입하신 아이디는 ${mid} 입니다. 감사합니다.";
    //     $sms_phone    = $uptel_info.";";   #받은사람 
    //     $sms_msg    = $send;         # 발송 메세지
    //     $sms_sendtel = $admin_tel;      #보내는 사람
    //     include $_SERVER['DOCUMENT_ROOT']."/INC/sms.php";         
    // }

    if( $result != "1" ){
        $common->error("회원 등록이 실패 되었습니다.","previous","");
    } else {
        $common->error("회원가입이 완료 되었습니다.","goto","/");
    }
            

?>