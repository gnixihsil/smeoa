<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa               
 -------------------------------------------------------------------------*/


class FlowLogModel extends CommonModel {
	// 自动验证设置
	protected $_validate	 =	 array(
		);
	// 自动填充设置
	protected $_auto	 =	 array(
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('update_time','time',self::MODEL_UPDATE,'function')
		);      
}
?>