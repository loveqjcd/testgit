package main.java.web.web.util;

public interface IInitDataLoad {
	
	public boolean isExistsSellerTradeItemRule(Long sellerId);
	
	public void loadSellerList();
	
	public void load();
	// 加载卖家的订单备注规则app信息
	public void loadSellerPackageInfo(Long sellerId);

	// 刷新指定卖家的订单备注规则app信息
	public void refreshSellerPackage(Long sellerId);

	public void loadSellerRule(Long _sellerId);
	
}
