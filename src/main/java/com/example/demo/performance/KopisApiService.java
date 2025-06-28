package com.example.demo.performance;

import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
		// RestTemplate을 이용해 kopisapi get방식으로 호출, 결과는 xml 형식의 문자열로 받음
        ResponseEntity<String> response=restTemplate.getForEntity(url, String.class);

        String xml=response.getBody();
		// org.json의 XML.toJSONObject를 이용해 xml 데이터를 JSON 객체로 변환
        JSONObject json=XML.toJSONObject(xml);

        JSONObject dbs=json.getJSONObject("dbs");
        
        // JSON 구조에서 실제 공연 정보들이 들어있는 db 배열 추출
        JSONArray dbArray=dbs.getJSONArray("db");

        List<PerfDto> list=new ArrayList<>();
        for (int i = 0;i < dbArray.length();i++)
        {
            JSONObject item=dbArray.getJSONObject(i);

            PerfDto pdto=new PerfDto();
            // optString을 쓰는 이유는 key가 없을 경우에도 null 대신 빈 문자열 반환해서 에러 방지
            pdto.setTitle(item.optString("prfnm"));
            pdto.setLocation(item.optString("fcltynm"));
            pdto.setStartDate(item.optString("prfpdfrom"));
            pdto.setEndDate(item.optString("prfpdto"));
            pdto.setImageUrl(item.optString("poster"));
            pdto.setGenre(item.optString("genrenm"));
            
            list.add(pdto);
            
            System.out.println(pdto);
        }
        
        // list안에 들어있는 PerfDto 객체들을 하나씩 꺼내서 pdto라는 이름으로 반복하면서 사용할 수 있게 함
        for(PerfDto pdto : list)
        {
        	// 날짜 형식 변환(2024.06.29 > 2024-06-29)
        	pdto.setStartDate(pdto.getStartDate().replace(".", "-"));
        	pdto.setEndDate(pdto.getEndDate().replace(".", "-"));
        	
        	mapper.insertPf(pdto);
        }
    }
    
    public Map<String, List<PerfDto>> getGenre()
    {
        List<PerfDto> all=mapper.selectAll();
        Map<String, List<PerfDto>> map=new LinkedHashMap<>();
        
        for(PerfDto pdto : all)
        {
            String genre=pdto.getGenre();
            
            if(genre == null || genre.isEmpty()) genre = "기타";
            
            map.computeIfAbsent(genre, k -> new ArrayList<>()).add(pdto);
        }

        return map;
    }

}
