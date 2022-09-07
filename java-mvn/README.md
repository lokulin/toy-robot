## Starting a new mvn project

```
mvn archetype:generate -DgroupId=com.lauchlin -DartifactId=toyrobot -DarchetypeArtifactId=maven-archetype-quickstart
```

Update the compiler version:

```
<properties>
    <java.version>1.8</java.version>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
</properties>
```

Add a main class:

```
  <build>
    <plugins>
    <plugin>
      <groupId>org.apache.maven.plugins</groupId>
      <artifactId>maven-jar-plugin</artifactId>
      <configuration>
          <archive>
              <manifest>
                  <mainClass>com.lauchlin.toyrobot.App</mainClass>
              </manifest>
          </archive>
      </configuration>
    </plugin>  
    </plugins>
  </build>
```
