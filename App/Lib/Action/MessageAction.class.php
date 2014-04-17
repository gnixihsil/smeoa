<?php
class MessageAction extends CommonAction {

	private $_User;
	//过滤查询字段
	function _filter(&$map) {
		$map['status'] = array('eq', '1');
		$map['owner'] = $_SESSION['emp_no'];
		if (!empty($_REQUEST['keyword'])) {
			$map['content'] = array('like', "%" . $_POST['keyword'] . "%");
		}
	}

	public function _initialize() {
		parent::_initialize();
		$model = D('User');
		$this -> _User = $model -> getField('emp_no,emp_name');
	}

	public function _conv_data(&$item) {
		if (isset($item['sender'])) {
			$item['sender_name'] = $this -> _User[$item['sender']];
		}
		if (isset($item['recever'])) {
			$item['recever_name'] = $this -> _User[$item['recever']];
		}
		return $item;
	}

	public function _conv_list($list) {
		$list = array_map(array(__CLASS__, '_conv_data'), $list);
		return $list;
	}

	public function index() {
		//列表过滤器，生成查询Map对象
		C('SHOW_RUN_TIME', false);
		// 运行时间显示
		C('SHOW_PAGE_TRACE', false);
		$model = D("Message");
		if (empty($_POST['keyword'])) {
			$list = $model -> get_list();
			$this -> assign('list', $list);
		} else {
			if (method_exists($this, '_filter')) {
				$this -> _filter($map);
			}

			$map['sender|recever'] = $_SESSION['emp_no'];
			if (!empty($model)) {
				$this -> _list($model, $map);
			}
		}
		$this -> display();
		return;
	}

	function new_count() {
		$model = M("Message");
		$where['owner'] = $_SESSION['emp_no'];
		$where['recever'] = $_SESSION['emp_no'];
		$where['read'] = 0;
		return $model -> where($where) -> count('id');
	}

	function insert() {
		$recever_list = $_POST['recever_list'];
		$arr_recever = explode("|", $recever_list);
		array_pop($arr_recever);
		foreach ($arr_recever as $val) {
			$model = D('Message');
			if (false === $model -> create()) {
				$this -> error($model -> getError());
			}
			$model -> sender = $this -> _session('emp_no');
			$model -> recever = $val;
			$model -> owner = $this -> _session('emp_no');
			$list = $model -> add();
			if (false === $model -> create()) {
				$this -> error($model -> getError());
			}
			$model -> sender = $this -> _session('emp_no');
			$model -> recever = $val;
			$model -> owner = $val;
			$list = $model -> add();
		}
		//保存当前数据对象
		if ($list !== false) {//保存成功
			$this -> assign('jumpUrl', $this -> get_return_url());
			$this -> success('新增成功!');
		} else {
			//失败提示
			$this -> error('新增失败!');
		}
	}

	public function read() {

		$send_emp_no = $_REQUEST['emp'];
		$sender['sender'] = $send_emp_no;
		$this -> _conv_data($sender);
		$this -> assign('sender', $sender);
		$recev_emp_no = $_SESSION['emp_no'];

		$model = M("Message");
		$where['owner'] = $_SESSION['emp_no'];
		$where['_string'] = "(sender='$send_emp_no' and recever='$recev_emp_no') or (recever='$send_emp_no' and sender='$recev_emp_no')";
		$model -> where($where) -> setField('read', '1');
		$list = $model -> where($where) -> order('create_time desc') -> select();
		$this -> assign('list', $list);
		$this -> display();

	}

	public function del() {

		$id = $_REQUEST['id'];
		$where['id'] = array('in', explode(',', $id));
		$list = M("Message") -> where($where) -> getfield('sender,recever');

		foreach ($list as $sender => $recever) {
			$model = M("Message");
			$map['sender'] = $sender;
			$map['recever'] = $recever;
			$map['owner'] = $_SESSION['emp_no'];
			$map['status'] = 1;
			$model -> where($map) -> setField('status', 0);
			$map['sender'] = $recever;
			$map['recever'] = $sender;
			$map['owner'] = $_SESSION['emp_no'];
			$map['status'] = 1;
			$model -> where($map) -> setField('status', 0);
		}
		$this -> ajaxReturn('', "删除成功", 1);
	}

	public function upload() {
		R('File/upload');
	}

	public function down() {
		$attach_id = $_REQUEST["attach_id"];
		if ($auth == $user_id) {
			R("File/down", array($attach_id));
			return;
		}
	}

}
