package com.example.demo.performance;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;
import org.json.JSONObject;
import org.json.XML;

@Service
public class KopisApiService {

    private final String apiKey = "ac849e5c3a0c458687d4a190acd4e026";

    public void fetchPerformances()
    {
        String url="http://www.kopis.or.kr/openApi/restful/pblprfr?" +
                "service=" + apiKey +
                "&stdate=20240601&eddate=20240701&cpage=1&rows=10";

        RestTemplate restTemplate=new RestTemplate();
        ResponseEntity<String> response=restTemplate.getForEntity(url, String.class);

        String xml=response.getBody();
        JSONObject json=XML.toJSONObject(xml);

        System.out.println(json.toString(2)); // 보기 좋게 출력
    }
}
