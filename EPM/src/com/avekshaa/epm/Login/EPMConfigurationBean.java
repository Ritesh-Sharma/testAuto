package com.avekshaa.epm.Login;

public class EPMConfigurationBean {

	private String thresholdinteraction;
	private int responsetime;
	private int defaultresponsetime;
	private String averagecreation;
	private int timewindowlength;
	private int noofsamples;
	private int enableepmengine;
	private int status;
	public boolean valid;
	public String getThresholdinteraction() {
		return thresholdinteraction;
	}
	public void setThresholdinteraction(String thresholdinteraction) {
		this.thresholdinteraction = thresholdinteraction;
	}
	public int getResponsetime() {
		return responsetime;
	}
	public void setResponsetime(int responsetime) {
		this.responsetime = responsetime;
	}
	public int getDefaultresponsetime() {
		return defaultresponsetime;
	}
	public void setDefaultresponsetime(int defaultresponsetime) {
		this.defaultresponsetime = defaultresponsetime;
	}
	public String getAveragecreation() {
		return averagecreation;
	}
	public void setAveragecreation(String averagecreation) {
		this.averagecreation = averagecreation;
	}
	public int getTimewindowlength() {
		return timewindowlength;
	}
	public void setTimewindowlength(int timewindowlength) {
		this.timewindowlength = timewindowlength;
	}
	public int getNoofsamples() {
		return noofsamples;
	}
	public void setNoofsamples(int noofsamples) {
		this.noofsamples = noofsamples;
	}
	public int getEnableepmengine() {
		return enableepmengine;
	}
	public void setEnableepmengine(int enableepmengine) {
		this.enableepmengine = enableepmengine;
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
