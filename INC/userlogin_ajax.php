<?
include_once ($_SERVER[DOCUMENT_ROOT]."/INC/get_session.php");
include_once ($_SERVER[DOCUMENT_ROOT]."/INC/Function.php");
include_once ($_SERVER[DOCUMENT_ROOT]."/INC/dbConn.php");
include_once ($_SERVER[DOCUMENT_ROOT]."/INC/func_other.php");

$code = 0;
$data = "";
//echo $reg_date = date('Y-m-d H:i:s');

$mode = $_POST['mode'];
switch ($mode) {
    case 'logout':
        $logout_mid = $_POST['logout_mid'];
        if($logout_mid) {
            $query1 = "select mid from tb_member where mid='$logout_mid'";
            $result1 = $db->query($query1);
            if($result1) {
                # 사용자 세션 초기화
                $_SESSION["SITE_USER_UID"]      = "";       // 회원일련번호
                $_SESSION["SITE_USER_MID"]      = "";       // 회원아이디
                $_SESSION["SITE_USER_NAME"]     = "";       // 회원이름

                #쿠키 초기화
                setcookie("KEEPSAVE", "", time(), "/");

                $data = "logout";
                $code = 1;
            }
        }
        exit(json_encode(array('code' => $code, 'msg' => $data)));
    break;

    case 'login':
        $val01 = trim($_POST['v1']);
        $val02 = trim(base64_decode($_POST['v2']));
        $save_email = trim($_POST['v3']);
        $save_month = trim($_POST['v4']);

        // 로그인
        $query1 = "select uid,mid,uname,password(mid) as p_mid from tb_member where mid='$val01' and upasswd=password('$val02')";
        $result1 = $db->row($query1);
        
        $uid = $result1[uid];
        $memberMid = $result1[mid];
        $uname = $result1[uname];

        // $memberMid_lock = md5($memberMid);

        if(empty($memberMid)){
            $data = "NotUser";
        } else {
            # 로그인 시간 업데이트
            $que = "UPDATE tb_member SET logindate='$reg_date' where mid ='$memberMid'";
            $result = $db->query($que);

            # 사용자 세션 생성
            $_SESSION["SITE_USER_UID"]      = $uid;         // 회원일련번호
            $_SESSION["SITE_USER_MID"]      = $memberMid;   // 회원아이디
            $_SESSION["SITE_USER_NAME"]     = $uname;       // 회원이름

            $_SESSION["user_time"] = time();
            $data = "login";

            if($save_email=="Y") {
                setcookie("IDSAVE", $memberMid, 0 , "/");
            } else {
                $_SESSION["IDSAVE"] = "";   // 아이디저장
            }
            
            if($save_month=="Y") {
                setcookie("KEEPSAVE", $result1[p_mid], time() + ( 3600 * 24 * 30 ), "/");
            } else {
                $_SESSION["KEEPSAVE"] = "";   // 아이디저장
            }

            $code = 1;
        }

        exit(json_encode(array('code' => $code, 'msg' => $data)));
    break;
    
}

?>