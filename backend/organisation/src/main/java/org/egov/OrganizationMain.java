package org.egov;

import org.egov.tracer.config.TracerConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.FilterType;
import org.springframework.context.annotation.Import;

@Import({TracerConfiguration.class})
@SpringBootApplication
@ComponentScan(
    basePackages = {"org.egov.web.controllers", "org.egov.config", "org.egov.common", "org.egov.repository", "org.egov.service", "org.egov.util", "org.egov.validator"}
)
public class OrganizationMain {

    public static void main(String[] args) {
        SpringApplication.run(OrganizationMain.class, args);
    }
}