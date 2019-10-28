<?
session_start();
//print_r($_SESSION); //세션 남아있는지 확인

// if(!$_SESSION['Session_ID']){
//     // md5(rand()) => 랜덤 해시 생성
//     $Session_ID = md5(rand());
//     $_SESSION['Session_ID'] = $Session_ID;
// }

// define(A,B) => A를 B로 정의
define('ROOT', $_SERVER['DOCUMENT_ROOT']);

// 재접속 후 쿠키는 남아있어도 세션은 초기화됐기 때문에, 세션을 재구성해준다.

if($_COOKIE[KEEPSAVE] && !$_SESSION['SITE_USER_MID']) {
    $query1 = "select uid, mid, uname from tb_member where password(mid)='$_COOKIE[KEEPSAVE]'";
    $result1 = $db->row( $query1 );
    $uid        = $result1[uid];
    $memberMid  = $result1[mid];
    $uname      = $result1[uname];
    
    if(empty($memberMid)) {
        $code = 0;
        $data = "NotUser";
    } else {
        $reg_date = date('Y-m-d H:i:s');

        # 로그인 시간 업데이트
        $que = "UPDATE tb_member SET logindate='$reg_date' WHERE mid='$memberMid'";
        $result = $db->query($que);

        # 세션생성
        $_SESSION["SITE_USER_UID"]  = $uid;
        $_SESSION["SITE_USER_MID"]  = $memberMid;
        $_SESSION["SITE_USER_NAME"] = $uname;

        $_SESSION["user_time"]      = time();

        $code = 1;
        $data = "login";
    }
}

$SITE_USER_UID       = $_SESSION['SITE_USER_UID'];  // 회원일련번호
$SITE_USER_MID       = $_SESSION['SITE_USER_MID'];  // 회원아이디
$SITE_USER_NAME      = $_SESSION['SITE_USER_NAME']; // 회원이름
?>