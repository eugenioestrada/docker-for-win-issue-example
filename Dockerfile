#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/runtime:3.1-alpine3.11 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-alpine3.11 AS build
WORKDIR /src
COPY ["ConsoleApp4.csproj", ""]
RUN dotnet restore "./ConsoleApp4.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "ConsoleApp4.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ConsoleApp4.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ConsoleApp4.dll"]