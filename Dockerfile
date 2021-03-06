FROM ubuntu:16.04
RUN apt-get update
RUN apt-get update && apt-get install -y \
  default-jre \
  default-jdk \
  git \
  wget

RUN wget http://www-us.apache.org/dist//jmeter/binaries/apache-jmeter-3.3.tgz
RUN tar -xzf apache-jmeter-3.3.tgz

RUN git clone https://github.com/Devops-POC/Jmeter.git
CMD ls
RUN cd apache-jmeter-3.3/bin && ./jmeter.sh -n -t /Jmeter/performance_test.jmx -l jmeter_211_test10_output.csv -J jmeter.save.saveservice.url=true -J jmeter.save.saveservice.print_field_names=true -J jmeter.save.saveservice.label=true -J summariser.name=summary -J summariser.out=true
