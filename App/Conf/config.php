<?php
    if (!defined('THINK_PATH')) exit();
    $array=array(    	
        'LOAD_EXT_CONFIG'	=>'db,auth,webchat',
		'VAR_PAGE'	=>'p',
		'TMPL_EXCEPTION_FILE'=>APP_PATH.'/Tpl/Public/error.html',
		'TMPL_NO_HAVE_AUTH'=>APP_PATH.'/Tpl/Public/no_have_auth.html',	
		'TOKEN_ON'=>false, 
		'URL_CASE_INSENSITIVE' =>   true,
		'URL_HTML_SUFFIX' => '',
		'TMPL_CACHE_ON'=>false,
		'DB_FIELDS_CACHE'=>false,
        'SESSION_AUTO_START'=>true,
        'USER_AUTH_KEY'	=>'auth_id',	// 用户认证SESSION标记
        'ADMIN_AUTH_KEY'			=>'administrator',        
        'SEC_KEY'			=>'administrator',        
        'USER_AUTH_GATEWAY'=>'login/index',// 默认认证网关
        'DB_LIKE_FIELDS'            =>'content|remark',
		'SAVE_PATH'=>"Data/Files/",
        'SHOW_PAGE_TRACE'=>0, //显示调试信息
    );
    return $array;
?>