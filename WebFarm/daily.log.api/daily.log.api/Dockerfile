# See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This stage is used when running from VS in fast mode (Default for Debug configuration)
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081

# Node.js stage to build React app
FROM node:20 AS client-build
WORKDIR /clientapp
COPY clientapp/package*.json ./
RUN npm install
COPY clientapp/ .
RUN npm run build

# This stage is used to build the service project
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["daily.log.api/daily.log.api.csproj", "daily.log.api/"]
RUN dotnet restore "./daily.log.api/daily.log.api.csproj"
COPY . .
# Copy React build to wwwroot before building API
COPY --from=client-build /clientapp/build ./daily.log.api/wwwroot/
WORKDIR "/src/daily.log.api"
RUN dotnet build "./daily.log.api.csproj" -c $BUILD_CONFIGURATION -o /app/build

# This stage is used to publish the service project to be copied to the final stage
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./daily.log.api.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# This stage is used in production or when running from VS in regular mode (Default when not using the Debug configuration)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "daily.log.api.dll"]