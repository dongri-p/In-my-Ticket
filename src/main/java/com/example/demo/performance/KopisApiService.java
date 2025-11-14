package com.example.demo.performance;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;

@Service
public class KopisApiService {

    private final PerfMapper mapper;
    private final RestTemplate template;

    private static final String apikey="ac849e5c3a0c458687d4a190acd4e026";
    private static final String apiurl="http://www.kopis.or.kr/openApi/restful/pblprfr";

    @Autowired
    public KopisApiService(PerfMapper mapper, RestTemplate template)
    {
        this.mapper=mapper;
        this.template=template;
    }

    public int fetchPerformances()
    {
    	LocalDate today=LocalDate.now();
    	String Stoday=today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    	
        String url = apiurl + "?service=" + apikey +
                    "&stdate=20250101&eddate=" + Stoday + "&cpage=1&rows=10";

        ResponseEntity<String> response=template.getForEntity(url, String.class);
        String xml=response.getBody();

        JSONObject json=XML.toJSONObject(xml);
        JSONObject dbs=json.getJSONObject("dbs");
        // kopis api에서 공연이 한 건일 경우 JSONArray가 아니라 JSONObject로 오기도 함
        Object dbData=dbs.get("db");

        JSONArray dbArray = (dbData instanceof JSONArray) ? (JSONArray) dbData : new JSONArray().put(dbData);

        List<PerfDto> list=new ArrayList<>();
        for (int i = 0; i < dbArray.length(); i++)
        {
            JSONObject item=dbArray.getJSONObject(i);

            PerfDto pdto=new PerfDto();
            pdto.setTitle(item.optString("prfnm"));
            pdto.setLocation(item.optString("fcltynm"));
            pdto.setStartDate(item.optString("prfpdfrom").replace(".", "-"));
            pdto.setEndDate(item.optString("prfpdto").replace(".", "-"));
            pdto.setImageUrl(item.optString("poster"));
            pdto.setGenre(item.optString("genrenm"));
            pdto.setMt20id(item.optString("mt20id"));
            list.add(pdto);
        }
        
        // 중복 제거 imageUrl 기준
        Map<String, PerfDto> uniqueMap=new LinkedHashMap<>();
        for (PerfDto pdto : list)
        {
        	String uniqueKey = pdto.getTitle() + "|" + pdto.getStartDate() + "|" + pdto.getLocation();
        	
            uniqueMap.putIfAbsent(uniqueKey, pdto);
        }
        
        List<PerfDto> flist=new ArrayList<>(uniqueMap.values());
        int insertedCount=0;

        for (PerfDto pdto : flist)
        {
            if (mapper.keycheck(pdto) == 0)
            {
                mapper.insertPf(pdto);
                insertedCount++;
            }
        }
        return insertedCount;
    }

    public Map<String, List<PerfDto>> getGenre()
    {
        List<PerfDto> all=mapper.selectAll();
        
        Map<String, List<PerfDto>> map=new LinkedHashMap<>();

        for (PerfDto pdto : all)
        {
            String genre=pdto.getGenre();
            
            if (genre == null || genre.isEmpty()) genre = "기타";
            map.computeIfAbsent(genre, k -> new ArrayList<>()).add(pdto);
        }

        return map;
    }
    
    public PerfDto fetchDetail(String mt20id)
    {
    	String url = apiurl + "/" + mt20id + "?service=" + apikey;
    	
    	ResponseEntity<String> response=template.getForEntity(url, String.class);
    	String xml=response.getBody();
    	
    	JSONObject json=XML.toJSONObject(xml);
    	JSONObject db=json.getJSONObject("dbs").getJSONObject("db");
    	
    	PerfDto pdto=new PerfDto();
    	pdto.setRuntime(db.optString("prfruntime"));
    	pdto.setGrade(db.optString("prfage"));
    	
    	return pdto;
    }
    
    private String mapGenre(String genre)
    {
    	if(genre == null)
    		return "기타";
    	
    	genre=genre.trim();
    	
    	if(genre.contains("대중음악") || genre.contains("재즈") || genre.contains("팝") ||
    	   genre.contains("록") || genre.contains("힙합"))
    		return "콘서트";
    	
    	if(genre.contains("뮤지컬") || genre.contains("연극"))
    		return "뮤지컬/연극";
    	
    	if(genre.contains("팬") || genre.contains("토크"))
    		return "팬클럽/팬미팅";
    	
    	if(genre.contains("클래식") || genre.contains("서양음악"))
    		return "클래식";
    	
    	if(genre.contains("국악") || genre.contains("한국음악") || genre.contains("전통"))
    		return "국악/전통";
    	
    	if(genre.contains("전시") || genre.contains("축제") || genre.contains("행사"))
    		return "전시/행사";
    	
    	return "기타";
    }
}
