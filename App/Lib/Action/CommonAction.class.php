<?php
/*---------------------------------------------------------------------------
 小微OA系统 - 让工作更轻松快乐

 Copyright (c) 2013 http://www.smeoa.com All rights reserved.

 Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )

 Author:  jinzhu.yin<smeoa@qq.com>

 Support: https://git.oschina.net/smeoa/smeoa
 -------------------------------------------------------------------------*/

class CommonAction extends Action {

	function _initialize() {
		$auth_id = session(C('USER_AUTH_KEY'));
		if (!isset($auth_id)) {
			//跳转到认证网关
			redirect(U(C('USER_AUTH_GATEWAY')));
		}
		$this -> assign('js_file', 'js/' . ACTION_NAME);
		$this -> _assign_menu();
		$this->_assign_new_count();
	}

	/**列表页面 **/
	function index() {
		$this -> _index();
	}

	/**查看页面 **/
	function read() {
		$this -> _edit();
	}

	/**编辑页面 **/
	function edit() {
		$this -> _edit();
	}

	/** 保存操作  **/
	function save() {
		$opmode = $_POST["opmode"];
		if ($opmode == "add") {
			$this -> _insert();
		}
		if ($opmode == "edit") {
			$this -> _update();
		}
	}

	/**列表页面 **/
	protected function _index() {
		$map = $this -> _search();
		if (method_exists($this, '_search_filter')) {
			$this -> _search_filter($map);
		}
		$name = $this -> getActionName();
		$model = D($name);

		if (!empty($model)) {
			$this -> _list($model, $map);
		}
		$this -> display();
	}

	/**编辑页面 **/
	protected function _edit() {
		$name = $this -> getActionName();
		$model = M($name);
		$id = $_REQUEST[$model -> getPk()];
		$vo = $model -> getById($id);
		if ($this -> isAjax()) {
			if ($vo !== false) {// 读取成功
				$this -> ajaxReturn($vo, "", 0);
			} else {
				die ;
			}
		}
		if (isset($vo['add_file'])) {
			$this -> _assign_file_list($vo["add_file"]);
		};
		$this -> assign('vo', $vo);
		$this -> display();
	}

	/** 插入新新数据  **/
	protected function _insert() {
		$name = $this -> getActionName();
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		if (in_array('user_id', $model -> getDbFields())) {
			$model -> user_id = get_user_id();
		};
		if (in_array('user_name', $model -> getDbFields())) {
			$model -> user_name = get_user_name();
		};
		/*保存当前数据对象 */
		$list = $model -> add();
		if ($list !== false) {//保存成功
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('新增成功!');
		} else {
			$this -> error('新增失败!');
			//失败提示
		}
	}

	/* 更新数据  */
	protected function _update() {
		$name = $this -> getActionName();
		$model = D($name);
		if (false === $model -> create()) {
			$this -> error($model -> getError());
		}
		$list = $model -> save();
		if (false !== $list) {
			$this -> assign('jumpUrl', get_return_url());
			$this -> success('编辑成功!');
			//成功提示
		} else {
			$this -> error('编辑失败!');
			//错误提示
		}
	}

	protected function _upload() {
		header("Expires: Mon, 26 Jul 1997 05:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Pragma: no-cache");
		if (!empty($_FILES)){
			import("@.ORG.Util.UploadFile");
			$upload = new UploadFile();
			$upload -> subFolder = strtolower(MODULE_NAME);
			$upload -> savePath = get_save_path();
			$upload -> saveRule = "uniqid";
			$upload -> autoSub = true;
			$upload -> subType = "date";
			$upload -> allowExts = array_filter(explode(",",get_system_config('UPLOAD_FILE_TYPE')),'upload_filter');
			if (!$upload -> upload()) {
				$data['error'] = 1;
				$data['message'] = $upload -> getErrorMsg();
				$data['status'] = 0;
				exit(json_encode($data));
				//exit($upload -> getErrorMsg());
			} else {
				//取得成功上传的文件信息
				$upload_list = $upload -> getUploadFileInfo();
				$sid=get_sid();
				$file_info = $upload_list[0];
				$model = M("File");
				$model -> create($upload_list[0]);
				$model -> create_time = time();
				$model -> user_id = get_user_id();
				$model -> sid=$sid;
				$model -> module=MODULE_NAME;
				$file_id = $model -> add();
				$file_info['sid'] = $sid;
				$file_info['error'] = 0;
				$file_info['url'] = "/" . $file_info['savepath'] . $file_info['savename'];
				$file_info['status'] = 1;
				//header("Content-Type:text/html; charset=utf-8");
				exit(json_encode($file_info));
				//$this->ajaxReturn(json_encode($file_info),'上传成功',1,$file_info['url']);
				//$this->success ('上传成功！');
			}
		}
	}

