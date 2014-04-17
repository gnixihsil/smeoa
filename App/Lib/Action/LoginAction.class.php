<?php
/*---------------------------------------------------------------------------
  小微OA系统 - 让工作更轻松快乐 

  Copyright (c) 2013 http://www.smeoa.com All rights reserved.                                             

  Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )  

  Author:  jinzhu.yin<smeoa@qq.com>                         

  Support: https://git.oschina.net/smeoa/smeoa        
  
 -------------------------------------------------------------------------*/
class LoginAction extends Action {
	protected $config=array('app_type'=>'public');
	// 检查用户是否登录

	public function index(){
		//如果通过认证跳转到首页
		$this->assign("js_file","js/index");
		$this->assign("title",get_system_config("SYSTEM_NAME"));
		$auth_id = session(C('USER_AUTH_KEY'));
		if (!isset($auth_id)) {
			$this -> display();
		} else {
			redirect(__APP__);
		}
	}

	// 用户登出
	public function logout() {
		$auth_id = session(C('USER_AUTH_KEY'));
		if (isset($auth_id)) {
			session(C('USER_AUTH_KEY'), null);
			session('menu' . $auth_id, null);
			session('menu' . $auth_id, null);
			session('user_pic', null);
			$this -> assign("jumpUrl", __URL__ . '/');
			$this -> success('登出成功！');
		} else {
			$this -> assign("jumpUrl", __URL__ . '/');
			$this -> error('已经登出！');
		}
	}

	// 登录检测
	public function check_login() {
		if (empty($_POST['emp_no'])) {
			$this -> error('帐号必须！');
		} elseif (empty($_POST['password'])) {
			$this -> error('密码必须！');
		}
		//生成认证条件
		$map = array();
		// 支持使用绑定帐号登录
		$map['emp_no'] = $_POST['emp_no'];
		$map["is_del"] = array('eq', 0);
		$model = D("UserView");
		$auth_info = $model -> where($map) -> find();

		//使用用户名、密码和状态的方式进行认证
		if (false === $auth_info) {
			$this -> error('帐号或密码错误！');
		} else {
			if ($auth_info['password'] != md5($_POST['password'])) {
				$this -> error('帐号或密码错误！');
			}
			session(C('USER_AUTH_KEY'), $auth_info['id']);
			session('emp_no', $auth_info['emp_no']);
			session('email', $auth_info['email']);
			session('user_name', $auth_info['name']);
			session('user_pic', $auth_info['pic']);

			session('last_login_time', $auth_info['last_login_time']);
			session('login_count', $auth_info['login_count']);
			session('dept_id', $auth_info['dept_id']);
			session('dept_name', $auth_info['dept_name']);
			if ($auth_info['emp_no'] == 'admin') {
				session(C('ADMIN_AUTH_KEY'), true);
			}

			//保存登录信息
			$User = M('User');
			$ip = get_client_ip();
			$time = time();
			$data = array();
			$data['id'] = $auth_info['id'];
			$data['last_login_time'] = $time;
			$data['login_count'] = array('exp', 'login_count+1');
			$data['last_login_ip'] = $ip;
			$User -> save($data);
			$this -> assign('jumpUrl', U("index/index"));
			$this -> success('登录成功！');
		}
	}

	public function verify() {
		$type = isset($_GET['type']) ? $_GET['type'] : 'gif';
		import("@.ORG.Util.Image");
		Image::buildImageVerify(4, 1, $type);
	}
}
?>