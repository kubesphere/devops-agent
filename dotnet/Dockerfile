FROM kubespheredev/builder-base:v4.1.0

ENV DOTNETSDK_VERSION dotnet-sdk-8.0

# install dotnet-sdk
RUN apt-get install ca-certificates libc6 libgcc-s1 libgssapi-krb5-2 libicu70 liblttng-ust1 libssl3 libstdc++6 libunwind8 zlib1g -y  && \
    apt-get install $DOTNETSDK_VERSION -y  && \
    dotnet --version && dotnet --info

CMD ["dotnet", "--version"]
