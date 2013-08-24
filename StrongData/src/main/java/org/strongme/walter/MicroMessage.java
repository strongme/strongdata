package org.strongme.walter;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Date;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("mm")
public class MicroMessage {
	
	@RequestMapping("checkJoin")  
    @ResponseBody  
    public String checkJoin(HttpServletRequest request, HttpServletResponse response,  
            String signature,String timestamp, String nonce,String echostr) throws IOException {  
	     String postStr=null;    
	        try{    
	            postStr=this.readStreamParameter(request.getInputStream());    
	        }catch(Exception e){    
	            e.printStackTrace();    
	        }   
	          
	        if (null!=postStr&&!postStr.isEmpty()){    
	            Document document=null;    
	            try{    
	                document = DocumentHelper.parseText(postStr);    
	            }catch(Exception e){    
	                e.printStackTrace();    
	            }    
	            if(null==document){    
	                return"";    
	            }    
	            Element root=document.getRootElement();    
	            String fromUsername = root.elementText("FromUserName");    
	            String toUsername = root.elementText("ToUserName");    
	            String keyword = root.elementTextTrim("Content");   
	            String msgId = root.elementTextTrim("MsgId");   
	            String time = new Date().getTime()+"";    
	            String textTpl = "<xml>"+    
	                        "<ToUserName><![CDATA[%1$s]]></ToUserName>"+    
	                        "<FromUserName><![CDATA[%2$s]]></FromUserName>"+    
	                        "<CreateTime>%3$s</CreateTime>"+    
	                        "<MsgType><![CDATA[%4$s]]></MsgType>"+    
	                        "<Content><![CDATA[%5$s]]></Content>"+    
	                        "<FuncFlag>0</FuncFlag>"+    
	                        "</xml>";                 
	                 
	            if(null!=keyword&&!keyword.equals(""))    
	            {    
	                String msgType = "text";    
	                String contentStr ="袁子茜是最棒最棒的‘傻逼’！";    
	                String resultStr = textTpl.format(textTpl, fromUsername, toUsername, time, msgType, contentStr);   
	                return resultStr;    
	            }else{    
	                 return "Input something...";    
	            }    
	        }else {    
	             return "fail";      
	        }  
    }  
	
	 //从输入流读取post参数    
    public String readStreamParameter(ServletInputStream in){    
        StringBuilder buffer = new StringBuilder();    
        BufferedReader reader=null;    
        try{    
            reader = new BufferedReader(new InputStreamReader(in,"UTF-8"));    
            String line=null;    
            while((line = reader.readLine())!=null){    
                buffer.append(line);    
            }    
        }catch(Exception e){    
            e.printStackTrace();    
        }finally{    
            if(null!=reader){    
                try {    
                    reader.close();    
                } catch (IOException e) {    
                    e.printStackTrace();    
                }    
            }    
        }    
        return buffer.toString();    
    }   
	

}
