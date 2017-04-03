package kr.co.smartpayweb.repository.vo;

public class StoreFileVO {
	private int storeFileNo;
	private int storeNo;
	private int menuNo;
	private String oriName;
	private String systemName;
	private String filePath;
	private long fileSize;

	
	public int getStoreFileNo() {
		return storeFileNo;
	}
	public void setStoreFileNo(int storeFileNo) {
		this.storeFileNo = storeFileNo;
	}

	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public int getMenuNo() {
		return menuNo;
	}
	public void setMenuNo(int menuNo) {
		this.menuNo = menuNo;
	}
	public String getOriName() {
		return oriName;
	}
	public void setOriName(String oriName) {
		this.oriName = oriName;
	}
	public String getSystemName() {
		return systemName;
	}
	public void setSystemName(String systemName) {
		this.systemName = systemName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	

}
