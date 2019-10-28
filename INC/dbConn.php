<?
    ##서버정보
    $dbCon['dbHost'] = 'localhost';
    $dbCon['dbUid']  = 'fifabell01';
    $dbCon['dbPw']   = '6229';
    $dbCon['db']     = 'db'; //db명
    $dbCon['charset']= 'utf-8';
//    $SiteName = '감자';

class mydb {
    private $host;
    private $user;
    private $pw;
    private $db;

    function __construct($dbCon){
        $this->host = $dbCon['dbHost'];
        $this->user = $dbCon['dbUid'];
        $this->pw = $dbCon['dbPw'];
        $this->db = $dbCon['db'];
    }

    function __destruct() {
        $this->db_close();
    }

    function connect() {
        try {
            $this->mysqli = new mysqli($this->host, $this->user, $this->pw, $this->db);
            //echo "connect!<br>";
            if (!$this->mysqli) {
                throw new Exception("Could not connect to the MYSQL server.");
            }
            else {
                if($dbCon['charset']) $this->mysqli->set_charset($dbCon['charset']);
            }
        } catch (Exception $con_error) {
            echo($con_error->getMessage());
        }
    }

    function query($query) {
        $this->connect();
        $this->rs = @mysqli_query($this->mysqli,$query);
        if($this->rs)
            return $this->rs;
        else
            echo mysqli_error($this->mysqli);
    }

    function fetch_array($query) {
        $this->connect();
        $this->rs = @mysqli_query($this->mysqli,$query);
        $tempArray = array();
        $i=0;
        while( $data = @mysqli_fetch_array($this->rs )){
            $tempArray[$i] = $data;
            $i++;
        }
        return $tempArray;
    }

    function count($query) {
        $this->connect();
        $this->rs = @mysqli_query($this->mysqli,$query);
        $row = @mysqli_num_rows($this->rs);
        return $row;
    }

    function row($query) {
        $this->connect();
        $this->rs = @mysqli_query($this->mysqli,$query);
        $row = @mysqli_fetch_array($this->rs);
        return $row;
    }

    // 한개 지정해서 뽑기
    function select_one($query) {
        $this->connect();
        $this->rs = @mysqli_query($this->mysqli,$query);
        $row = $this->rs->fetch_row();
        return $row[0];
    }
    
    // 줄로 뽑기
    function fetch_row($query) {
        $this->connect();
        $this->rs = @mysqli_query($this->mysqli,$query);
        $row = @mysqli_fetch_row($this->rs);
        return $row;
    }

    function db_close() {
        if ($this->rs) {
            @mysqli_free_result( $this->rs );
        }
        if ($this->mysqli){
            @mysqli_close();
        }
    }
}
$db = new mydb($dbCon);

function escape_string ($filter,$chk_trim="0"){
    GLOBAL $dbCon;
    if($chk_trim==1){
        $filter = trim($filter);
    }
    $link = mysqli_connect($dbCon['dbHost'], $dbCon['dbUid'], $dbCon['dbPw'], $dbCon['db']);
    $filter = mysqli_real_escape_string($link, $filter);
    return $filter;
}

?>