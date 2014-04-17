<?php
class NavWidget extends Widget {
	public function render($data) {		
		$tree = $data['tree'];		
		//dump($tree);
		return $this -> tree_nav($tree);
	}

	function tree_nav($tree, $level = 0) {		
		$level++;
		$html = "";
		//dump($tree);
		if (is_array($tree)){			
			if ($level >1) {
				$html = "<ul class='submenu'>\r\n";			
			} else {				
				$html = "<ul class='nav nav-list'>\r\n";				
			}
			foreach ($tree as $val){
				if (isset($val["name"])) {
					$title = $val["name"];
					if (!empty($val["url"])) {
						$url = U($val['url']);
					} else {
						$url = "#";
					}
					if (empty($val["id"])) {
						$id = $val["name"];
					}else{
						$id = $val["id"];
					}
											
					if(empty($val['icon'])){
						$icon="icon-angle-right";
					}else{
						$icon=$val['icon'];
					}					
					if (isset($val['_child'])) {
						$html .= "<li>\r\n";
						$html .= "<a class=\"dropdown-toggle\" node=\"$id\" href=\"" . "$url\">";
						$html .= "<i class=\"$icon\"></i>";
						$html .= "<span class=\"menu-text\">$title</span>";
						$html .= "<b class=\"arrow icon-angle-down\"></b>";
						$html .= "</a>\r\n";
						$html .= $this->tree_nav($val['_child'], $level);
						$html = $html . "</li>\r\n";
					} else {
						$html .="<li>\r\n";
						$html .="<a  node=\"$id\" href=\"" . "$url\">\r\n";
						$html .= "<i class=\"$icon\"></i>";
						$html .= "<span class=\"menu-text\">$title</span>";
						$html .="</a>\r\n</li>\r\n";
					}
				}
			}
			$html = $html . "</ul>\r\n";
		}
		return $html;
	}
}
?>