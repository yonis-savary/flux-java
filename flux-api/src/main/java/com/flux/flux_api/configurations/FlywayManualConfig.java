package com.flux.flux_api.configurations;

import org.flywaydb.core.Flyway;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.beans.factory.annotation.Value;

/**
 * For some reason, Flyway was not launched by Spring Boot
 * We can launch it manually by adding this class
 */
@Configuration
public class FlywayManualConfig {

    @Value("${spring.datasource.url}")
    private String datasourceUrl;

    @Value("${spring.datasource.username}")
    private String datasourceUser;

    @Value("${spring.datasource.password}")
    private String datasourcePassword;

    @Bean(initMethod = "migrate")
    Flyway flyway() {
        Flyway flyway = Flyway.configure()
            .dataSource(datasourceUrl, datasourceUser, datasourcePassword)
            .locations("classpath:db/migration")
            .load();

        return flyway;
    }
}