package pcwang.weather.service;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;

import pcwang.weather.utils.HttpUtils;

public class WeatherCall {

	private String appCode;
	
	public boolean setAppCode(String appCode) {
		if(appCode==null) {
			return false;
		}
		this.appCode=appCode;
		return true;
	}
	public String callWeather(String cityName) {
		 String host = "https://jisutqybmf.market.alicloudapi.com";
		    String path = "/weather/query";
		    String method = "GET";
		    //String appcode = appcode;
		    Map<String, String> headers = new HashMap<String, String>();
		    //�����header�еĸ�ʽ(�м���Ӣ�Ŀո�)ΪAuthorization:APPCODE 83359fd73fe94948385f570e3c139105
		    headers.put("Authorization", "APPCODE " + appCode);
		    Map<String, String> querys = new HashMap<String, String>();
		    querys.put("city",cityName);
		    querys.put("citycode", "citycode");
		    querys.put("cityid", "cityid");
		    querys.put("ip", "ip");
		    querys.put("location", "location");

		    String json="";
		    try {
		    	/**
		    	* ��Ҫ��ʾ����:
		    	* HttpUtils���
		    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/src/main/java/com/aliyun/api/gateway/demo/util/HttpUtils.java
		    	* ����
		    	*
		    	* ��Ӧ�����������
		    	* https://github.com/aliyun/api-gateway-demo-sign-java/blob/master/pom.xml
		    	*/
		    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
		    	json=EntityUtils.toString(response.getEntity());
		    	//System.out.println(response.toString());
		    	//��ȡresponse��body
		    	//System.out.println(EntityUtils.toString(response.getEntity()));
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
			return json;
		}
		
	}
	
