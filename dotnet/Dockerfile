FROM kubespheredev/builder-base:v3.1.0

RUN rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm

RUN yum install -y dotnet-sdk-5.0

RUN dotnet tool install --global dotnet-sonarscanner

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/bin/sonar-scanner-3.3.0.1492-linux/bin:/root/.nuget/tools:/root/.dotnet/tools

CMD ["dotnet", "--version"]