	protected function _down() {
		$attach_id = $_REQUEST["attach_id"];
		$file_id = f_decode($attach_id);
		$File = M("File") -> find($file_id);
		$filepath = get_save_path(). $File['savename'];
		$filePath = realpath($filepath);
		$fp = fopen($filePath, 'rb');
		$ext = $File['ext'];

		//$filePath = realpath($filepath);
		$query = file_get_contents($filepath);
		//$query = file_get_contents($filepath);

		$filetype['chm'] = 'application/octet-stream';
		$filetype['ppt'] = 'application/vnd.ms-powerpoint';
		$filetype['xls'] = 'application/vnd.ms-excel';
		$filetype['doc'] = 'application/msword';
		$filetype['pptx'] = 'application/vnd.ms-powerpoint';
		$filetype['xlsx'] = 'application/vnd.ms-excel';
		$filetype['docx'] = 'application/msword';
		$filetype['exe'] = 'application/octet-stream';
		$filetype['rar'] = 'application/octet-stream';
		$filetype['js'] = "javascript/js";
		$filetype['css'] = "text/css";
		$filetype['hqx'] = "application/mac-binhex40";
		$filetype['bin'] = "application/octet-stream";
		$filetype['oda'] = "application/oda";
		$filetype['pdf'] = "application/pdf";
		$filetype['ai'] = "application/postsrcipt";
		$filetype['eps'] = "application/postsrcipt";
		$filetype['es'] = "application/postsrcipt";
		$filetype['rtf'] = "application/rtf";
		$filetype['mif'] = "application/x-mif";
		$filetype['csh'] = "application/x-csh";
		$filetype['dvi'] = "application/x-dvi";
		$filetype['hdf'] = "application/x-hdf";
		$filetype['nc'] = "application/x-netcdf";
		$filetype['cdf'] = "application/x-netcdf";
		$filetype['latex'] = "application/x-latex";
		$filetype['ts'] = "application/x-troll-ts";
		$filetype['src'] = "application/x-wais-source";
		$filetype['zip'] = "application/zip";
		$filetype['bcpio'] = "application/x-bcpio";
		$filetype['cpio'] = "application/x-cpio";
		$filetype['gtar'] = "application/x-gtar";
		$filetype['shar'] = "application/x-shar";
		$filetype['sv4cpio'] = "application/x-sv4cpio";
		$filetype['sv4crc'] = "application/x-sv4crc";
		$filetype['tar'] = "application/x-tar";
		$filetype['ustar'] = "application/x-ustar";
		$filetype['man'] = "application/x-troff-man";
		$filetype['sh'] = "application/x-sh";
		$filetype['tcl'] = "application/x-tcl";
		$filetype['tex'] = "application/x-tex";
		$filetype['texi'] = "application/x-texinfo";
		$filetype['texinfo'] = "application/x-texinfo";
		$filetype['t'] = "application/x-troff";
		$filetype['tr'] = "application/x-troff";
		$filetype['roff'] = "application/x-troff";
		$filetype['shar'] = "application/x-shar";
		$filetype['me'] = "application/x-troll-me";
		$filetype['ts'] = "application/x-troll-ts";
		$filetype['gif'] = "image/gif";
		$filetype['jpeg'] = "image/pjpeg";
		$filetype['jpg'] = "image/pjpeg";
		$filetype['jpe'] = "image/pjpeg";
		$filetype['ras'] = "image/x-cmu-raster";
		$filetype['pbm'] = "image/x-portable-bitmap";
		$filetype['ppm'] = "image/x-portable-pixmap";
		$filetype['xbm'] = "image/x-xbitmap";
		$filetype['xwd'] = "image/x-xwindowdump";
		$filetype['ief'] = "image/ief";
		$filetype['tif'] = "image/tiff";
		$filetype['tiff'] = "image/tiff";
		$filetype['pnm'] = "image/x-portable-anymap";
		$filetype['pgm'] = "image/x-portable-graymap";
		$filetype['rgb'] = "image/x-rgb";
		$filetype['xpm'] = "image/x-xpixmap";
		$filetype['txt'] = "text/plain";
		$filetype['c'] = "text/plain";
		$filetype['cc'] = "text/plain";
		$filetype['h'] = "text/plain";
		$filetype['html'] = "text/html";
		$filetype['htm'] = "text/html";
		$filetype['htl'] = "text/html";
		$filetype['rtx'] = "text/richtext";
		$filetype['etx'] = "text/x-setext";
		$filetype['tsv'] = "text/tab-separated-values";
		$filetype['mpeg'] = "video/mpeg";
		$filetype['mpg'] = "video/mpeg";
		$filetype['mpe'] = "video/mpeg";
		$filetype['avi'] = "video/x-msvideo";
		$filetype['qt'] = "video/quicktime";
		$filetype['mov'] = "video/quicktime";
		$filetype['moov'] = "video/quicktime";
		$filetype['movie'] = "video/x-sgi-movie";
		$filetype['au'] = "audio/basic";
		$filetype['snd'] = "audio/basic";
		$filetype['wav'] = "audio/x-wav";
		$filetype['aif'] = "audio/x-aiff";
		$filetype['aiff'] = "audio/x-aiff";
		$filetype['aifc'] = "audio/x-aiff";
		$filetype['swf'] = "application/x-shockwave-flash";

		$ua = $_SERVER["HTTP_USER_AGENT"];
		if (!preg_match("/MSIE/", $ua)) {
			header("Content-Length: " . filesize($filePath));
			header("Content-type:" . $filetype[$ext]);
			header("Content-Length: " . filesize($filePath));
			header("Accept-Ranges: bytes");
			header("Accept-Length: " . filesize($filePath));
		}

		header("Content-Disposition:attachment;filename =" . str_ireplace('+', '%20', URLEncode($File['name'])));
		header('Cache-Control:must-revalidate, post-check=0,pre-check=0');
		header('Expires:     0');
		header('Pragma:     public');
		//echo $query;
		fpassthru($fp);
		exit ;
	}

