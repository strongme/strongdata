package org.strongme.walter.global;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.HttpStatus;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.commons.httpclient.params.HttpMethodParams;

import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;

public class GlobalUtil {

	public static String executeGet(String url) {
		String result = "";
		HttpClient hc = new HttpClient();
		GetMethod gm = null;
		hc.getParams().setParameter(HttpMethodParams.HTTP_CONTENT_CHARSET,
				"UTF-8");
		gm = new GetMethod(url);
		gm.getParams().setContentCharset("UTF-8");
		int statusCode;
		try {
			statusCode = hc.executeMethod(gm);
			if (statusCode != HttpStatus.SC_OK) {
				result = "{resultcode:'-200',reason:'请求数据失败'}";
			} else {
				InputStream resStream = gm.getResponseBodyAsStream();
				BufferedReader br = new BufferedReader(new InputStreamReader(resStream,"UTF-8"));
				StringBuffer resBuffer = new StringBuffer();
				String resTemp = "";
				while((resTemp = br.readLine()) != null){
					resBuffer.append(resTemp);
				}
				result = resBuffer.toString();
			}
		} catch (HttpException e) {
			result = "{resultcode:'-200',reason:'网络失败'}";
		} catch (IOException e) {
			result = "{resultcode:'-200',reason:'远程数据读取失败'}";
		}
		return result;
	}
	
	public static String doRequestWithUnirest(String url) {
		
		String result = "";
		HttpResponse<JsonNode> future = Unirest.get(url)
				.header("http.protocol.content-charset", "UTF-8")
				 .header("Content-Type", "application/json;charset=utf-8")
				.asJson();
		result = future.getBody().toString();
		return result;
	}
	
	public static String doRequestXML(String url) {
		HttpResponse<String> stringResponse = Unirest.get(url)
				  .header("accept", "application/xml")
				  .asString();
		String result = stringResponse.getBody();
		return result;
	}
}
