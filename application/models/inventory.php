<?php
class Inventory extends CI_Model 
{	
	function insert($inventory_data)
	{
		return $this->db->insert('inventory',$inventory_data);
	}
	
	function get_inventory_data_for_item($item_id, $location_id=false)
	{
		$this->db->from('inventory');
		$this->db->where('trans_items',$item_id);
        if($location_id != false)
        {
            $this->db->where('trans_location', $location_id);
        }
		$this->db->order_by("trans_date", "desc");
		return $this->db->get();		
	}
}

?>