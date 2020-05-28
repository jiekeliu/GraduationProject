<?php
/*
翻译类	
*/		
class Translation{
	/**
	 * Desc:
	 * Date: 2020/1/3
	 * Time: 10:36
	 * @param $text
	 * @param string $to zh-CN:翻译为中文  en:翻译为英文
	 * @return string
	 */
	function gtranslate($text,$to='zh-CN'){
	    $entext = urlencode($text);
	    $url = 'https://translate.google.cn/translate_a/single?client=gtx&dt=t&ie=UTF-8&oe=UTF-8&sl=auto&tl='.$to.'&q='.$entext;
	    set_time_limit(0);
	    $ch = curl_init();
	    curl_setopt($ch, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
	    curl_setopt($ch, CURLOPT_HEADER, false);
	    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
	    curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, FALSE);
	    curl_setopt($ch, CURLOPT_FOLLOWLOCATION, true);
	    curl_setopt($ch, CURLOPT_MAXREDIRS,20);
	    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 40);
	    curl_setopt($ch, CURLOPT_URL, $url);
	    $result = curl_exec($ch);
	    curl_close($ch);
	    $result = json_decode($result);
	    if(!empty($result)){
	        foreach($result[0] as $k){
	            $v[] = $k[0];
	        }
	        return implode(" ", $v);
	    }
	}
		
}

//echo gtranslate($longtext,'en');
?>