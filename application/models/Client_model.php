<?php
/**
 * Created by PhpStorm.
 * User: 1992b
 * Date: 7/5/2019
 * Time: 9:46 PM
 */

class Client_model extends CI_Model{
	private $avgFlag=false;
	//calling functions

	// public function insertClient($data1){
	// 	$this->db->insert('client_info', $data1);
	// 	$Info = $this->db->insert_id();
	// 	return $Info;
	// }

	public function getClientDetails($id){
		$this->db->select('*');
		$this->db->from('client_info');
		$this->db->like('client_info.client_pairID',$id,'after');
		$rslt = $this->db->get();
		$result = $rslt->result_array();
		return $result;
	}

	public function getClientContact($id){
		$this->db->select('tbl_contact.id,
			tbl_contact.contact_value,
			tbl_contact.contact_type_id,
			tbl_contact_type.contact_type,
			tbl_contact_type.parent_id');
		$this->db->from('tbl_contact');
		$this->db->join('tbl_contact_type','tbl_contact.contact_type_id=tbl_contact_type.id', 'left');
		$this->db->where('tbl_contact.user_id',$id);
		$rslt = $this->db->get();
		$result = $rslt->result_array();
		return $result;
	}

	public function getClientOrderDetails($id, $start_date, $end_date){
		$m_response=array();
		$clientList=$this->getClientDetails($id);
		$count=0;
		foreach ($clientList as $item){
			$m_response[$count]=$item;
			if ($start_date==$end_date){
				$this->avgFlag=false;
				$m_response[$count]['data_type']="not avg";
			}else{
				$this->avgFlag=true;
				$m_response[$count]['data_type']="avg";
			}
			$m_response[$count]['forecast']=$this->getClientOrderSum($item['id'],1,$start_date,$end_date);
			$m_response[$count]['schedule']=$this->getClientOrderSum($item['id'],2,$start_date,$end_date);
			$m_response[$count]['stock']=$this->getClientOrderSum($item['id'],3,$start_date,$end_date);
			$count++;
		}
		return $m_response;
	}


	//custom functions
	private function getClientOrderSum($id,$orderType,$start_date,$end_date){
		$productList=$this->getProductList();
		$forecastOrder=array();
		$counter=0;
		if ($this->avgFlag){
		}else{
		}
		foreach ($productList as $proItem){
			if ($this->avgFlag){
				$productArray=array(
					"product_name"=>$proItem['p_name'],
					"product_type"=>$proItem['p_type'],
					"product_id"=>$proItem['id'],
					"order_id"=>"",
					"txid"=>"",
					"client_id"=>$id,
					"taker_id"=>"",
					"delevary_date"=>"",
					"plant"=>"",
					"taking_date"=>"",
					"order_type"=>"",
					"quantityes"=>0
				);
			}else{

				$productArray=array(
					"product_name"=>$proItem['p_name'],
					"product_type"=>$proItem['p_type'],
					"product_id"=>$proItem['id'],
					"order_id"=>"",
					"txid"=>"",
					"client_id"=>$id,
					"taker_id"=>"",
					"delevary_date"=>"",
					"plant"=>"",
					"taking_date"=>"",
					"order_type"=>"",
					"quantityes"=>0
				);
			}

			$forecastOrder[$counter]=$productArray;
			$counter++;
		}
		$clientOrderList = $this->getClientOrders($id,$orderType,$start_date,$end_date);
		foreach ($clientOrderList as $orderItem){
			$productId=$orderItem['product_id'];
			$quan=$orderItem['quantityes'];
			$counter=0;
			foreach ($forecastOrder as $forOrderItem)
			{
				if ($forecastOrder[$counter]['product_id']==$productId){
					//if (!empty($quan))
					{
						$forecastOrder[$counter]['quantityes']+=$quan;
						$forecastOrder[$counter]['txid']=$orderItem['txid'];
						$forecastOrder[$counter]['client_id']=$orderItem['client_id'];
						$forecastOrder[$counter]['taker_id']=$orderItem['taker_id'];
						$forecastOrder[$counter]['delevary_date']=$orderItem['delevary_date'];
						$forecastOrder[$counter]['plant']=$orderItem['plant'];
						$forecastOrder[$counter]['taking_date']=$orderItem['taking_date'];
						$forecastOrder[$counter]['order_id']=$orderItem['id'];
						$forecastOrder[$counter]['order_type']=$orderItem['order_type'];
					}
				}
				$counter++;
			}
		}
		return $forecastOrder;
	}

	public function getClientOrders($id,$orderType,$start_date,$end_date){
		// echo "Start ".$start_date;
		// echo "End ".$end_date;
		$this->db->select('*');
		$this->db->from('order_details');
		$this->db->where('order_details.client_id', $id);
		$this->db->where('order_details.order_type',$orderType);
// 		$this->db->where('taking_date >=', $start_date);
// 		$this->db->where('taking_date <=', $end_date);
//		if ($orderType==1){
//			$this->db->where('taking_date >=', $start_date);
//			$this->db->where('taking_date <=', $end_date);
//		}
//		if ($orderType==2){
			$this->db->where('delevary_date >=', $start_date);
			$this->db->where('delevary_date <=', $end_date);
		//}
		$rslt = $this->db->get();
		$result = $rslt->result_array();
		$que=$this->db->last_query();
		//echo $que;
		return $result;
	}
	private function getProductList(){
		$this->db->select('*');
		$this->db->from('product_details');
		$rslt = $this->db->get();
		$result = $rslt->result_array();
		return $result;
	}

	////////////////////////////////////
	public function saveClient($data){
		$this->db->insert('client_info', $data);
		$Info = $this->db->insert_id();
		return $Info;
	}
	public function getClientById($id){
		$this->db->select('*');
		$this->db->from('client_info');
		$this->db->join('employees','employees.id=client_info.handler_id', 'left');
		// $this->db->join('employee_info','employees.info_id=employee_info.id', 'left');
		$this->db->where('client_info.id',$id);
		$rslt = $this->db->get();
		$result = $rslt->result_array();
		return $result;
	}
	public function getClientByCode($code){
		$this->db->select('*');
		$this->db->from('client_info');
		$this->db->join('employees','employees.id=client_info.handler_id', 'left');
		// $this->db->join('employee_info','employees.info_id=employee_info.id', 'left');
		$this->db->where('client_info.client_code',$code);
		$rslt = $this->db->get();
		$result = $rslt->result_array();
		return $result;
	}
	public function getClientByPairId($id){
		$this->db->select('*');
		$this->db->from('client_info');
		$this->db->join('employees','employees.id=client_info.handler_id', 'left');
		// $this->db->join('employee_info','employees.info_id=employee_info.id', 'left');
		$this->db->where('client_info.client_pairID',$id);
		$rslt = $this->db->get();
		$result = $rslt->result_array();
		return $result;
	}

	public function updateClient($data, $code){
		$this->db->where('client_code', $code);
		if ($this->db->update('client_info', $data)) {
			return true;
		}
		else {
			return false;
		}
	}
}

?>
