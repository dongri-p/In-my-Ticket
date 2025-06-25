package com.example.demo.performance;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

@Service
public class KopisApiService {
	
	@Autowired
	private PerfMapper mapper;

    private final String apiKey = "ac849e5c3a0c458687d4a190acd4e026";

    public void fetchPerformances()
    {
        String url="http://www.kopis.or.kr/openApi/restful/pblprfr?"+"service="+apiKey+
                   "&stdate=20240601&eddate=20240701&cpage=1&rows=10";

        RestTemplate restTemplate=new RestTemplate();
        ResponseEntity<String> response=restTemplate.getForEntity(url, String.class);

        String xml=response.getBody();
        JSONObject json=XML.toJSONObject(xml);

        JSONObject dbs=json.getJSONObject("dbs");
        
        JSONArray dbArray=dbs.getJSONArray("db");

        for (int i = 0;i < dbArray.length();i++)
        {
            JSONObject item=dbArray.getJSONObject(i);

            PerfDto pdto=new PerfDto();
            // optString을 쓰는 이유는 key가 없을 경우에도 null 대신 빈 문자열 반환해서 에러 방지
            pdto.setTitle(item.optString("prfnm"));
            pdto.setLocation(item.optString("fcltynm"));
            pdto.setSDate(item.optString("prfpdfrom"));
            pdto.setEDate(item.optString("prfpdto"));
            pdto.setImageUrl(item.optString("poster"));
            
            System.out.println(pdto);
        }
        
        for(PerfDto pdto : list)
        {
        	// 날짜 형식 변환(2024.06.29 > 2024-06-29)
        	pdto.setSDate(pdto.getSDate().replace(".", "-"));
        	pdto.setEDate(pdto.getEDate().replace(".", "-"));
        	
        	perf
        }
    }
}
