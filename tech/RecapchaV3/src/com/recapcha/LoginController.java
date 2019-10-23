package com.recapcha;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.nio.charset.Charset;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean isValidCaptcha = false;
    	String un = request.getParameter("username");
        String pw = request.getParameter("password");
        
        String token = request.getParameter("recaptcha");
        System.out.println("token :"+token);
        //isValidCaptcha = isCaptchaValid("6Lcaeq8UAAAAANLvtS8apEGLyZ8_B3s6ghMKqeJG",token);
        double capthaScore = isCaptchaValid("6Lcaeq8UAAAAANLvtS8apEGLyZ8_B3s6ghMKqeJG",token);
        System.out.println("capthaScore :"+capthaScore);
        if(capthaScore>0.3){
	        if (un.equals("admin") && pw.equals("admin")) {
	            response.sendRedirect("success.html");
	            return;
	        } else {
	            response.sendRedirect("error.html");
	            return;
	        }
        }else {
            response.sendRedirect("capthaError.html");
            return;
        }
    }
    
    public synchronized double isCaptchaValid(String secretKey, String token) {
        try {
            String url = "https://www.google.com/recaptcha/api/siteverify?"
                    + "secret=" + secretKey
                    + "&response=" + token;
            InputStream res = new URL(url).openStream();
            BufferedReader rd = new BufferedReader(new InputStreamReader(res, Charset.forName("UTF-8")));

            StringBuilder sb = new StringBuilder();
            int cp;
            while ((cp = rd.read()) != -1) {
                sb.append((char) cp);
            }
            String jsonText = sb.toString();
            res.close();
            System.out.println("jsonText :"+jsonText);
            JSONObject json = new JSONObject(jsonText);
           // return json.getBoolean("success");
            return json.getDouble("score");
        } catch (Exception e) {
            //e.printStackTrace();
        	return  0.0;
        }
        
    }

}

//site key : 6Lcaeq8UAAAAADCIDtmDc4yYxrCbbkum1CbDNUnC
//secret key : 6Lcaeq8UAAAAANLvtS8apEGLyZ8_B3s6ghMKqeJG

/* <welcome-file-list>  in web.xml
   jar files added to lib folder */