FROM kubespheredev/builder-base:v3.1.0

RUN yum install -y krb5-libs libicu openssl-libs compat-openssl10 libgdiplus libstdc++-devel gcc

RUN wget https://dot.net/v1/dotnet-install.sh

RUN chmod a+x dotnet-install.sh

RUN sh dotnet-install.sh -c 5.0 --install-dir /usr/share/dotnet5

RUN ln -s /usr/share/dotnet5/dotnet /usr/bin/dotnet

RUN dotnet tool install --global dotnet-sonarscanner

ENV PATH $PATH:/root/.nuget/tools:/root/.dotnet/tools:/usr/bin/sonar-scanner-3.3.0.1492-linux/bin

CMD ["dotnet", "--version"]
