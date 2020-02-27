# Spring Data JPA

## non spring boot

### 1. Configuration class
We have to create a configuration class that configures the persistence layer of our application

```java
@Configuration
class PersistenceContext {
 
    //Configure the required beans here
}
```

### 2. Configuring the Datasource Bean

```java
final DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("org.h2.Driver");
        dataSource.setUsername("sa");
        dataSource.setPassword("");
        dataSource.setUrl("jdbc:h2:mem:datajpa");

        return dataSource;
```

### 3. Configuring the Entity Manager Factory Bean

1. Create a new LocalContainerEntityManagerFactoryBean object. We need to create this object because it creates the JPA EntityManagerFactory.
1. Configure the used datasource.
1. Configure the Hibernate specific implementation of the JpaVendorAdapter interface. It will initialize our configuration with the default settings that are compatible with Hibernate.
1. Configure the packages that are scanned for entity classes.
1. Configure the JPA properties that are used to provide additional configuration to the used JPA provider.

```java
   @Bean
   public LocalContainerEntityManagerFactoryBean entityManagerFactory() {
      LocalContainerEntityManagerFactoryBean em 
        = new LocalContainerEntityManagerFactoryBean();
      em.setDataSource(dataSource());
      em.setPackagesToScan(new String[] { "com.baeldung.persistence.model" });
 
      JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
      em.setJpaVendorAdapter(vendorAdapter);
      em.setJpaProperties(additionalProperties());
 
      return em;
   }
   
   Properties additionalProperties() {
    Properties properties = new Properties();
    properties.setProperty("hibernate.hbm2ddl.auto", "create-drop");
    properties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        
    return properties;
   ```
   
 ### 4. Configuring the Transaction Manager Bean

1.Create a new JpaTransactionManager object.
1.Configure the entity manager factory whose transactions are managed by the created JpaTransactionManager object.

```java
@Bean
JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
    JpaTransactionManager transactionManager = new JpaTransactionManager();
    transactionManager.setEntityManagerFactory(entityManagerFactory);
    return transactionManager;
}
```

### 5. Enabling Annotation-Driven Transaction Management
We can enable annotation-driven transaction management by annotating the PersistenceContext class with the @EnableTransactionManagement annotation

```java
@Configuration
@EnableTransactionManagement
class PersistenceContext {
     
    //The beans are configured here
}
```

### 6. Configuring Spring Data JPA
We can configure Spring Data JPA by following these steps:

1.Enable Spring Data JPA by annotating the PersistenceContext class with the @EnableJpaRepositories annotation.
1.Configure the base packages that are scanned when Spring Data JPA creates implementations for our repository interfaces.

```java
@Configuration
@EnableJpaRepositories(basePackages = {
        "net.petrikainulainen.springdata.jpa.todo"
})
@EnableTransactionManagement
class PersistenceContext {
     
    //The beans are configured here
}
```