	/** 删除数据  **/
	protected function _del($id, $return = false){
		$name = $this -> getActionName();
		$model = M($name);
		if (!empty($model)){
			$pk = $model -> getPk();
			if (isset($id)) {
				if (is_array($id)){
					$where[$pk] = array("in", array_filter($id));
				} else {
					$where[$pk] = array('in', array_filter(explode(',', $id)));
				}
				$result = $model -> where($where) -> setField("is_del", 1);
				if ($return) {
					return $result;
				}
				if ($result !== false) {
					$this -> assign('jumpUrl', get_return_url());
					$this -> success("成功删除{$result}条!");
				} else {
					$this -> error('删除失败!');
				}
			} else {
				$this -> error('没有可删除的数据!');
			}
		}
	}

	/** 删除数据  **/
	protected function _destory($id) {
		$name = $this -> getActionName();
		$model = M($name);
		if (!empty($model)) {
			$pk = $model -> getPk();
			if (isset($id)) {
				if (is_array($id)) {
					$where[$pk] = array("in", array_filter($id));
				} else {
					$where[$pk] = array('in', array_filter(explode(',', $id)));
				}

				$app_type = $this -> config['app_type'];

				switch ($app_type) {
					case 'personal' :
						$where['user_id'] = get_user_id();
						break;
					default :
						break;
				}
				$file_list = $model -> where($where) -> getField("id,add_file");
				$file_list = array_filter(explode(";", implode($file_list)));
				$this -> _destory_file($file_list);

				$result = $model -> where($where) -> delete();
				if ($result !== false) {
					$this -> assign('jumpUrl', get_return_url());
					$this -> success("彻底删除{$result}条!");
				} else {
					$this -> error('删除失败!');
				}
			} else {
				$this -> error('没有可删除的数据!');
			}
		}
	}

	public function del_file(){
		$file_list=$_REQUEST['sid'];
		$this->_destory_file($file_list);
	}
	protected function _destory_file($file_list){
		if(isset($file_list)){
			if (is_array($file_list)){
				$where["sid"] = array("in", $file_list);
			} else {
				$where["sid"] = array('in',array_filter(explode(',', $file_list)));
			}
		}

		$model = M("File");
		$where['module']=MODULE_NAME;
		$admin = $this -> config['auth']['admin'];
		if ($admin) {
			$where['user_id'] = array('eq', get_user_id());
		};
		$list = $model -> where($where) -> select();
		$save_path = get_save_path();

		foreach ($list as $file){
			if (file_exists($_SERVER["DOCUMENT_ROOT"] . "/" . $save_path . $file['savename'])) {
				unlink($_SERVER["DOCUMENT_ROOT"] . "/" . $save_path . $file['savename']);
			}
		}
		$result = $model -> where($where) -> delete();
		if ($result !== false) {
			return true;
		} else {
			return false;
		}
	}

