FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /app

COPY ./src .

RUN dotnet restore "helloworld.csproj"

WORKDIR /app
RUN dotnet publish "helloworld.csproj" -c Release -o /app --no-restore

FROM mcr.microsoft.com/dotnet/runtime:8.0-alpine
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "helloworld.dll"]