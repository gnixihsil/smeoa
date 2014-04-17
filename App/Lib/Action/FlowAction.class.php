<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

class FlowAction extends CommonAction {
	protected $config = array('app_type' => 'flow', 'action_auth' => array('folder' => 'read', 'mark' => 'admin'));

	function _search_filter(&$map) {
		$map['is_del'] = array('eq', '0');
		if (!empty($_REQUEST['keyword'])) {
			$keyword = $_POST['keyword'];
			$where['name'] = array('like', "%" . $keyword . "%");
			$where['content'] = array('like', "%" . $keyword . "%");			
			$where['_logic'] = 'or';
			$map['_complex'] = $where;
		}		
	}

	function index() {
		$this -> _assign_group_list();
		$model = M('FlowType');
		if (!empty($_POST['group'])) {
			$where['group'] = $_POST['group'];
			if ($where['group'] == "全部") {
				$where = array();
			}
		}

		$where['is_del'] = 0;
		$list = $model -> where($where) -> select();
		$this -> assign("list", $list);
		$this -> display();
	}

	function folder() {
		$widget['date-range'] = true;
		$this -> assign("widget", $widget);

		$folder = $_REQUEST['fid'];
		$this -> assign("folder", $folder);
		$emp_no = get_emp_no();
		$user_id = get_user_id();

		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}

