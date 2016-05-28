package com.cisco.iask.auth;

import org.bson.types.ObjectId;

public class QuestionResponse {
	
	public QuestionResponse(ObjectId id, boolean status) {
		super();
		this.id = id;
		this.status = status;
	}
	private ObjectId id;
	private boolean status;
	public ObjectId getId() {
		return id;
	}
	public void setId(ObjectId id) {
		this.id = id;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}

}
