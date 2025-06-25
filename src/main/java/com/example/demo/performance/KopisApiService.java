import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.ResponseEntity;
import org.json.JSONArray;
import org.json.JSONObject;

@Service
public class KopisApiService {

    private final String apiKey = "ac849e5c3a0c458687d4a190acd4e026";

    public void fetchPerformances() {
        String url = "http://www.kopis.or.kr/openApi/restful/pblprfr?service=" + apiKey +
                     "&stdate=20240601&eddate=20240701&cpage=1&rows=10&prfstate=01&signgucode=11&rows=20";

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);

        String xml = response.getBody();

        System.out.println("✅ 가져온 원시 XML:");
        System.out.println(xml);

        // 다음 단계에서 → XML을 JSON으로 파싱하거나 DOM 파서로 해석
    }
}