	//生成查询条件
	protected function _search($name = '') {
		$map = array();
		//过滤非查询条件
		$request = array_filter(array_keys(array_filter($_REQUEST)), "filter_search_field");
		if (empty($name)) {
			$name = $this -> getActionName();
		}
		$model = D($name);
		$fields = get_model_fields($model);

		foreach ($request as $val) {
			if (!in_array(substr($val, 3), $fields)) {
				continue;
			}
			if (substr($val, 0, 3) == "be_") {
				if (isset($_REQUEST["en_" . substr($val, 3)])) {
					if (strpos($val, "time")) {
						$map[substr($val, 3)] = array( array('egt', date_to_int(trim($_REQUEST[$val]))), array('elt', date_to_int(trim($_REQUEST["en_" . substr($val, 3)]))));
					}
					if (strpos($val, "date")) {
						$map[substr($val, 3)] = array( array('egt', trim($_REQUEST[$val])), array('elt', trim($_REQUEST["en_" . substr($val, 3)])));
					}
				}
			}

			if (substr($val, 0, 3) == "bt_") {
				$array_date = explode("|", str_replace(" - ", '|', $_REQUEST[$val]));
				if (strpos($val, "time")) {
					$map[substr($val, 3)] = array( array('egt', date_to_int($array_date[0]), array('elt', date_to_int($array_date[0]))));
				}
				if (strpos($val, "date")) {
					$map[substr($val, 3)] = array( array('egt', $array_date[0], array('elt', $array_date[1])));
				}
			}

			if (substr($val, 0, 3) == "li_") {
				$map[substr($val, 3)] = array('like', '%' . trim($_REQUEST[$val]) . '%');
			}
			if (substr($val, 0, 3) == "eq_") {
				$map[substr($val, 3)] = array('eq', trim($_REQUEST[$val]));
			}
			if (substr($val, 0, 3) == "gt_") {
				$map[substr($val, 3)] = array('egt', trim($_REQUEST[$val]));
			}
			if (substr($val, 0, 3) == "lt_") {
				$map[substr($val, 3)] = array('elt', trim($_REQUEST[$val]));
			}
		}
		return $map;
	}

	protected function _list($model, $map, $sortBy = '', $asc = false) {
		//排序字段 默认为主键名
		if (isset($_REQUEST['_order'])) {
			$order = $_REQUEST['_order'];
		} else if (!empty($sortBy)) {
			$order = $sortBy;
		} else if (in_array('sort', get_model_fields($model))) {
			$order = 'sort';
			$asc = true;
		} else {
			$order = $model -> getPk();
		}
		//排序方式默认按照倒序排列
		//接受 sost参数 0 表示倒序 非0都 表示正序
		if (isset($_REQUEST['_sort'])) {
			$sort = $_REQUEST['_sort'] ? 'asc' : 'desc';
		} else {
			$sort = $asc ? 'asc' : 'desc';
		}
		//取得满足条件的记录数

		$count_model = clone $model;
		//取得满足条件的记录数
		if (!empty($count_model -> pk)) {
			$count = $count_model -> where($map) -> count($model -> pk);
		} else {
			$count = $count_model -> where($map) -> count();
		}
		if ($count > 0) {
			import("@.ORG.Util.Page");
			//创建分页对象
			if (!empty($_REQUEST['list_rows'])) {
				$listRows = $_REQUEST['list_rows'];
			} else {
				$listRows = get_user_config('list_rows');
			}
			$p = new Page($count, $listRows);
			//分页查询数据
			$voList = $model -> where($map) -> order("`" . $order . "` " . $sort) -> limit($p -> firstRow . ',' . $p -> listRows) -> select();
			$p -> parameter = $this -> _search();
			//分页显示
			$page = $p -> show();

			//列表排序显示
			$sortImg = $sort;

			//排序图标
			$sortAlt = $sort == 'desc' ? '升序排列' : '倒序排列';

			//排序提示
			$sort = $sort == 'desc' ? 1 : 0;

			//排序方式

			//模板赋值显示

			$name = $this -> getActionName();
			$this -> assign('list', $voList);
			$this -> assign('sort', $sort);
			$this -> assign('order', $order);
			$this -> assign('sortImg', $sortImg);
			$this -> assign('sortType', $sortAlt);
			$this -> assign("page", $page);
		}
		return;
	}

