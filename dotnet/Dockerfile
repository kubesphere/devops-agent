FROM kubespheredev/builder-base:v3.1.0

RUN rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm

RUN yum install -y dotnet-sdk-5.0 dotnet-sdk-3.1

RUN dotnet tool install --global dotnet-sonarscanner

ENV PATH $PATH:/root/.nuget/tools:/root/.dotnet/tools:/usr/bin/sonar-scanner-3.3.0.1492-linux/bin

CMD ["dotnet", "--version"]
