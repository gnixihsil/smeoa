<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa               
 -------------------------------------------------------------------------*/

class DocModel extends CommonModel {
	// 自动验证设置
	protected $_validate	 =	 array(
		array('name','require','文件名必须',1),
		array('content','require','内容必须'),
		);
	// 自动填充设置
	protected $_auto	 =	 array(
		array('is_del','0',self::MODEL_INSERT),
		array('create_time','time',self::MODEL_INSERT,'function'),
		array('update_time','time',self::MODEL_UPDATE,'function'),
		array('doc_no','new_doc_no',self::MODEL_INSERT,'callback'),
		);
        
    function new_doc_no(){
        $sql = "SELECT CONCAT(year(now()),'-',LPAD(count(*)+1,4,0)) doc_no FROM `".$this->tablePrefix."doc` WHERE 1 and year(FROM_UNIXTIME(create_time))>=year(now())";       
        $rs = $this->db->query($sql);
        if($rs){
            return $rs[0]['doc_no'];    
        }else{
            return date('Y')."-0001"; 
        }
    }
}	
?>