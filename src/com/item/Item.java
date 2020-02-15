package com.item;

public class Item {
	private String sportID,itemID,itemName,itemDescription,status;
	
	public Item() {
		super();
	}

	public Item(String sportID, String itemID, String itemName, String itemDescription, String status) {
		super();
		this.sportID = sportID;
		this.itemID = itemID;
		this.itemName = itemName;
		this.itemDescription = itemDescription;
		this.status = status;
	}

	public String getSportID() {
		return sportID;
	}

	public void setSportID(String sportID) {
		this.sportID = sportID;
	}

	public String getItemID() {
		return itemID;
	}

	public void setItemID(String itemID) {
		this.itemID = itemID;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemDescription() {
		return itemDescription;
	}

	public void setItemDescription(String itemDescription) {
		this.itemDescription = itemDescription;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	
}
