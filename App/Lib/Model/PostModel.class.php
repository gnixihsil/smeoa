<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa               
 -------------------------------------------------------------------------*/


class PostModel extends CommonModel {
	// 自动验证设置
	protected $_validate	 =	 array(
		//array('name','require','文件名必须',1),
		array('content','require','内容必须'),
		);
	// 自动填充设置
	protected $_auto	 =	 array(
		array('is_del','0',self::MODEL_INSERT),
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('update_time','time',self::MODEL_UPDATE,'function'),
		);      

	function _after_insert($data,$options){
		$tid=$data["tid"];
		M("Forum")->where("id=$tid")->setInc("reply",1);
	}
}	
?>