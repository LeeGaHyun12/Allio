# Tomcat을 기반으로 하는 이미지
FROM tomcat:9.0

# WAR 파일 위치
ARG WAR_FILE=build/libs/PP-0.0.1-SNAPSHOT.war

# WAR 파일을 Tomcat의 webapps 디렉토리에 복사
COPY ${WAR_FILE} /usr/local/tomcat/webapps/ROOT.war

# Tomcat 서버를 시작
ENTRYPOINT ["catalina.sh", "run"]
