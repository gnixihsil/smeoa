<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa               
 -------------------------------------------------------------------------*/
 
class DutyAction extends CommonAction {
	protected $config=array('app_type'=>'master');

	public function _search_filter(&$map) {
		if (!empty($_GET['pid'])) {
			$map['pid'] = $_POST['pid'];
		}
	}

	public function index() {
		$node = M("Duty");
		$menu = array();
		$menu = $node -> field('id,name') -> order('sort asc') -> select();
		$tree = list_to_tree($menu);
		$this -> assign('menu', sub_tree_menu($tree));
		$this -> display();
	}
}
?>