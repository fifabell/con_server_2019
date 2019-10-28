<?
#id중복확인
function member_check($mid) {
    global $db;
    $mid_1 = $mid;
    
    $query1 = "select mid from tb_member where mid = '$mid_1'";
    $mid1 = $db->select_one($query1);
    $row[midok] = false;

    $row[mid1] = $mid1;

    ##중복된 아이디 있으면 true 보낸다##
    if($row[mid1]) {
        $row[midok] = true;
    }

    return $row;
}

# 메일발송
function Mailsend($uemail,$uname,$title,$content,$frame="Y") {

    global $HOME_PATH;
    global $admin_email;
    global $SiteName;
    global $admin_email;
 
    ################### 메일 발송
    $today = date("Y년 m월 d일 H시 i분");
 
     if ($frame == "Y") {
         ob_start();
         include($_SERVER[DOCUMENT_ROOT]."/mail/mail_basic.html");
         $send = ob_get_contents();
         ob_end_clean();
         $body = $send;
     } else {
         $body = $content;
     }
    $from_email = $admin_email;
 
    //echo "$body";
    $title = '=?UTF-8?B?'.base64_encode($title).'?=';
    $uname = '=?UTF-8?B?'.base64_encode($uname).'?=';
    $uname1 = '=?UTF-8?B?'.base64_encode($SiteName).'?=';
 
 
    $to_email=$uemail;
    $from_email=$admin_email;
    $subject="$title";
    $mailheaders .= "Return-Path: $from_email\r\n";
    $mailheaders .= "From: $uname1 <$from_email>\r\n";
    $mailheaders .= "Content-Type:text/html; charset=utf-8\r\n";
 
 
    mail($to_email,$subject,$body,$mailheaders);
 
    //return $body;
 }
?>