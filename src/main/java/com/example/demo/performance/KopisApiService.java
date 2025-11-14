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
    	LocalDate startDay=today.minusMonths(6);
    	String Sstart=startDay.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    	String Stoday=today.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
    	
        String url=apiurl + "?service=" + apikey +
                   "&stdate=" + Sstart + "&eddate=" + Stoday + "&cpage=1&rows=500";

        ResponseEntity<String> response=template.getForEntity(url, String.class);
        String xml=response.getBody();
        
        if(xml == null || xml.isEmpty())
        	return 0;

        JSONObject json=XML.toJSONObject(xml);
        
        if(!json.has("dbs"))
        	return 0;
        
        JSONObject dbs=json.getJSONObject("dbs");
        
        if(!dbs.has("db"))
        	return 0;
        
        // kopis api에서 공연이 한 건일 경우 JSONArray가 아니라 JSONObject로 오기도 함
        Object dbData=dbs.get("db");

        JSONArray dbArray=(dbData instanceof JSONArray) ? (JSONArray) dbData : new JSONArray().put(dbData);

        List<PerfDto> list=new ArrayList<>();
        
        for (int i = 0; i < dbArray.length(); i++)
        {
            JSONObject item=dbArray.getJSONObject(i);
            
            String title=item.optString("prfnm", "").trim();
            String location=item.optString("fcltynm", "").trim();
            String sDate=safeDate(item.optString("prfpdfrom", ""));
            String eDate=safeDate(item.optString("prfpdto", ""));
            String poster=item.optString("poster", "").trim();
            String rawGenre=item.optString("genrenm", "").trim();
            String mt20id=item.optString("mt20id", "").trim();
            
            if(title.isEmpty() || sDate == null || eDate == null || mt20id.isEmpty())
            	continue;

            PerfDto pdto=new PerfDto();
            pdto.setTitle(title);
            pdto.setLocation(location);
            pdto.setStartDate(sDate);
            pdto.setEndDate(eDate);
            pdto.setImageUrl(poster);
            pdto.setGenre(mapGenre(rawGenre));
            pdto.setMt20id(mt20id);
            
            list.add(pdto);
        }
        
        // 중복 제거 (mt20id 기준)
        Map<String, PerfDto> uniqueMap=new LinkedHashMap<>();
        
        for (PerfDto pdto : list)
        {
        	String uniqueKey=pdto.getMt20id();
        	
            uniqueMap.putIfAbsent(uniqueKey, pdto);
        }
        
        List<PerfDto> flist=new ArrayList<>(uniqueMap.values());
        int insertedCount=0;

        for (PerfDto pdto : flist)
        {
            if (mapper.keycheck(pdto.getMt20id()) == 0)
            {
                mapper.insertPf(pdto);
                insertedCount++;
            }
        }
        
        return insertedCount;
    }
    
    private String safeDate(String date)
    {
    	if(date == null)
    		return null;
    	
    	date=date.trim();
    	if(date.isEmpty())
    		return null;
    	
    	// 2025.01.01, 2025-01-01 같은 형식은 .만 -로 통일
    	return date.replace(".", "-");
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
    	String url=apiurl + "/" + mt20id + "?service=" + apikey;
    	
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
    	
    	if(genre.contains("뮤지컬") || genre.contains("연극") ||
    	   genre.contains("무용") || genre.contains("발레"))
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
