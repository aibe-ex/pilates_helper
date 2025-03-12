package org.example.pilates_helper.model.repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.pilates_helper.model.dto.APIClientParam;
import org.example.pilates_helper.model.dto.BaseLLMBody;
import org.example.pilates_helper.model.dto.TogetherAPIParam;
import org.example.pilates_helper.util.APIClient;

import java.util.List;

public class TogetherRepository implements APIClient {
    private static TogetherRepository instance = new TogetherRepository();
    private final ObjectMapper objectMapper = new ObjectMapper();
    private TogetherRepository() {}

    public static TogetherRepository getInstance() {
        return instance;
    }

    public String callAPI(TogetherAPIParam param) throws JsonProcessingException {
        String token = dotenv.get("TOGETHER_KEY");
        String url = "";
        String method = "";
        String body = "";
        String[] headers = {};
        switch (param.modelType()) {
            case BASE -> {
                url = "https://api.together.xyz/v1/chat/completions";
                headers = new String[]{
                        "Authorization", "Bearer %s".formatted(token),
                        "Content-Type", "application/json"
                };
                method = "POST";
                body = objectMapper.writeValueAsString(new BaseLLMBody("meta-llama/Llama-3.3-70B-Instruct-Turbo-Free", List.of(new BaseLLMBody.Message("user", param.prompt()))));
            }
            default -> throw new RuntimeException("Unsupported together model type");
        }
        return APIClient.super.callAPI(new APIClientParam(url, method, body, headers));
    }
}
