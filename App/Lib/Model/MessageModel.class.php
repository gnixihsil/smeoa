<?php
class MessageModel extends CommonModel {
	// 自动验证设置
	protected $_validate	 =	 array(
		//array('name','require','文件名必须',1),
		array('content','require','内容必须'),
		);
	// 自动填充设置
	protected $_auto	 =	 array(
		array('status','1',self::MODEL_INSERT),
		array('create_time','time',self::MODEL_INSERT,'function'),
		);      
	public function get_list(){
		$emp_no=get_emp_no();
		$sql=" select t2.*,t3.count,t4.emp_name sender_name from think_message t2,(";
		$sql.=" select max(id) id ,max(create_time) create_time,t1.sender,t1.recever, count(*) count from (select  id,sender,recever,create_time from ";
		$sql.=" think_message where status=1 and owner='$emp_no' ";
		$sql.=" 		union";
		$sql.=" 		select id,a.recever,a.sender ,0 create_time from think_message a where a.status=1  and owner='$emp_no' ) t1";
		$sql.=" 		where t1.recever='$emp_no' group by t1.sender) t3,think_user t4";
		$sql.=" 		where t3.id=t2.id and t4.emp_no=t3.sender";
		$rs = $this->db->query($sql);
		return $rs;
	}
}	
?>