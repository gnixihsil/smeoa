<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa               
 -------------------------------------------------------------------------*/

class FlowTypeAction extends CommonAction {
    protected $config=array('app_type'=>'master');

	//过滤查询字段
	function _search_filter(&$map) {
		if (!empty($_POST['keyword'])){
			$map['name'] = array('like', "%" . $_POST['keyword'] . "%");
		}
	}

	function add(){
				
		$widget['editor']=true;
		$this->assign("widget",$widget);
		
		$this -> group_list();
		$user_id = get_user_id();
		$this -> assign("user_id", $user_id);
						
		$this->display();
	}
	
	function index(){
		$model = M("FlowType");
		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		$list = $model -> where($map) -> select();
		$this -> assign('list', $list);
		$this -> group_list();
		$this -> display();
		return;
	}

	function mark() {
   		$action = $_REQUEST['action'];
		$id = $_REQUEST["id"];
		$val = $_REQUEST["val"];
		if (!empty($id)) {
			switch ($action){
				case 'del' :					
						$result=$this->_destory($id,true);
						if ($result) {
							$this -> ajaxReturn('', "删除成功", 1);
						} else {
							$this -> ajaxReturn('', "删除失败", 0);
						}
					break;
				case 'move_folder' :
				$field = 'group';
				$result=$this -> _set_field($id, $field, $val);
				if ($result !== false) {
					$this -> assign('jumpUrl', get_return_url());
					$this -> success('操作成功!');
				} else {
					//失败提示
					$this -> error('操作失败!');
				}
			}
		}
	}
	
	function group_list() {
		$model = M("FlowType");
		$where['group'] = array("neq", "");
		$group_list = $model -> where($where) -> distinct("group") -> field("group") -> select();
		$group_list = rotate($group_list);
		$group_list = array_combine($group_list["group"], $group_list["group"]);
		$this -> assign("group_list", $group_list);
	}

	function edit() {
		$widget['editor']=true;
		$this->assign("widget",$widget);				
		$this -> group_list();
		$user_id = get_user_id();
		$this -> assign("user_id", $user_id);
		$this->_edit();
	}

	function ajaxRead() {
		$type = $_REQUEST['type'];
		$id = $_REQUEST['id'];

		switch ($type) {
			case "company" :
				$model = M("Dept");
				$dept = tree_to_list(list_to_tree(M("Dept")->where('is_del=0') -> select(), $id));
				$dept = rotate($dept);
				$dept = implode(",", $dept['id']) . ",$id";

				$model = M("User");
				$where['dept_id'] = array('in', $dept);
				$data = $model -> where($where) -> field('id,emp_name,dept_id,email') -> select();
				break;
			case "rank" :
				$model = M("User");
				$where['rank_id'] = array('eq', $id);
				$data = $model -> where($where) -> field('id,emp_name,email') -> select();
				break;

			case "position" :
				$model = M("User");
				$where['position_id'] = array('eq', $id);
				$data = $model -> where($where) -> field('id,emp_name,email') -> select();
				break;

			case "personal" :
				$model = M("FlowType");
				if ($id == "#")
					$id = "";
				$where['group'] = array('eq', $id);
				$where['email'] = array('neq', '');
				$where['user_id'] = array('eq', get_user_id());
				$data = $model -> where($where) -> field('id,name as emp_name,email') -> select();
				break;

			default :
		}

		if (true) {// 读取成功
			$this -> ajaxReturn($data, "", 1);
		}
	}

	function json() {
		header("Content-Type:text/html; charset=utf-8");
		$key = $_REQUEST['key'];
		$ajax = $_REQUEST['ajax'];
		//dump($ajax);

		$model = M("User");
		$where['emp_name'] = array('like', "%" . $key . "%");
		$where['letter'] = array('like', "%" . $key . "%");
		$where['email'] = array('like', "%" . $key . "%");
		$where['_logic'] = 'or';
		$company = $model -> where($where) -> field('id,emp_name as name,email') -> select();
		$model = M("FlowType");

		$where['name'] = array('like', "%" . $key . "%");
		$where['letter'] = array('like', "%" . $key . "%");
		$where['email'] = array('like', "%" . $key . "%");
		$where['_logic'] = 'or';
		$map['_complex'] = $where;
		$map['email'] = array('neq', '');
		$map['user_id'] = array('eq', get_user_id());
		$personal = $model -> where($map) -> field('id,name,email') -> select();

		if (empty($company)) {
			$company = array();
		}
		if (empty($personal)) {
			$personal = array();
		}

		$FlowType = array_merge_recursive($company, $personal);
		exit(json_encode($FlowType));
	}
}
?>