package org.example.pilates_helper.model.dto;

public record APIClientParam(String url, String token, String method, String body, String[] headers) {
}
