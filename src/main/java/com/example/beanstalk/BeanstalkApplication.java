package com.example.beanstalk;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import software.amazon.awssdk.regions.internal.util.EC2MetadataUtils;
import software.amazon.awssdk.services.elasticbeanstalk.ElasticBeanstalkClient;
import software.amazon.awssdk.services.elasticbeanstalk.model.EnvironmentDescription;

import java.util.List;

@RestController
@SpringBootApplication
public class BeanstalkApplication {

    public static void main(String[] args) {
        SpringApplication.run(BeanstalkApplication.class, args);
    }

    @GetMapping("/")
    public String index() {
        ElasticBeanstalkClient beanstalkClient = ElasticBeanstalkClient.create();
        List<EnvironmentDescription> environments = beanstalkClient.describeEnvironments().environments();
        for (EnvironmentDescription environment : environments) {
        }
        return EC2MetadataUtils.getInstanceId();
    }

    @GetMapping("/health")
    public String health() {
        return HttpStatus.OK.name();
    }
}
