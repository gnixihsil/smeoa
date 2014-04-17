<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa               
 -------------------------------------------------------------------------*/

class SystemAction extends CommonAction {
	//过滤查询字段

	function _search_filter(&$map) {
		if (!empty($_POST['keyword'])) {
			$map['type|name|code'] = array('like', "%" . $_POST['keyword'] . "%");
		}
	}

	function check_reg() {

	}

	function get_feature_code() {
		@exec("systeminfo", $array);
		for ($i = 1; $i <= 10; $i++) {
			$new[$i] = auto_charset($array[$i], 'gb2312', 'utf-8');
		}
		$new1 = explode(":", $new[1]);
		$new9 = explode(":", $new[9]);
		$new10 = explode(":", $new[10]);
		$str = $new1[1] . "|" . $new9[1] . "|" . $new10[1];
		$str = str_replace(" ", "", $str);

		$v1 = f_encode($str);
		$T_k1 = "cdrGDaNiVKRAwoOQgPEWsejkLnHxzShFuJCBXpltfImTUYMbqvyZ";
		$T_k2 = "EekCZmLfJblTtiMyDVFRSHnBzXwrKdNgGvcpqhUaosYQAOWjuIPx";
		$c = strtr($v1, $T_k1, $T_k2);
		return $c;
	}

	function save() {

	}

	function index() {
		$feature_code = $this -> get_feature_code();
		$this -> assign('feature_code', $feature_code);
		$this -> display();
	}

	function RandAbc($length = "") {//返回随机字符串
		$str = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
		return str_shuffle($str);
	}

}
?>