		switch ($folder) {
			case 'confirm' :
				$this -> assign("folder_name", '待审批');
				$FlowLog = M("FlowLog");
				$where['emp_no'] = $emp_no;
				$where['_string'] = "result is null";
				$log_list = $FlowLog -> where($where) -> field('flow_id') -> select();
				$log_list = rotate($log_list);
				if (!empty($log_list)) {
					$map['id'] = array('in', $log_list['flow_id']);
				} else {
					$this -> display();
					return;
				}
				break;

			case 'darft' :
				$this -> assign("folder_name", '草稿箱');
				$map['user_id'] = $user_id;
				$map['step'] = 10;
				break;

			case 'submit' :
				$this -> assign("folder_name", '已提交');
				$map['user_id'] = $user_id;
				$map['step'] = array('gt', 10);
				break;

			case 'finish' :
				$this -> assign("folder_name", '已办理');
				$FlowLog = M("FlowLog");
				$where['emp_no'] = $emp_no;
				$where['_string'] = "result is not null";
				$log_list = $FlowLog -> where($where) -> field('flow_id') -> select();
				$log_list = rotate($log_list);
				if (!empty($log_list)) {
					$map['id'] = array('in', $log_list['flow_id']);
				} else {
					$this -> display();
					return;
				}
				break;

			default :
				break;
		}
		$model = M("Flow");
		$this -> _list($model, $map);
		$this -> display();
	}

	function add() {
		$widget['uploader'] = true;
		$widget['editor'] = true;
		$this -> assign("widget", $widget);

		$type = $_REQUEST['type'];
		$model = M("FlowType");
		$flow_type = $model -> find($type);
		$this -> assign("flow_type", $flow_type);
		$this -> display();
	}

	function read() {
		$model = D("Flow");
		$id = $_REQUEST['id'];
		$vo = $model -> getById($id);
		$flow_type_id=$vo['type'];
		$this -> assign('vo', $vo);
		$this -> assign("emp_no", $vo['emp_no']);
		$this -> assign("user_name", $vo['user_name']);
		if (in_array('add_file', $model -> getDbFields())) {
			$this -> _assign_file_list($vo["add_file"]);
		};

		$model = M("FlowType");
		
		$flow_type= $model -> find($flow_type_id);
		$this -> assign("flow_type", $flow_type);

		$model = M("FlowLog");
		$where['flow_id'] = $id;
		$where['_string'] = "result is not null";
		$flow_log = $model -> where($where) -> select();
		$this -> assign("flow_log", $flow_log);

		$where = array();
		$where['flow_id'] = $id;
		$where['emp_no'] = get_emp_no();
		$where['_string'] = "result is null";
		$to_confirm = $model -> where($where) -> find();
		$this -> assign("to_confirm", $to_confirm);

		if (!empty($to_confirm)) {
			$is_edit = $flow_type['is_edit'];
			$this -> assign("is_edit", $is_edit);
			if (!empty($is_edit)) {
				$widget['uploader'] = true;
				$widget['editor'] = true;
				$this -> assign("widget", $widget);
			}
		}

		$where = array();
		$where['flow_id'] = $id;
		$where['_string'] = "result is not null";
		$confirmed = $model -> where($where) -> field('emp_no,user_name') -> select();
		$this -> assign("confirmed", $confirmed);
		$this -> display();
	}

	function edit() {
		$widget['uploader'] = true;
		$widget['editor'] = true;
		$this -> assign("widget", $widget);

		$model = D("Flow");
		$id = $_REQUEST['id'];
		$vo = $model -> getById($id);
		$this -> assign('vo', $vo);
		if (in_array('add_file', $model -> getDbFields())) {
			$this -> _assign_file_list($vo["add_file"]);
		};

		$model = M("FlowType");
		$type = $vo['type'];
		$flow_type = $model -> find($type);
		$this -> assign("flow_type", $flow_type);
		$model = M("FlowLog");
		$where['flow_id'] = $id;
		$where['_string'] = "result is not null";
		$flow_log = $model -> where($where) -> select();

		$this -> assign("flow_log", $flow_log);
		trace($flow_log);
		$where = array();
		$where['flow_id'] = $id;
		$where['emp_no'] = get_emp_no();
		$where['_string'] = "result is null";
		$confirm = $model -> where($where) -> select();
		$this -> assign("confirm", $confirm[0]);
		$this -> display();
	}

	public function mark() {
		$action = $_REQUEST['action'];
		$user_id = $_REQUEST['user_id'];
		$emp_no=$_REQUEST['emp_no'];

		switch ($action) {
			case 'approve' :
				$model = D("FlowLog");
				if (false === $model -> create()) {
					$this -> error($model -> getError());
				}
				$model -> result = 1;
				if (in_array('user_id', $model -> getDbFields())) {
					$model -> user_id = get_user_id();
				};
				if (in_array('user_name', $model -> getDbFields())) {
					$model -> user_name = get_user_name();
				};

				$flow_id = $model -> flow_id;
				$step = $model -> step;
				//保存当前数据对象
				$list = $model -> save();

				$model = D("FlowLog");
				$model -> where("step=$step and flow_id=$flow_id and result is null") ->delete();

				if ($list !== false) {//保存成功
					D("Flow") -> next_step($flow_id,$step);
					$this -> assign('jumpUrl', get_return_url());
					$this -> success('操作成功!');
				} else {
					//失败提示
					$this -> error('操作失败!');
				}
				break;
			case 'back' :		
				
				$model = D("FlowLog");
				if (false === $model -> create()) {
					$this -> error($model -> getError());
				}
				$model -> result = 2;
				if (in_array('user_id', $model -> getDbFields())) {
					$model -> user_id = get_user_id();
				};
				if (in_array('user_name', $model -> getDbFields())) {
					$model -> user_name = get_user_name();
				};

				$flow_id = $model -> flow_id;
				$step = $model -> step;
				//保存当前数据对象
				$list = $model -> save();

				$model = D("FlowLog");
				$model -> where("step=$step and flow_id=$flow_id and result is null") ->delete();

				if ($list !== false) {//保存成功					
					D("Flow") -> next_step($flow_id,$step,$emp_no);
					$this -> assign('jumpUrl', get_return_url());
					$this -> success('操作成功!');
				} else {
					//失败提示
					$this -> error('操作失败!');
				}
				break;				
			case 'reject' :
				$model = D("FlowLog");
				if (false === $model -> create()) {
					$this -> error($model -> getError());
				}
				$model -> result = 0;
				if (in_array('user_id', $model -> getDbFields())) {
					$model -> user_id = get_user_id();
				};
				if (in_array('user_name', $model -> getDbFields())) {
					$model -> user_name = get_user_name();
				};

				$flow_id = $model -> flow_id;
				$step = $model -> step;
				//保存当前数据对象
				$list = $model -> save();
				//可以裁决的人有多个人的时候，一个人评价完以后，禁止其他人重复裁决。
				$model = D("FlowLog");
				$model -> where("step=$step and flow_id=$flow_id and result is null") ->delete();

				if ($list !== false) {//保存成功
					D("Flow") -> where("id=$flow_id") -> setField('step', 0);
					$this -> assign('jumpUrl', get_return_url());
					$this -> success('操作成功!');
				} else {
					//失败提示
					$this -> error('操作失败!');
				}
				break;
			default :
				break;
		}
	}

	public function approve() {
		$model = D("FlowLog");
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		$model -> result = 1;
		if (in_array('user_id', $model -> getDbFields())) {
			$model -> user_id = get_user_id();
		};
		if (in_array('user_name', $model -> getDbFields())) {
			$model -> user_name = get_user_name();
		};

		$flow_id = $model -> flow_id;
		$step = $model -> step;
		//保存当前数据对象
		$list = $model -> save();

		$model = D("FlowLog");
		$model -> where("step=$step and flow_id=$flow_id and result is null") -> setField('is_del', 1);

		if ($list !== false) {//保存成功
			D("Flow") -> next_step($flow_id, $step);
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('操作成功!');
		} else {
			//失败提示
			$this -> error('操作失败!');
		}
	}

	public function reject() {
		$model = D("FlowLog");
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		$model -> result = 0;
		if (in_array('user_id', $model -> getDbFields())) {
			$model -> user_id = get_user_id();
		};
		if (in_array('user_name', $model -> getDbFields())) {
			$model -> user_name =get_user_name();
		};

		$flow_id = $model -> flow_id;
		$step = $model -> step;
		//保存当前数据对象
		$list = $model -> save();
		//可以裁决的人有多个人的时候，一个人评价完以后，禁止其他人重复裁决。
		$model = D("FlowLog");
		$model -> where("step=$step and flow_id=$flow_id and result is null") -> setField('is_del', 1);

		if ($list !== false) {//保存成功
			D("Flow") -> where("id=$flow_id") -> setField('step', 0);
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('操作成功!');
		} else {
			//失败提示
			$this -> error('操作失败!');
		}
	}

	public function down() {
		$this -> _down();
	}

	public function upload() {
		$this -> _upload();
	}

	protected function _assign_group_list() {
		$model = M("FlowType");
		$where['group'] = array("neq", "");
		$group_list = $model -> where($where) -> distinct("group") -> field("group") -> select();
		$group_list = rotate($group_list);
		$group_list = array_combine($group_list["group"], $group_list["group"]);
		$this -> assign("group_list", $group_list);
	}

}
