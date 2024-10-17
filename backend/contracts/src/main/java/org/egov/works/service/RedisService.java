package org.egov.works.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.egov.tracer.model.CustomException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;


@Service
public class RedisService {

    private static final Logger log = LoggerFactory.getLogger(RedisService.class);
    private final RedisTemplate<String, Object> redisTemplate;
    private final ObjectMapper objectMapper;

    @Autowired
    public RedisService(RedisTemplate<String, Object> redisTemplate, ObjectMapper objectMapper) {
        this.redisTemplate = redisTemplate;
        this.objectMapper = objectMapper;
    }

    public void setCache(String key, Object json) {
        try {
            String object = objectMapper.writeValueAsString(json);
            redisTemplate.opsForValue().set(key, object);
        } catch (JsonProcessingException e) {
            log.error("Error while serializing object to JSON", e);
            throw new CustomException("SERIALIZATION_ERROR", "Error while serializing object to JSON");
        } catch (Exception e) {
            log.error("Error while pushing data to Redis", e);
            throw new CustomException("REDIS_ERROR", "Error while pushing data to Redis");
        }
    }

    public <T> T getCache(String key, Class<T> type) {
        try {
            String objectJson = (String) redisTemplate.opsForValue().get(key);
            if (objectJson != null) {
                return objectMapper.readValue(objectJson, type);
            } else {
                log.warn("No cache found for key: {}", key);
                return null;
            }
        } catch (JsonProcessingException e) {
            log.error("Error while deserializing JSON to object", e);
            throw new CustomException("DESERIALIZATION_ERROR", "Error while deserializing JSON to object");
        } catch (Exception e) {
            log.error("Error while fetching data from Redis", e);
            throw new CustomException("REDIS_ERROR", "Error while fetching data from Redis");
        }
    }


}