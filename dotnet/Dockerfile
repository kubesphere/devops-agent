FROM kubespheredev/builder-base:v3.1.0

RUN yum install -y krb5-libs libicu openssl-libs compat-openssl10 libgdiplus libstdc++-devel devtoolset-7-gcc devtoolset-7-gcc-c++ devtoolset-7-binutils

RUN wget https://dot.net/v1/dotnet-install.sh

RUN chmod a+x dotnet-install.sh

RUN sh dotnet-install.sh -c 6.0 --install-dir /usr/share/dotnet6

RUN ln -s /usr/share/dotnet6/dotnet /usr/bin/dotnet

ENV PATH $PATH:/root/.nuget/tools:/root/.dotnet/tools

CMD ["dotnet", "--version"]
