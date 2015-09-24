package com.slms.domain.utility;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

public class GetJsonObject {
	
	
	public static String getWebServceObj(String url , HttpServletRequest request) {
		try{
		HttpURLConnection connection=null;
		
		//Proxy config start
		String isEnable = (String)request.getSession().getAttribute("prox_set");
		if(isEnable != null && isEnable.equalsIgnoreCase("yes"))
		{
		Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("proxyarray.mazdausa.com",80));			
		connection = (HttpURLConnection) new URL(url).openConnection(proxy);
		}
		else{
			connection = (HttpURLConnection) new URL(url).openConnection();	
			//**"Proxy disabled..."+url);
		}
		connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3)");
		//Proxy config end
		//**"getWebServceObj > Proxy enabled?"+isEnable+" URL - "+url);

		
		BufferedReader	rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null){
			sb.append(line + '\n');
		}
		String response = sb.toString();
		//**"Resp ="+response);
		return response;
	}catch (Exception e) {
		//**"Error in get "+e.getMessage());
		e.printStackTrace();
		return "Requset failed";
	}
		
	}
	public static StringBuffer getWebServceObjSb(String url , HttpServletRequest request) {
		try{
		HttpURLConnection connection=null;
		Long proxyTime = new Date().getTime();
		//#("Time Captured On proxy Setting ======"+ proxyTime); 
		//Proxy config start
		String isEnable = (String)request.getSession().getAttribute("prox_set");
		if(isEnable != null && isEnable.equalsIgnoreCase("yes"))
		{
		Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("proxyarray.mazdausa.com",80));			
		connection = (HttpURLConnection) new URL(url).openConnection(proxy);
		}
		else{
			connection = (HttpURLConnection) new URL(url).openConnection();	
			//**"Proxy disabled..."+url);
		}
		connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.3)");
		//Proxy config end
		//**"getWebServceObj > Proxy enabled?"+isEnable+" URL - "+url);

		
		BufferedReader	rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		StringBuilder sb = new StringBuilder();
		StringBuffer sbb = new StringBuffer();
		String line;
		while ((line = rd.readLine()) != null){
			sbb.append(line + '\n');
		}
	//	StringBuffer response = sb.toString()
		//**"Resp ="+response);
	//	return response;
		return sbb;
	}catch (Exception e) {
		//**"Error in get "+e.getMessage());
		e.printStackTrace();
	//	return "Requset failed";
		return null;
	}
		
		
	}

	public static String getWebServceObj(String url) {
		try{
		HttpURLConnection connection=null;
		
		//Proxy config start
		/*String isEnable = Utility.getProperties("env.properties").getProperty("enableProxy");
		if(isEnable != null && isEnable.equalsIgnoreCase("yes"))
		{
		//**"Proxy enabled..."+url);
		Proxy proxy = new Proxy(Proxy.Type.HTTP, new InetSocketAddress("proxyarray.mazdausa.com",80));			
		connection = (HttpURLConnection) new URL(url).openConnection(proxy);
		}
		else{
			connection = (HttpURLConnection) new URL(url).openConnection();	
		}*/
		//Proxy config end
		connection = (HttpURLConnection) new URL(url).openConnection();	
		BufferedReader	rd = new BufferedReader(new InputStreamReader(connection.getInputStream()));
		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null){
			sb.append(line + '\n');
		}
		String response = sb.toString();
		//**"Resp ="+response);
		return response;
	}catch (Exception e) {
		return "Requset failed";
	}
		
	}
	
	
	public static void main(String[] arg)
	{
		
		//#("test ......... "+"\u2605".toUpperCase());
	}
	
}
