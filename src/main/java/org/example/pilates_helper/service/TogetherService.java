package org.example.pilates_helper.service;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.example.pilates_helper.model.dto.TogetherAPIParam;
import org.example.pilates_helper.model.repository.TogetherRepository;

public class TogetherService {
    private static final TogetherService instance = new TogetherService();
    private final ObjectMapper objectMapper = new ObjectMapper();
    private final TogetherRepository repository = TogetherRepository.getInstance();

    private TogetherService() {}

    public static TogetherService getInstance() {
        return instance;
    }

    public String useBaseModel(String prompt) {
        return repository.callAPI(new TogetherAPIParam());
    }

    public String userReasoning(String prompt) {
        return repository.callAPI(new TogetherAPIParam());
    }

    public String useImage(String prompt) {
        return repository.callAPI(new TogetherAPIParam());
    }
}
