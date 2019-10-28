<?
    class HC_common {
        
        function error($msg, $condition, $url=""){
            if($msg) {
                echo '<meta http-equiv="content-Type" content="text/html;charset=utf-8">';
    
                switch($condition) {
                    case "alert":
                        echo "<script type=\"text/javascript\">window.alert('$msg');</script>";
                    break;
                    case "previous":
                        echo "<script type=\"text/javascript\">window.alert('$msg');history.go(-1);</script>";
                    break;
                    case "reload":
                        echo "<script type=\"text/javascript\">window.alert('$msg');location.reload();</script>";
                    break;
                    case "close":
                        echo "<script type=\"text/javascript\">window.alert('$msg');window.close();</script>";
                    break;
                    case "goto_no_alert":
                        echo "<script type=\"text/javascript\">location.replace('$url');</script>";
                    break;
                    case "goto":
                        echo "<script type=\"text/javascript\">window.alert('$msg');location.replace('$url');</script>";
                    break;
                }
            }
        }
    
        #전체카운트, 페이지당 리스트(세로) 갯수, 페이지 바운드(가로 / 모바일=5, pc=10 설정), 현재페이지, 현재 uri
        function paging($total_count, $limit_count, $page_bound, $get_page, $request_uri) {
            $page_no = ($get_page>0)?$get_page-1:0; // 현재 페이지 번호 -1
            $limit_start_no = $limit_count * $page_no; // limit 시작번호
            $last_page = ceil($total_count/$limit_count);// 마지막 페이지 >>
            $page_start = floor($page_no/$page_bound)*$page_bound+1; // 페이징 시작 번호
            $prev = $page_start-1;// 이전페이지 <
            $next = ($last_page<$page_start+$page_bound)?$last_page+1:$page_start+$page_bound;// 다음페이지 >

            // &page 꼬리자르기
            $request_uri_explode = explode('&page',$request_uri);
            if (strpos($request_uri_explode[1],"=") !== false) {
                $text = $request_uri_explode[0];
            } else {
                $text = $request_uri;
            }

            if ($prev>0) {
                $nav.= "<li class='float_left list_num'><a href='".$text."&page=1'> << </a></li>";
                $nav.= "<li class='float_left list_num'><a href='".$text."&page=$prev'> < </a></li>";
            }
            for ($i=$page_start; $i < $next; $i++) {
                if($get_page==$i) {
                    $nav.= "<li class='float_left list_num'> $i </li>";
                } else {
                    $nav.= "<li class='float_left list_num'><a href='".$text."&page=$i'> $i </a></li>";
                }
            }
            if ($last_page>=$next) {
                $nav.= "<li class='float_left list_num'><a href='".$text."&page=$next'> > </a></li>";
                $nav.= "<li class='float_left list_num'><a href='".$text."&page=$last_page'> >> </a></li>";
            }

            return $nav;
        }
        function pagingg ($pageurl, $total_num, $pagesize, $pagePerBlock, $page, $search) {
            
            
            // $totalNumOfPage = ceil($total_num/$pagesize);
            // $totalNumOfBlock = ceil($totalNumOfPage/$pagePerBlock);
    
            // $startPage = ($currentBlock-1)*$pagePerBlock+1;
            // $endPage = $startPage+$pagePerBlock -1;
            // if($endPage > $totalNumOfPage) $endPage = $totalNumOfPage;
    
            // $isNext = false;
            // $isPrev = false;
    
            // if($currentBlock < $totalNumOfBlock)    $isNext = true;
            // if($currentBlock > 1 )                  $isPrev = true;
    
            // if ($totalNumOfBlock == 1) {
            //     $isNext = false;
            //     $isPrev = false;    
            // }
    
            // if($search) $search = "&".$search;
            // else $search='';
    
            // $nav = '<li><a href="'.$pageurl.'?page=1'.$search.'" class="btn-start"><img src="/Bimg//btn-paging-start.gif" art="첫 페이지로 이동"></a></li>';
    
            // if($isPrev) {
            //     $goPrevPage = $startpage-$pagePerBlock; //11page
            //     $nav .= '<li><a href="'.$pageurl.'?page='.$goPrevPage.$search.'" class="btn-prev"><img src=""Bing//btn-paging-prev.gif" alt="이전 페이지로 이동"></a></li>';
            // }
    
            // for ($i=$startPage; $i < $endPage; $i++) { 
                
            //     if ($i==$page) {
            //         $nav .= '<li><a class="btn-num current">'.$i.'</a></li>';
            //     } else {
            //         $nav .= '<li><a href="'.$pageurl.'?page='.$i.$search.'" class=btn-num">'.$i.'</a></li>';
            //     }
            // }
            
            // if ($isNext) {
            //     $goNextPage = $startPage + $pagePerBlock; //11page
            //     $nav .= '<li><a href="'.$pageurl.'?page='.$goNextPage.$search.'" class="btn-next"><img src=""Bing//btn-paging-next.gif" alt="다음 페이지로 이동"></a></li>';
            // }
            // $nav .= '<li><a href="'.$pageurl.'?page='.$totalNumOfPage.$search.'" class="btn-end"><img src=""Bing//btn-paging-end.gif" alt="마지막 페이지로 이동"></a></li>';
            // return
        }
    
        function Fileadd($new_num, $tablefile, $fileadd, $fileadd_name, $limitSize="20", $imgType="N") {
            global $ROOT_PATH;
    
            if ($imgType=="Y") {
                $temp = getimgagesize($fileadd); // 1=GIF, 2=JPG, 3=PNG
                if($temp[2]!='1' && $temp[2]!='2' && $temp[3]!='3'){
                    $this->error("GIF,JPG,PNG형식이 아닌것은 업로드가 불가능 합니다.","previous");
                    exit;
                }
            }
    
            if ($fileadd != "") {
                ## 이미지 크기를 구한다 ##
                $file_size_1 = filesize($fileadd);
    
                ### 이미지 파일 크기가 20M가 넘으면 등록 할 수 없다. ###
                if ((1024000 * $limitSize) < $file_size_1) {
                    $this->error( $limitSize."M 가 넘으면 등록할 수 없습니다.","previous","");
                }
    
                #### 파일의 확장자를 그대로 사용하기 위해서 확장자를 잘라서 변수에 넣는다 ####
                $fileadd_name_last_a = substr($fileadd_name,-6);
                $fileadd_name_last_b = explode(".",$fileadd_name_last_a);
                $fileadd_name_last_c = ".".$fileadd_name_last_b[1];
                $fileadd_name_last = $fileadd_name_last_c;
    
                ## 대문자는 소문자로 변환 ##
                $fileadd_name_1 = "$new_num"."$fileadd_name_last";
                $fileadd_org = $fileadd_name;
    
                ## 폴더 자동생성 ##
                if(!is_dir( $ROOT_PATH."/$tablefile")){ mkdir($ROOT_PATH."/tablefile",0707); }
    
                ### 큰 이미지에 저장한다. ###
                $savedir_1 = $ROOT_PATH."/$tablefile/$fileadd_name_1";
    
                if(!copy($fileadd,"$savedir_1")){
                    $this->error("첨부화일 등록에 실패하였습니다. 다시 등록해주세요","previous","");
                }
    
                return array("$fileadd_name_1","$file_size_1","$fileadd_org");
            }
        }
    
        function aes_encrypt($plaintext) {
            //문자열 암호화. AES-256과 HMAC을 사용
            $password = "a456789";
            
            //보안을 최대화하기 위해 비밀번호를 해싱한다.
            $password = hash('sha256', $password, true);
    
            //용량 절감과 보안 향상을 위해 평문을 압축한다.
            $plaintext = gzcompress($plaintext);
    
            //초기화 벡터를 생성한다.
            $iv_source = defined('MCRYPT_DEV_URANDOM') ? MCRYPT_DEV_URANDOM : MCRYPT_RAND;
            $iv = mcrypt_create_iv(32, $iv_source);
    
            //암호화한다.
            $ciphertext = mcrypt_encrypt('rijndael-256', $password, $plaintext, 'cbc', $iv);
    
            //위변조 방지를 위한 HMAC코드를 생성한다. (encrypt-then-MAC)
            $hmac = hash_hmac('sha256', $ciphertext, $password, true);
    
            //암호문, 초기화벡터, HMAC코드를 합하여 반환한다.
            return base64_decode($ciphertext.$iv.$hmac);
        }
    
        function aes_decrypt($ciphertext) {
            //문자열 복호화. 복호화 과정에서 오류가 나거나 위변조가 의심되는 경우 false를 반환한다.
            $password = "a456789";
    
            //초기화 벡터와 HMAC 코드를 암호문에서 분리하고 각각의 길이를 체크한다.
            $ciphertext = @base64_decode($ciphertext, true);
            if($ciphertext === false) return false;
            $len = strlen($ciphertext);
            if($len <64) return false;
            $iv = substr($ciphertext, $len-64, 32);
            $hmac = substr($ciphertext, $len-32, 32);
            $ciphertext = substr($ciphertext,0,$len-64);
    
            //암호화 함수와 같이 비밀번호를 해싱한다.
            $password = hash('sha256', $password, true);
            
            //HMAC 코드를 사용하여 위변조 여부를 체크한다.
            $hmac_check = hash_hmac('sha256', $ciphertext, $password, true);
            if($hmac !== $hmac_check) return false;
    
            //복호화한다.
            $plaintext = @mcrypt_decrypt('rijndael-256', $password, $ciphertext, 'cbc', $iv);
            if($plaintext === false) return false;
    
            //압축을 해제하여 평문을 얻는다.
            $plaintext = @gzuncompress($plaintext);
            if($plaintext === false) return false;
    
            //이상이 없는 경우 평문을 반환.
            return $plaintext;
        }
    }
    
    $common = new HC_common();


?>