	/**显示top menu及 left menu **/

	protected function _assign_menu() {
		$model = D("Node");
		$user_id = get_user_id();
		if (session('menu' . $user_id)) {
			//如果已经缓存，直接读取缓存
			$menu = session('menu' . $user_id);
		} else {
			//读取数据库模块列表生成菜单项
			$menu = D("Node") -> access_list();
			$system_folder_menu = D("SystemFolder") -> get_folder_menu();
			$user_folder_menu = D("UserFolder") -> get_folder_menu();
			$menu = array_merge($menu, $system_folder_menu, $user_folder_menu);
			//缓存菜单访问
			session('menu' . $user_id, $menu);
		}

		$tree = list_to_tree($menu);
		$this -> assign('tree', $tree);
	}

	protected function _assign_folder_list() {
		if ($this -> config['app_type'] == 'personal') {
			$model = D("UserFolder");
		} else {
			$model = D("SystemFolder");
		}
		$list = $model -> get_folder_list();
		$tree = list_to_tree($list);
		$this -> assign('folder_list', dropdown_menu($tree));
	}

	protected function _assign_file_list($add_file) {
		$files = array_filter(explode(';', $add_file));
		$where['sid'] = array('in', $files);
		$where['module']=MODULE_NAME;
		$model = M("File");
		$list = $model -> where($where) -> select();
		$this -> assign('file_list', $list);
	}

	protected function _assign_new_count($refresh=false) {
		$new_count_data = array ();
		$new_count_data = S('S_GET_NEW_COUNT'); // 从缓存获取数据
 
		if (is_array($new_count_data)&&!$refresh){
			$nowtime = time ();
			$difftime = $nowtime - $new_count_data ['expire_time']; // 判断缓存里面的数据保存了多久；
			if ($difftime > 300) { // 缓存有效时间时间300 判断超过300就重新获取;
				$new_count_data ['expire_time'] = time ();
				$new_count_data ['data'] = get_new_count(); // 获取最新数据
				S( 'S_GET_NEW_COUNT', $new_count_data); // 放进缓存
			} else {
				$data = $new_count_data ['data'] ;
			}
		} else {
			$new_count_data ['expire_time'] = time ();
			$new_count_data ['data'] =  get_new_count(); // 获取最新数据
			S('S_GET_NEW_COUNT', $new_count_data); // 放进缓存
		}
		$this->assign('new_mail_count',$data['new_mail_count']);
		$this->assign('new_notice_count',$data['new_notice_count']);
		$this->assign('new_todo_count',$data['new_todo_count']);
		$this->assign('new_confirm_count',$data['new_confirm_count']);
	}

	protected function _set_field($id, $field, $val, $name = '') {
		if (empty($name)) {
			$name = $this -> getActionName();
		}
		$model = M($name);
		if (!empty($model)) {
			$pk = $model -> getPk();
			if (isset($id)) {
				if (is_array($id)) {
					$where[$pk] = array("in", $id);
				} else {
					$where[$pk] = array('in',array_filter(explode(',', $id)));
				}
				$admin = $this -> config['auth']['admin'];
				if (in_array('user_id', $model -> getDbFields()) && !$admin) {
					$where['user_id'] = array('eq', get_user_id());
				};
				$list = $model -> where($where) -> setField($field, $val);
				if ($list !== false) {
					return true;
				} else {
					return false;
				}
			} else {
				return false;
			}
		}
	}

	protected function _tag_manage($tag_name) {
		$this -> assign("tag_name", $tag_name);
		if ($this -> config['app_type'] == 'personal') {
			R('UserTag/index');
			$this -> assign('js_file', "UserTag:js/index");
		} else {
			R('SystemTag/index');
			$this -> assign('js_file', "SystemTag:js/index");
		}
	}

	protected function _pushReturn($data, $info, $status, $time = null) {
		$user_id = get_user_id();
		$model = M("Push");
		$model -> user_id = $user_id;
		$model -> data = $data;
		$model -> status = $status;
		$model -> info = $info;
		if (empty($time)) {
			$model -> time = time();
		} else {
			$model -> time = $time;
		}
		$model -> add();
		exit();
	}
}
?>