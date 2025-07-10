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

    public void fetchPerformances()
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
        List<PerfDto> list = new ArrayList<>();
        Object dbData=dbs.get("db");

        JSONArray dbArray = (dbData instanceof JSONArray) ? (JSONArray) dbData : new JSONArray().put(dbData);

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

            System.out.println(pdto);
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

        for (PerfDto pdto : flist)
        {
            if (mapper.keycheck(pdto) == 0)
            {
                mapper.insertPf(pdto);
            }
            else
            {
                System.out.println("중복 공연: " + pdto.getTitle());
            }
        }
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
}
