package kr.co.bapsi.member.control;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;



public class KakaoLogin {
   public static JsonNode getAccessToken(String autorize_code) {
      final String RequestUrl = "https://kauth.kakao.com/oauth/token";

      final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
      postParams.add(new BasicNameValuePair("client_id", "f411cad21142d14e0d64c52c74235f62")); // REST API KEY
      postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8000/bapsi/kakaoLogin")); // 리다이렉트 URI
      postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값

      
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);
      JsonNode returnNode = null;

      try {
         post.setEntity(new UrlEncodedFormEntity(postParams));
         final HttpResponse response = client.execute(post);
         final int responseCode = response.getStatusLine().getStatusCode();

         System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
         System.out.println("Post parameters : " + postParams);
         System.out.println("Response Code : " + responseCode);

         // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         // clear resources
      }

      return returnNode;

   }
   
   public static void agreeEmail(String autorize_code) throws Exception {
      final String RequestUrl = "https://kauth.kakao.com/oauth/authorize";
      
    URL obj = new URL(RequestUrl);
    HttpURLConnection con = (HttpURLConnection) obj.openConnection();

    
    //optional defult is GET
    con.setRequestMethod("GET");
    
    //add request header
    con.setRequestProperty("client_id","f411cad21142d14e0d64c52c74235f62");
    con.setRequestProperty("redirect_uri", "http://localhost:8000/bapsi/kakaoLogin");
    con.setRequestProperty("code",autorize_code);
    con.setRequestProperty("response_type","code");
    con.setRequestProperty("scope", "account_email");
    
    JsonNode returnNode = null;
    int responseCode = con.getResponseCode();
    System.out.println("\nSending 'GET' request to URL:"+RequestUrl);
    System.out.println("Response Code:" +responseCode);
    
    BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
    String inputLine;
    StringBuffer response = new StringBuffer();
    
    while ((inputLine=in.readLine()) !=null) {
       response.append(inputLine);
    }
    in.close();
    
    //print result
    System.out.println(response.toString());
   
     /* final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
//      postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
      postParams.add(new BasicNameValuePair("client_id", "737b9d433050d8163005456b02b4e952")); // REST API KEY
      postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8000/bapsi/kakaoLogin")); // 리다이렉트 URI
      postParams.add(new BasicNameValuePair("code", autorize_code)); // 로그인 과정중 얻은 code 값
      postParams.add(new BasicNameValuePair("response_type", "code"));
      postParams.add(new BasicNameValuePair("scope", "account_email,age_range,birthday,gender"));
*/
    /*  final HttpClient client = HttpClientBuilder.create().build();
      final HttpGet get= new HttpGet(RequestUrl);
      JsonNode returnNode = null;

      try {
     
         final HttpGet response = (HttpGet) client.execute(get);
         final int responseCode = ((HttpResponse) response).getStatusLine().getStatusCode();

         System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
         System.out.println("Post parameters : " + RequestUrl);
         System.out.println("Response Code : " + responseCode);

         // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(((HttpResponse) response).getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         // clear resources
      }

      return returnNode;*/

   }
   
   
/*   public static JsonNode getUrlInfo(String autorize_code) {
      
      final String RequestUrl = "https://kauth.kakao.com/oauth/authorize?client_id=f411cad21142d14e0d64c52c74235f62&redirect_uri=http://localhost:8000/bapsi/kakaoLogin&response_type=code&scope=account_email";
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpGet get = new HttpGet(RequestUrl);
      
      get.addHeader("Authorization", "Bearer " + autorize_code);
      
      JsonNode returnNode = null;
      
      try {
            final HttpResponse response = client.execute(get);
            final int responseCode = response.getStatusLine().getStatusCode();

            System.out.println("\nSending 'get' request to URL : " + RequestUrl);
            System.out.println("Response Code : " + responseCode);

            // JSON 형태 반환값 처리
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());

         } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
         } catch (ClientProtocolException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         } finally {
            // clear resources
         }
         return returnNode;

      
   }*/
   

/*
      public static void getURL(String authorize_code) {
    
         // HttpClient 생성
         HttpClient httpclient = new DefaultHttpClient();
         try {
            // HttpGet생성
            HttpGet httpget = new HttpGet("https://kauth.kakao.com/oauth/authorize?client_id=f411cad21142d14e0d64c52c74235f62&redirect_uri=http://localhost:8000/bapsi/kakaoLogin&response_type=code&scope=account_email");
    
            System.out.println("executing request " + httpget.getURI());
            HttpResponse response = httpclient.execute(httpget);
            HttpEntity entity = response.getEntity();
    
            System.out.println("----------------------------------------");
            // 응답 결과
            System.out.println(response.getStatusLine());
            if (entity != null) {
               System.out.println("Response content length: "
                     + entity.getContentLength());
               BufferedReader rd = new BufferedReader(new InputStreamReader(
                     response.getEntity().getContent()));
    
               String line = "";
               while ((line = rd.readLine()) != null) {
                  System.out.println(line);
               }
            }
            httpget.abort();
            System.out.println("----------------------------------------");
            httpclient.getConnectionManager().shutdown();
    
         } catch (ClientProtocolException e) {
            e.printStackTrace();
         } catch (IOException e) {
            e.printStackTrace();
         } finally {
            httpclient.getConnectionManager().shutdown();
         }
      }
    */

   public static JsonNode getKakaoUserInfo(String autorize_code) {

      final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

      final HttpClient client = HttpClientBuilder.create().build();
      final HttpGet post = new HttpGet(RequestUrl);

      // add header
      post.addHeader("Authorization", "Bearer " + autorize_code);

      JsonNode returnNode = null;

      try {
         final HttpResponse response = client.execute(post);
         final int responseCode = response.getStatusLine().getStatusCode();

         System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
         System.out.println("Response Code : " + responseCode);

         // JSON 형태 반환값 처리
         ObjectMapper mapper = new ObjectMapper();
         returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
         e.printStackTrace();
      } catch (ClientProtocolException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      } finally {
         // clear resources
      }
      return returnNode;

   }

   
}