-- MySQL dump 10.16  Distrib 10.1.41-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	10.1.41-MariaDB-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_board`
--

DROP TABLE IF EXISTS `tb_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_board` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` mediumtext NOT NULL,
  `user` varchar(30) NOT NULL,
  `reg_date` varchar(25) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_board`
--

LOCK TABLES `tb_board` WRITE;
/*!40000 ALTER TABLE `tb_board` DISABLE KEYS */;
INSERT INTO `tb_board` VALUES (26,'aws','아마존 크라우드를 이용한 서버생성','1. 아마존 접속<br />\r\n<a href=\"https://aws.amazon.com/ko/#\">https://aws.amazon.com/ko/#</a><br />\r\n<br />\r\n2. 서비스 -&gt; ec2 -&gt; 인스턴스 생성<br />\r\n<br />\r\n3. 원하는 OS 선택 -&gt; 넘기다가 -&gt; 새 키 페어 생성 -&gt; 키페어 다운로드 -&gt; 인스턴스 시작<br />\r\n<br />\r\n4. 자동으로 생성 및 활성화가 됨. 끝.<br />\r\n<br />\r\n* 다운로드 받은 키페어의 형식은 .pem<br />\r\nssh 접속시 .ppk 파일이 필요.[[자세한 설명은 다음 글에]]<br />\r\n&nbsp;','test01','2019-10-25 15:24:19'),(27,'aws','보안그룹 관리','★보안그룹을 관리해야하는 이유 : ssh, ftp, http, https 접속 및 접근 시 amazon에서 열어줘야 함★<br />\r\n<br />\r\n1. 네트워크 및 보안 -&gt; 보안그룹<br />\r\n<br />\r\n2. 내가 생성한 인스턴스와 연결된 보안그룹을 찾아서 클릭<br />\r\n<br />\r\n3. 하단에 설명 옆 인바운드 클릭<br />\r\n<br />\r\n4. 편집을 눌러 규칙추가 - 보통은 아래와 같이 해주면 끝.<br />\r\n<br />\r\n<img alt=\"\" src=\"/ckeditor/upload/2019/small_1571985510.2512.png\" /><img alt=\"\" src=\"/ckeditor/upload/2019/1571985638.9996.png\" />','test01','2019-10-25 15:43:15'),(28,'php','썸네일만들때 주의사항','보통 루트는 다음과 같다.<br />\r\n파일 크기 확인 -&gt; 파일 형식 일치여부 -&gt; 파일 크기 제한 -&gt; 제한된 파일크기로 리사이징<br />\r\n<br />\r\n마지막 단계인 리사이징에 주의가 필요하다.<br />\r\nimagepng<br />\r\nimagejpeg<br />\r\nimagegif<br />\r\n<br />\r\n★ 보통 세 개의 함수를 사용하게 되는데, 각각의 인수와 인수의 범위가 다 다르다.<br />\r\nbool&nbsp;<strong>imagegif</strong>&nbsp;(&nbsp;resource&nbsp;<code>$image</code>&nbsp;[,&nbsp;string&nbsp;<code>$filename</code>&nbsp;] )<br />\r\nbool&nbsp;<strong>imagepng</strong>&nbsp;(&nbsp;resource&nbsp;<code>$image</code>&nbsp;[,&nbsp;string&nbsp;<code>$filename</code>&nbsp;[,&nbsp;int&nbsp;<code>$quality</code>&nbsp;[,&nbsp;int&nbsp;<code>$filters</code>&nbsp;]]] )<br />\r\n&nbsp; =&gt;&nbsp;Compression level: from 0 (no compression) to 9.<br />\r\nbool&nbsp;<strong>imagejpeg</strong>&nbsp;(&nbsp;resource&nbsp;<code>$image</code>&nbsp;[,&nbsp;string&nbsp;<code>$filename</code>&nbsp;[,&nbsp;int&nbsp;<code>$quality</code>&nbsp;]] )<br />\r\n&nbsp; =&gt;&nbsp;<code>quality</code>&nbsp;is optional, and ranges from 0 (worst quality, smaller file) to 100 (best quality, biggest file). The default is the default IJG quality value (about 75).<br />\r\n<br />\r\n함수 생성 시 주의할 수 있도록 !<br />\r\n<br />\r\n참고 사이트<br />\r\n- 정리 ::&nbsp;<a href=\"https://webisfree.com/2015-12-29/[php]-%EB%8B%A4%EB%A5%B8-%ED%81%AC%EA%B8%B0%EC%9D%98-%EC%9D%B4%EB%AF%B8%EC%A7%80%EB%A5%BC-%EC%83%9D%EC%84%B1%ED%95%98%EB%8A%94-%ED%95%A8%EC%88%98\">https://webisfree.com/2015-12-29/[php]-%EB%8B%A4%EB%A5%B8-%ED%81%AC%EA%B8%B0%EC%9D%98-%EC%9D%B4%EB%AF%B8%EC%A7%80%EB%A5%BC-%EC%83%9D%EC%84%B1%ED%95%98%EB%8A%94-%ED%95%A8%EC%88%98</a><br />\r\n<br />\r\n- 함수체크 ::&nbsp;<a href=\"https://php.shukuma.com/php/function.imagepng.html\">https://php.shukuma.com/php/function.imagepng.html</a>','test01','2019-10-25 16:52:40'),(29,'aws','mac에서 ec2 서버접근 - ssh+ftp','-기본적으로 보안 그룹 활성화가 되어있어야함. [[ 전 글 참고 ]]<br />\r\n<br />\r\n- ssh 접근<br />\r\n1. .pem파일 권한 부여<br />\r\n&nbsp; &nbsp; chmod 400 ~/Desktop/workspace/keyfileName.pem<br />\r\n2. 터미널 열기&nbsp;<br />\r\n3. 접속<br />\r\n&nbsp; &nbsp; ssh -i ~/Desktop/key/keyfile.pem ec2-user@[서버 아이피 또는 도메인]<br />\r\n4. 서버 도메인에 퍼블릭 DNS를 넣어주면 됨.&nbsp;<br />\r\n<br />\r\n- sftp접근 (filezilla)<br />\r\n1. 설정 -&gt; sftp에 .pem키파일 설정<br />\r\n2. 사이트관리자 열기<br />\r\n3. new site&nbsp;<br />\r\n4. (일반)프로토콜: sftp<br />\r\n<img alt=\"\" src=\"/ckeditor/upload/2019/small_1572064539.9381.png\" /><br />\r\n&nbsp;','test01','2019-10-28 08:41:13'),(30,'aws','window에서 ec2 서버접근 - ssh+ftp','-기본적으로 보안 그룹 활성화가 되어있어야함. [[ 전 글 참고 ]]<br />\r\n<br />\r\n- ssh 접근<br />\r\n1. .pem -&gt; .ppk<br />\r\n&nbsp; &nbsp;- putty 다운로드<br />\r\n&nbsp; &nbsp;- puTTYgen 오픈<br />\r\n&nbsp; &nbsp;- parameters:RSA설정 -&gt; Load(pem파일선택) -&gt; Save private key =&gt; .ppk 파일 완성<br />\r\n2. 서버접근<br />\r\n&nbsp; &nbsp;- puTTY실행<br />\r\n&nbsp; &nbsp;- SSH -&gt; Auth -&gt; .ppk파일 업로드<br />\r\n&nbsp; &nbsp;- Session으로 돌아와 HostName에&nbsp;ec2-user@[서버 아이피 또는 도메인]<br />\r\n&nbsp; &nbsp;- Saved Sessions 이름 정해주기(마음대로)<br />\r\n&nbsp; &nbsp;- save해주면 다음에 load해서 실행하면 됨. 설정 따로 안해도 됨.<br />\r\n&nbsp; &nbsp;- 우분투의 경우 ubuntu로 로그인하면 됨.<br />\r\n<br />\r\n- sftp접근 (filezilla) == mac접근과 동일<br />\r\n&nbsp; &nbsp;1. 설정 -&gt; sftp에 .pem키파일 설정<br />\r\n&nbsp; &nbsp;2. 사이트관리자 열기<br />\r\n&nbsp; &nbsp;3. new site<br />\r\n&nbsp; &nbsp;4. (일반)프로토콜: sftp','test01','2019-10-28 08:41:53'),(31,'ubuntu','웹서버구축.APM설치. -ubuntu 18.xx','APM == Apache, PHP, Mysql\r\n<p>1. 준비<br />\r\n모든 패키지 설치를 시작하기 전에<br />\r\n[[저장소의 패키지 목록을 업데이트]]<br />\r\n[[기존에 설치되어 있던 패키지를 업그레이드]]<br />\r\n- sudo apt update &amp;&amp; sudo apt upgrade<br />\r\n<br />\r\n2. Apache2 웹서버 설치<br />\r\n웹서버(Web Server)는 웹브라우저 같은 클라이언트의 요청을 받아서 웹문서나 이미지 등을 전송해주는 역할 ( apache외에도 Nginx등 다양하게 있음 )<br />\r\n- sudo apt install apache2 &gt; Y<br />\r\n- url 접속해서&nbsp;ubuntu기본페이지 떠야&nbsp;정상.<br />\r\n<br />\r\n3. Mysql 설치<br />\r\nMySQL은 관계형 데이터베이스 관리 시스템(relational database management system, RDBMS).<br />\r\n다중 사용자가 다수의 데이터베이스에 접근할 수 있도록 서버를 구성함.<br />\r\n서버패키지 설치<br />\r\n- sudo apt install mysql-server &gt; Y<br />\r\n<br />\r\n4. PHP 설치<br />\r\n서버쪽의 일을 수행해주는 언어(Server-side scripting).<br />\r\n단순한 HTML 문서에서는 할 수 없는 동적 웹페이지 생성이나 데이터베이스로부터 조회하거나 수정하는 등의 일 수행.<br />\r\n- sudo apt install php php-mysql &gt; Y<br />\r\n설치 확인<br />\r\n- sudo nano /var/www/html/info.php<br />\r\n<!--?php phpinfo(); ?--> -&gt; ctrl O -&gt; ctrl X -&gt; url/info.php로 확인<br />\r\n<br />\r\n5. PhpMyAdmin설치<br />\r\nphpMyAdmin은 MySQL 데이터베이스를 관리할 수 있는 웹 인터페이스.<br />\r\n- sudo apt install phpmyadmin &gt; Y &gt; 패키지설정에 스페이스바로 apache2선택 &gt; [예] &gt; 암호<br />\r\n- url/phpmyadmin 경로로 접근시 로그인창이 뜨면 성공.<br />\r\n<br />\r\nnot found가 보일 경우<br />\r\n- sudo vi /etc/apache2/apache2.conf&nbsp;<br />\r\n마지막 줄에<br />\r\n- Include /etc/phpmyadmin/apache.conf 추가<br />\r\n추가한 내용 적용<br />\r\n-&nbsp;sudo /etc/init.d/apache2 restart<br />\r\n<br />\r\n<br />\r\n출처 :&nbsp;<a href=\"https://webnautes.tistory.com/1185\">https://webnautes.tistory.com/1185</a></p>\r\n','test01','2019-10-28 09:22:07'),(32,'etc','[db] db생성, 사용자추가, 권한부여','처음 db접근시<br />\r\n- mysql -u root -p &gt; 패스워드 입력 &gt; 접속<br />\r\n(mysql내부)<br />\r\n- show databases; (database 확인)<br />\r\n- use db명; (database 선택)<br />\r\n- show tables; (해당 db내 table확인)<br />\r\n- select * from tb명 (테이블명에 속해있는 정보 불러오기)<br />\r\n이런식으로 접근을 할 수 있다.<br />\r\n<br />\r\ndb를 root계정 하나만 두고 사용하기엔 보안에 취약함.<br />\r\n그래서 db와 사용자를 추가해주는거고, 추가한 사용자는 해당 db만 접근,제어할 수 있으며 추가적으로 사용자에 권한부여하는 방법을 알아야 함.<br />\r\n((mysql내부))<br />\r\n1. db추가<br />\r\nmysql&gt; create database db명 DEFAULT CHARACTER SET utf8;<br />\r\nQuery OK, 1 row affected (0.00 sec)<br />\r\n<br />\r\n2. 사용자 추가<br />\r\nmysql&gt; create user 사용자이름 identified by &#39;패스워드&#39;;<br />\r\nQuery OK, 0 rows affected (0.00 sec)<br />\r\n<br />\r\n3. 추가한 사용자에 추가한 db의 모든 권한을 부여<br />\r\nmysql&gt; GRANT ALL PRIVILEGES ON db명.* TO &#39;사용자이름&#39;@&#39;localhost&#39; identified by &#39;패스워드&#39;;<br />\r\nQuery OK, 0 rows affected, 1 warning (0.00 sec)<br />\r\n<br />\r\n<br />\r\n출처 :&nbsp;<a href=\"https://webnautes.tistory.com/1185\">https://webnautes.tistory.com/1185</a>','test01','2019-10-28 09:37:20'),(33,'ubuntu','apache2 서버제어 *필수항목있음','<p>1. 아파치 기본 설정 &nbsp; &nbsp; : sudo vi /etc/apache2/apache2.conf</p>\r\n\r\n<p>2. 포트 설정 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : sudo vi /etc/apache2/ports.conf</p>\r\n\r\n<p>3. public 파일 설정 &nbsp; &nbsp; &nbsp;: sudo vi /etc/apache2/mods-enabled/dir.conf</p>\r\n\r\n<p>4. 언어셋관련 설정 &nbsp; &nbsp; &nbsp;: sudo vi /etc/apache2/mods-enabled/autoindex.conf</p>\r\n\r\n<p>5. 파일타입 설정 &nbsp; &nbsp; &nbsp; &nbsp; : sudo vi /etc/apache2/mods-enabled/mime.conf</p>\r\n\r\n<p>6. 웹서비스 설정 &nbsp; &nbsp; &nbsp; &nbsp; : sudo vi /etc/apache2/sites-enabled/000-default<br />\r\n<br />\r\n서버세팅하고 html 내에 php코딩시,<br />\r\n<!--?php ~~ ?--> 써주면 php내의 코드를 읽지않고 통째로 주석처리로 나오게 되는 경우가 발생한다.<br />\r\n이를 막기위해 아래와 같이 조치를 취해준다.<br />\r\n<br />\r\n**필수항목)<strong>&nbsp;html, php 확장자가 사용 가능하도록 변경<br />\r\n-&nbsp;</strong>sudo vi /etc/apache2/mods-enabled/mime.conf<br />\r\n- 파일에서 AddType application/x-bzip2 .bz2 밑에<br />\r\n- AddType application/x-httpd-php .php .phtml .html .htm 등록<br />\r\n- :wq! 하여 저장하고 나옴<br />\r\n- sudo /etc/init.d/apache2 restart<br />\r\n---------------------------------------------------------------------------------------<br />\r\n* ssl_module 사용시 포트설정<br />\r\nsudo vi /etc/apache2/ports.conf 접근 &gt;&nbsp;<br />\r\n<img src=\"/ckeditor/upload/2019/1572223580.7478.png\" style=\"height:257px; width:639px\" /><br />\r\n<br />\r\n<br />\r\n출처 :&nbsp;<a href=\"https://jbit.bufs.ac.kr/~nicebam/?p=92\">https://jbit.bufs.ac.kr/~nicebam/?p=92</a></p>\r\n','test01','2019-10-28 09:46:35'),(34,'ubuntu','apache2 디렉토리 리스팅 막기','root경로에 -&gt; server폴더에 -&gt; connect.php 파일이 있다고 가정했을 때,<br />\r\nurl/server/ 만 접속할 경우, 하위 파일들이 노출되는 경우가 발생함.<br />\r\n이를 대비해 정확하게 해당 경로를 입력하지 않으면 기타 파일들이 노출이 되지 않게 설정 해줘야 함.<br />\r\n<br />\r\n1. conf 파일 열기<br />\r\n&nbsp; &nbsp;- /etc/apache2/apache2.conf<br />\r\n<br />\r\n2.&nbsp;아파치 설정 파일에서 Options 라인을 찾아 Indexes를 제거\r\n<p>&nbsp; &nbsp;&nbsp; &nbsp;&lt;Directory /var/www/&gt;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong>Options Indexes FollowSymLinks</strong></p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; AllowOverride None</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp; Require all granted</p>\r\n\r\n<p>&nbsp; &nbsp;&nbsp; &nbsp;&lt;/Directory&gt;<br />\r\n<br />\r\n3. 설정 완료 후 apache2서버 재시작<br />\r\n- /etc/init.d/apache2 restart&nbsp;<br />\r\n<br />\r\n&nbsp;</p>\r\n출처:&nbsp;<a href=\"https://kugancity.tistory.com/entry/%EC%95%84%ED%8C%8C%EC%B9%98-%EB%94%94%EB%A0%89%ED%86%A0%EB%A6%AC-%EB%A6%AC%EC%8A%A4%ED%8C%85-%EB%A7%89%EA%B8%B0\">https://kugancity.tistory.com/entry/아파치-디렉토리-리스팅-막기</a>&nbsp;[you&#39;ve got to find what you love.]','test01','2019-10-28 09:54:21'),(35,'ubuntu','로그분석.','우리는 보안을 위해 서버에 누가 접근했고 어떤 수행을 했는지 관찰해 볼 필요가 있다. ((해킹의 명목이 가장 크다.))<br />\r\n- cd /var/log/apache2/<br />\r\n- ll<br />\r\n- sudo vi log파일<br />\r\n<br />\r\n<img src=\"/ckeditor/upload/2019/small_1572226115.4902.png\" style=\"height:353px; width:841px\" /><br />\r\n<br />\r\n1. 어느경로에 어떤정보를 요청하는지 확인해야함.<br />\r\n2. db접근시 접속경로 및 ip차단할 것.&nbsp;<br />\r\n3. 200(성공적으로 리시브했는지), 그외 HTTP 상태 코드도 확인해야함.<br />\r\n잘 보면 해킹인지 아닌지 알 수 있음.<br />\r\n<br />\r\n<br />\r\n출처 :&nbsp;<a href=\"https://d2.naver.com/helloworld/3585246\">https://d2.naver.com/helloworld/3585246</a>','test01','2019-10-28 10:31:19'),(36,'ubuntu','ufw - port / ip 제어','<p><strong>ufw란 ?&nbsp;<br />\r\n우분투의 기본적인 방화벽.&nbsp;</strong><br />\r\niptables를 좀 더 쉽게 설정할 수 있도록 한 것인데 간단한 방화벽 구성에는 문제가 없지만 수준 높은 방화벽 구성에는 iptables 룰을 직접 사용해야 합니다.<br />\r\n<br />\r\n<strong>UFW 활성화/비활성화</strong><br />\r\nUFW는 기본 비활성화 상태이기에 이를 활성화 한다.</p>\r\n\r\n<p>활성화 : sudo ufw enable<br />\r\n비활성화 :&nbsp;sudo ufw disable<br />\r\n상태확인 :&nbsp;sudo ufw status verbose<br />\r\n<br />\r\n<strong>UFW 기본 룰</strong><br />\r\nUFW에 설정되어 있는 기본 룰은 아래와 같다.</p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>들어오는 패킷에 대해서는 전부 거부(deny)</p>\r\n	</li>\r\n	<li>\r\n	<p>나가는 패킷에 대해서는 전부 허가(allow)</p>\r\n	</li>\r\n</ul>\r\n\r\n<p>기본 룰 확인 :&nbsp;sudo ufw show raw<br />\r\n기본 정책 차단 :&nbsp;sudo ufw default deny<br />\r\n기본 정책 허용 :&nbsp;sudo ufw default allow</p>\r\n\r\n<p><strong>UFW 허용과 차단</strong><br />\r\nUFW 허용 : sudo ufw allow /<br />\r\n예) SSH 포트 22번 허용(tcp/udp 22번 포트를 모두 허용)<br />\r\n&nbsp; -&nbsp;sudo ufw allow 22<br />\r\ntcp 22번 포트만을 허용 - SSH는 tcp 22번 포트만 허용하는게 정답<br />\r\n&nbsp; - sudo ufw allow 22/tcp<br />\r\nudp 22번 포트만을 허용<br />\r\n&nbsp; - sudo ufw allow 22/udp<br />\r\n<br />\r\n<strong>UFW 룰의 삭제</strong><br />\r\nufw deny 22/tcp 설정이 되어있다고 가정<br />\r\n&nbsp; - sudo ufw delete deny 22/tcp</p>\r\n\r\n<p><strong>특정한 IP 주소 허가/거부</strong><br />\r\n특정한 IP주소 허용<br />\r\n&nbsp; - sudo ufw allow from ip<br />\r\n<br />\r\n<strong>추천 방화벽 정책</strong><br />\r\n&nbsp; - sudo&nbsp;ufw&nbsp;enable&nbsp;<br />\r\n&nbsp; - sudo&nbsp;ufw allow from 192.168.0.3 to any port 22 proto tcp&nbsp;<br />\r\n&nbsp; - sudo&nbsp;ufw allow 123/udp&nbsp;<br />\r\n&nbsp; - sudo&nbsp;ufw allow 80/tcp&nbsp;<br />\r\n&nbsp; - sudo&nbsp;ufw allow 3306/tcp&nbsp;<br />\r\n&nbsp; - sudo&nbsp;ufw status<br />\r\n<br />\r\n&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>출처<br />\r\n<a href=\"https://webdir.tistory.com/206\">https://webdir.tistory.com/206</a>&nbsp;[WEBDIR]<br />\r\n좀 더 간단한 블로그&nbsp;<br />\r\n<a href=\"https://milkye.tistory.com/343\">https://milkye.tistory.com/343</a></p>\r\n','test01','2019-10-28 11:07:58'),(37,'ubuntu','phpmyadmin 접속허용 ip설정','<p>접속로그를 보다보면 phpmyadmin에 접근하는 경우가 더러 있다.<br />\r\n이 경우를 원천에&nbsp;차단하기 위해 서버에서 차단해줄 필요가 있다.<br />\r\n<br />\r\nphpmyadmin apache conf파일 접근<br />\r\n- <strong>vi /etc/phpmyadmin/apache.conf</strong><br />\r\n<img src=\"/ckeditor/upload/2019/1572228311.2627.png\" style=\"height:120px; width:397px\" /><br />\r\n내가 사용하는 ip만 허용해주고,<br />\r\n<br />\r\n- service apache2 reload&nbsp; &nbsp;를 통해<br />\r\n서버를 재시작해주면 끝.</p>\r\n','test01','2019-10-28 11:06:48'),(38,'ubuntu','linux 파일 권한 관리','<strong>chmod </strong><br />\r\n- 접근 권한 변경<br />\r\n- 파일소유자 / 슈퍼유저만 가능<br />\r\n- R : 하위디렉토리+파일권한 모두 변경<br />\r\nex) chmod -R 777 사용자(대상)<br />\r\n<br />\r\n접근 권한 표<br />\r\n<img src=\"/ckeditor/upload/2019/1572229134.9858.png\" style=\"height:364px; width:342px\" /><br />\r\n<br />\r\n<strong>chown</strong><br />\r\n- 파일의 소유주나 그룹을 변경할 때 사용<br />\r\n- 슈퍼유저만 가능(보안)<br />\r\n- R : 하위디렉토리+파일권한 모두 변경<br />\r\nex) chown -R 사용자(대상) 파일명<br />\r\n<br />\r\n<br />\r\n출처 :&nbsp;<a href=\"https://eunguru.tistory.com/93\">https://eunguru.tistory.com/93</a>','test01','2019-10-28 11:26:43'),(39,'ubuntu','도메인관리 :http','모든 전자기기는 이름이 존재한다.&nbsp;<br />\r\n다만 전자기기가 세상과 소통하기 위해선 대표적인 이름이 필요하다.<br />\r\n마치 내가 집에선 아들이지만, 사회에선 이름을 갖고있는 것처럼.<br />\r\n이러한 사회에서 사용되는 전자기기 각자의 이름을 ip주소라고 부른다.<br />\r\nip주소는 대게 xxx.xxx.xxx.xxx 형식으로 숫자로 구성되어 있어서, 쉽게 기억되지 못한다.<br />\r\n이를 위해 ip주소를 특정 dns주소에 입력하여, www.naver.com을 검색하면 해당 ip가 호출된다.<br />\r\n이러한 naver.com을 도메인주소, dns주소라고 부른다.<br />\r\n<br />\r\n아래의 그림은 route 53 기본화면이다.<br />\r\n① 기존에 dns서버가 존재하는지 검색하는 화면이다. id처럼 중복되면 안된다. 가격도 알 수 있다.<br />\r\n​​​​​​② 도메인을 등록하는 화면이다.<br />\r\n③ 구매한 도메인과 내가 연결하고자하는 ip를 연결시켜주는 화면이다.<br />\r\n<img alt=\"\" src=\"/ckeditor/upload/2019/small_1572239767.8801.jpg\" /><br />\r\n<br />\r\n순서대로 해준 뒤에,<br />\r\n③에서 레코드생성 후 아래에 값에 연결하고싶은 ip주소를 입력하면 완료.<br />\r\nhttp는 완료.(:80)<br />\r\n<br />\r\n웹서버에서 보안을 구축하려면 https는 기본이다.(:443)<br />\r\n다음 글에서 만나보자.','test01','2019-10-28 14:21:55'),(40,'ubuntu','도메인관리 :https -1','https는 기존에 http와 가장 큰 차이점은 보안이다.<br />\r\nssl인증서를 통해 확인서가 발급된 도메인주소는 http와는 비교적으로 보안이 좋다.<br />\r\n<br />\r\n크게 두 가지 방법을 소개한다.<br />\r\n첫 번째 방법은 다음과 같다.<br />\r\n<br />\r\n1. 도메인 검증<br />\r\n<img alt=\"\" src=\"/ckeditor/upload/2019/small_1572240176.4749.jpg\" /><br />\r\n(route 53 기본화면)<br />\r\n- ③ 화면에 SOA&nbsp;값들을 ②으로 들고가 도메인 검증절차를 밟는다.<br />\r\n<br />\r\n2. ssl 증명서 발급<br />\r\n- 도메인에 대한 ACM(Amazon Certificate Manager)에서 증명서를 발급해야한다.<br />\r\n- AWS Dashboard &gt; Certificate Manager &gt; Request a certificate<br />\r\n- Domain name 기재, &quot;Add another name to this certificate&quot; 클릭 / &quot;Review and request&quot; 클릭<br />\r\n-&nbsp;다음 화면에서 &quot;Confirm and request&quot; 클릭 www.example.com를 가진 소유자에게 AWS에서 증명서에 대한 확인 메일 발송.<br />\r\n-&nbsp;메일에서 승인해주면 (To approve this request ,go to ~~~~) &gt;&gt;&gt; SSL Certificate 발급완료.\r\n<p>3. ELB에 SSL Listener 등록<br />\r\n-&nbsp;ELB SSL Listener를 열어주는 이유는 Instance에게 ELB로 들어오는 트래픽을 전달해주는 역할을 하기 때문<br />\r\n- ELB &gt; Edit listeners &gt; ADD &gt; HTTPS &gt; Instance Port:# &gt; 다음<br />\r\n- Select Certificate에서 &quot;Choose an existing certificate from AWS Cerstificate Manager (ACM)&quot;&nbsp;선택 &gt;&nbsp;밑에 Certificate를 등록한 도메인의 Certificate로 등록 &gt; &quot;Save&quot;<br />\r\n<br />\r\n4.&nbsp;보안그룹 https설정<br />\r\n- 443포트 열어주면 끝. 이전 글 참조.(보안 ~)<br />\r\n<br />\r\n5. Load Balancers &gt; Security의 Edit을 통해서&nbsp;만든 Security Group&nbsp;적용 &gt;&gt;&gt;&gt;&gt;&nbsp; 준비 끝.<br />\r\n<br />\r\n6. 다시 route53으로 돌아가서&nbsp;<br />\r\n-&nbsp;&quot;Create Record Set&quot; &gt; Type : &quot;A - IPv4 address&quot;로 들어가서 Alias(별칭)를 yes로 선택 &gt;&nbsp;Alias Target를 누르고 아까 설정을 완료하였던 LoadBalancer의 도메인을 선택 &gt; &quot;Create&quot; &gt;&gt;&gt;&gt; 실행 끝 ~</p>\r\n\r\n<p><br />\r\n=== 단점: 사설로 검증되지 않은 확인서이기 때문에 경고창이 뜬다.<br />\r\n&nbsp;</p>\r\n<br />\r\n출처:&nbsp;<a href=\"https://interconnection.tistory.com/21\">https://interconnection.tistory.com/21</a>&nbsp;[라이언 서버]<br />\r\n&nbsp;','test01','2019-10-28 14:39:21'),(41,'ubuntu','도메인관리 :https -2','https는 기존에 http와 가장 큰 차이점은 보안이다.<br />\r\nssl인증서를 통해 확인서가 발급된 도메인주소는 http와는 비교적으로 보안이 좋다.<br />\r\n<br />\r\n크게 두 가지 방법을 소개한다.<br />\r\n두 번째 방법은 다음과 같다.<br />\r\nLet&#39;s Encrypt를 사용<br />\r\n<br />\r\n1. Certbot 설치<br />\r\n<br />\r\n- sudo add-apt-repository ppa:certbot/certbot<br />\r\n- sudo apt update<br />\r\n- sudo apt install python-certbot-apache<br />\r\n<br />\r\n2. 인증서 받기<br />\r\n- sudo certbot --apache -d your_domain -d www.your_domain &gt; 2(redirect)<br />\r\n- cd /etc/letsencrypt/live/your_domain &gt;&gt; 생성된 파일 확인<br />\r\n<br />\r\n3. 발급받은 인증서 적용<br />\r\nvi&nbsp;/etc/apache2/sites-available/default-ssl.conf<br />\r\n<img src=\"/ckeditor/upload/2019/1572242567.5828.png\" style=\"height:92px; width:380px\" />\r\n<pre>\r\nSSLEngine on\r\nSSLCertificateFile /etc/letsencrypt/live/example.com/cert.pem\r\nSSLCertificateKeyFile /etc/letsencrypt/live/example.com/privkey.pem\r\nSSLCertificateChainFile /etc/letsencrypt/live/example.com/chain.pem</pre>\r\n(아까 받은 pem파일 3개를 등록)<br />\r\n<img src=\"/ckeditor/upload/2019/1572242866.6332.png\" style=\"height:321px; width:343px\" /><br />\r\n이거보고 참고.<br />\r\n<br />\r\n4. sudo service apache2 restart<br />\r\n<br />\r\n5. 검증 :&nbsp;<a href=\"https://www.ssllabs.com/ssltest/\">https://www.ssllabs.com/ssltest/</a><br />\r\n<br />\r\n6. 갱신 : certbot&nbsp;renew&nbsp;--dry-run ((90일마다 갱신))<br />\r\n<br />\r\n<br />\r\n<br />\r\n=== 검증된 확인서를 가져오기 때문에, 경고창이 뜨지 않는다.','test01','2019-10-28 15:08:48'),(42,'php','변수를 보다 확실하게 선언하고싶을때','<h2 style=\"font-style:italic\">$limit1;<br />\r\n$limit2;<br />\r\n$limit3;<br />\r\n$limit4;<br />\r\n$limit5;<br />\r\n$limit6;<br />\r\n<br />\r\nfor&nbsp;($i=1;&nbsp;$i&nbsp;&lt;7&nbsp;;&nbsp;$i++)&nbsp;{&nbsp;<br />\r\n&nbsp; &nbsp; #&nbsp;code...<br />\r\n&nbsp; &nbsp; echo&nbsp;$limit${i};<br />\r\n&nbsp;}</h2>\r\n','test01','2019-10-28 15:12:41'),(43,'ubuntu','깔려있는 패키지 확인','dpkg&nbsp;--get-selections','test01','2019-10-28 15:11:51'),(44,'etc','git push','<strong>1. 깃 설치</strong><br />\r\n- sudo apt-get install git<br />\r\n<br />\r\n2.&nbsp;버전체크<br />\r\n- git --version<br />\r\n<br />\r\n3. git config<br />\r\n- git config --global user.name &quot;my_git_name&quot;<br />\r\n- git config --global user.email my_git_email<br />\r\n<br />\r\n4. push하고싶은 폴더로 이동. &gt; git init : .git폴더 생성<br />\r\n-만약 처음이 아니고, git 폴더의 내부를 초기화하고싶으면 git init --bare<br />\r\n<br />\r\n여기서 주목.<br />\r\n<img alt=\"로컬 저장소는 이렇게 생겼어요.\" src=\"https://rogerdudler.github.io/git-guide/img/trees.png\" /><br />\r\n여러분의 로컬 저장소는 git이 관리하는 세 그루의 나무로 구성돼있어요.<br />\r\n첫번째 나무인&nbsp;작업 디렉토리(Working directory)는 실제 파일들로 이루어져있고,<br />\r\n두번째 나무인&nbsp;인덱스(Index)는 준비 영역(staging area)의 역할을 하며,<br />\r\n마지막 나무인&nbsp;HEAD는 최종 확정본(commit)을 나타내요.<br />\r\n<br />\r\n5. add<br />\r\n- git add &lt;파일 이름&gt; 혹은 git add *<br />\r\n<br />\r\n6. commit<br />\r\n- git commit -m &quot;이번 확정본에 대한 설명&quot;<br />\r\n<br />\r\n7. git remote ::깃 명령어.<br />\r\n- git remote add origin https://github.com/my_git_name/project_name<br />\r\n<br />\r\n===================여기까지 준비===================<br />\r\n<br />\r\n8. git push<br />\r\n- git push -u origin master &gt; my_git_name / pw 입력. 끝.<br />\r\n<br />\r\n<br />\r\n출처<br />\r\n<a href=\"https://rogerdudler.github.io/git-guide/index.ko.html\">https://rogerdudler.github.io/git-guide/index.ko.html</a><br />\r\n<a href=\"https://emflant.tistory.com/123\">https://emflant.tistory.com/123</a>','test01','2019-10-28 16:24:31'),(45,'etc','[db백업]','기본적으로<br />\r\nmysqldump -u root -p db명 테이블명 &gt; /경로/테이블명.sql<br />\r\n기반.<br />\r\n<br />\r\n:: db에서 해당 db명을 파일명.sql에 따로 저장.<br />\r\nmysqldump -u root -p db명 &gt; /경로/파일명.sql<br />\r\n<br />\r\n:: 백업된 db에서 일정 테이블을 추출해 따로 저장.<br />\r\nsed -n -e &#39;/DROP TABLE.*tb명/,/UNLOCK TABLES/p&#39; /경로/파일명.sql &gt; 경로/파일명.sql<br />\r\n<br />\r\n<br />\r\n<br />\r\n&nbsp;','test01','2019-10-28 16:51:35'),(46,'ubuntu','서버튕김현상 (미제사건);;','<p>- 로드밸런싱 설정 이후 서버튕김 ? 408 리턴 ? 연관성 있을것같아서 일단 메모해두겠음.<br />\r\n<br />\r\n408 리턴<br />\r\n이 설정은 매우 중요하다. 특히나 AWS ELB 뒤에 Apache 웹 서버를 운영중이라면 아주 중요하다.</p>\r\n\r\n<p>여기에서 reqtimeout_module 부분을 수정하지 않으면 아마도 로그에 &nbsp;&lsquo;ELB-HealthChecker/1.0&rsquo; 요청에 대해서 408 을 리턴하는 것을 볼 수 있다.</p>\r\n<img src=\"/ckeditor/upload/2019/1572312697.83.png\" style=\"height:14px; width:384px\" /><br />\r\n&gt;<br />\r\n<img src=\"/ckeditor/upload/2019/1572312728.7549.png\" style=\"height:36px; width:371px\" />\r\n<p>이렇게 해야 하는 이유는 AWS ELB 의 Health Checker 가 Apache 웹 서버의 Alive 를 알아내기 위해서 패킷을 보내는데, AWS ELB 의 기본 Idle 값(60)보다 크게 잡아야 하기 때문이다.</p>\r\n\r\n<p>위와같이 설정하면 408 오류는 보이지 않게 된다.<br />\r\n&nbsp;</p>\r\n<br />\r\n- 서버튕김현상은 해결안됨.; 찾아볼것.<br />\r\n<br />\r\n출처 :&nbsp;<a href=\"http://linux.systemv.pe.kr/apache-proxy-load-balancer-%EA%B5%AC%EC%84%B1/\">http://linux.systemv.pe.kr/apache-proxy-load-balancer-%EA%B5%AC%EC%84%B1/</a>','test01','2019-10-29 10:52:27'),(47,'ubuntu','서버시간 설정','php.ini에서 바꾸는 시간은 php서버만 변경될 뿐 실제 서버에는 시간이 반영되지 않는다.<br />\r\n실제로 date를 입력했을때 UTC시간으로 뜨게되는데 이를 KST로 바꾸기 위해선<br />\r\n-<br />\r\nln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime<br />\r\n-<br />\r\n명령어를 수행해야한다.<br />\r\n&nbsp;','test01','2019-10-29 10:44:58');
/*!40000 ALTER TABLE `tb_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_member`
--

DROP TABLE IF EXISTS `tb_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `mid` varchar(100) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `upasswd` varchar(100) NOT NULL,
  `ip_addrs` varchar(15) DEFAULT NULL,
  `reg_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logindate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_member`
--

LOCK TABLES `tb_member` WRITE;
/*!40000 ALTER TABLE `tb_member` DISABLE KEYS */;
INSERT INTO `tb_member` VALUES (1,'fifabell@naver.com','정종인','*A4B6157319038724E3560894F7F932C8886EBFCF',NULL,'0000-00-00 00:00:00',NULL),(2,'test01','test01','*7E6A44E6DA0D9BC6621E07B51A3B2DADADE488EB',NULL,'0000-00-00 00:00:00','');
/*!40000 ALTER TABLE `tb_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-10-29 11:39:48
