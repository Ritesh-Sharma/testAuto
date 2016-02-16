package com.avekshaa.epm.Login;

public class EndPointMasterBean {

	private int epid;
	private String epdesc;
	private String ipaddress;
	private int port;
	private int type;
	private int status;
	public boolean valid;

	public int getEpid() {
		return epid;
	}

	public void setEpid(int epid) {
		this.epid = epid;
	}

	public String getEpdesc() {
		return epdesc;
	}

	public void setEpdesc(String epdesc) {
		this.epdesc = epdesc;
	}

	public String getIpaddress() {
		return ipaddress;
	}

	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	public int getPort() {
		return port;
	}

	public void setPort(int port) {
		this.port = port;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

}
