<?
// 뚜기보드 썸네일 만들기 function ###############################################
function TG_Image_Resize($destination, $filename, $resize_filename, $wide_size, $image_quality, $add_filename, $make_thumb)
{
   $file_ext = TG_Find_Extension($filename);
   if ($file_ext == ".jpeg" || $file_ext == ".jpg" || $file_ext == ".gif" || $file_ext == ".png")
   {
      $thumb_width = 0;
      $thumb_height = 0;
      $src= "";
      list($image_width, $image_height) = getimagesize($destination.$filename);
      $file_ext = TG_Find_Extension($filename);

      switch($file_ext)
      {
         case '.jpeg': 
         case '.jpg': 
            $src = @ImageCreateFromJPEG($destination.$filename) or die('Cannot Open File!');
            break;
         case '.gif':
            $src = @ImageCreateFromGIF($destination.$filename) or die('Cannot Open File!');
            break;
         case '.png':
            $src = @ImageCreateFromPNG($destination.$filename) or die('Cannot Open File!');
            break;
         default :
            echo '이 파일은 변환할 수 없습니다.';
            exit;
      }

      if ($make_thumb == "Y")
      {
         if (((int)($image_width)) > ((int)($image_height)))
         {
            $thumb_width = $wide_size;
            $thumb_height = round($image_height*$wide_size/$image_width);
            $thumb_size = imagecreatetruecolor($thumb_width, $thumb_height);
         }
         else
         {
            $thumb_width = round($image_width*$wide_size/$image_height);
            $thumb_height = $wide_size;
            $thumb_size = imagecreatetruecolor($thumb_width, $thumb_height);
         }
      }
      else
      {
         if ( (int)$image_width > (int)$image_height )
         {
            if ((int)$image_width <= (int)$wide_size)
            {
               $thumb_width = $image_width;
               $thumb_height = $image_height;
            }
            else
            {
               $thumb_width = $wide_size;
               $thumb_height = round($image_height*$wide_size/$image_width);
            }
               $thumb_size = imagecreatetruecolor($thumb_width, $thumb_height);
         }
         else
         {
            if ( (int)($image_width) <= (int)$wide_size )
            {
               $thumb_width = $image_width;
               $thumb_height = $image_height;
            }
            else
            {
               $thumb_width = $wide_size;
               $thumb_height = round($image_height*$wide_size/$image_width);
            }
   //         $thumb_width = round($image_width*$wide_size/$image_height);
   //         $thumb_height = $wide_size;
            $thumb_size = imagecreatetruecolor($thumb_width, $thumb_height);
         }
      }
      Imagecopyresampled($thumb_size, $src,0,0,0,0,$thumb_width,$thumb_height,$image_width,$image_height); 
      switch($file_ext)
      {
         case '.jpeg' : 
         case '.jpg' : 
            $src = @ImageJPEG($thumb_size,$destination.$add_filename.$resize_filename,$image_quality) or die('Cannot Open File!');
            break;
         case '.gif' :
            // $src = @ImageGIF($thumb_size,$destination.$add_filename.$resize_filename,$image_quality) or die('Cannot Open File!');
            $src = @ImageGIF($thumb_size,$destination.$add_filename.$resize_filename) or die('Cannot Open File!');
            break;
         case '.png' :
            $src = @ImagePNG($thumb_size,$destination.$add_filename.$resize_filename,0) or die('Cannot Open File!');
            break;
         default :
            echo '이 파일은 변환할 수 없습니다.';
            exit;
      }
      ImageDestroy($thumb_size);
   }
}

function TG_Find_Extension($filename)
{
   for($i=strlen($filename);$i>0;$i--)
   {
      if(substr($filename,$i,1)==".")
      {
         $find_extension = strtolower(substr($filename,$i,strlen($filename)));
         return $find_extension;
         break;
      }
   }
}

// function TG_conv_filename($encode_type1, $encode_type1, $filename)
// {
//    $filename = iconv($encode_type1,$encode_type1, $filename);
//    return $filename;
// }
?>