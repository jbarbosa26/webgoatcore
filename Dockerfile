

###########################################################
# build container
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR ./sources
COPY WebGoat.NET/. ./sources/WebGoat.NET/
WORKDIR ./sources/WebGoat.NET
RUN dotnet publish -c release -o /app 

###########################################################
# deployment container
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app ./

ENTRYPOINT ["dotnet", "WebGoat.NET.dll"] 
