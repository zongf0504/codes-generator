package org.zongf.auto.generator.athm.config;

/** open service 模块儿配置
 * @author zongf
 * @date 2019-12-25
 */
public class OpenConfig {

	// 模块儿名称
	private String moduleName;

    // remote service 接口包名
    private String remoteServiceApiPackage;

    // remote service 实现类包名
    private String remoteServiceImplPackage;

    // service 接口包名
    private String serviceApiPackage;

    // service 实现类包名
    private String serviceImplPackage;

    // controller 路径
    private String controllerPackage;

	// 接口url 前缀
	private String controllerUrlPrefix;

	public OpenConfig() {
        super();
    }

	public OpenConfig(String moduleName, String remoteServiceApiPackage, String remoteServiceImplPackage, String serviceApiPackage, String serviceImplPackage, String controllerPackage, String controllerUrlPrefix) {
        super();
		this.moduleName = moduleName;
		this.remoteServiceApiPackage = remoteServiceApiPackage;
		this.remoteServiceImplPackage = remoteServiceImplPackage;
		this.serviceApiPackage = serviceApiPackage;
		this.serviceImplPackage = serviceImplPackage;
		this.controllerPackage = controllerPackage;
		this.controllerUrlPrefix = controllerUrlPrefix;
    }

    public void setModuleName(String moduleName){
		this.moduleName=moduleName;
	}

	public String getModuleName(){
		return this.moduleName;
	}

    public void setRemoteServiceApiPackage(String remoteServiceApiPackage){
		this.remoteServiceApiPackage=remoteServiceApiPackage;
	}

	public String getRemoteServiceApiPackage(){
		return this.remoteServiceApiPackage;
	}

    public void setRemoteServiceImplPackage(String remoteServiceImplPackage){
		this.remoteServiceImplPackage=remoteServiceImplPackage;
	}

	public String getRemoteServiceImplPackage(){
		return this.remoteServiceImplPackage;
	}

    public void setServiceApiPackage(String serviceApiPackage){
		this.serviceApiPackage=serviceApiPackage;
	}

	public String getServiceApiPackage(){
		return this.serviceApiPackage;
	}

    public void setServiceImplPackage(String serviceImplPackage){
		this.serviceImplPackage=serviceImplPackage;
	}

	public String getServiceImplPackage(){
		return this.serviceImplPackage;
	}

    public void setControllerPackage(String controllerPackage){
		this.controllerPackage=controllerPackage;
	}

	public String getControllerPackage(){
		return this.controllerPackage;
	}

    public void setControllerUrlPrefix(String controllerUrlPrefix){
		this.controllerUrlPrefix=controllerUrlPrefix;
	}

	public String getControllerUrlPrefix(){
		return this.controllerUrlPrefix;
	}

    public String toString() {
		return getClass().getSimpleName() + "@" + hashCode() + ": {moduleName:" + moduleName + ", remoteServiceApiPackage:" + remoteServiceApiPackage + ", remoteServiceImplPackage:" + remoteServiceImplPackage + ", serviceApiPackage:" + serviceApiPackage + ", serviceImplPackage:" + serviceImplPackage + ", controllerPackage:" + controllerPackage + ", controllerUrlPrefix:" + controllerUrlPrefix  + "}";
	}

}
