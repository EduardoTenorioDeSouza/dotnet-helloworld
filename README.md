# Criando aplicação hello world console net 8.0

dotnet new console --framework net8.0 --use-program-main

# Dockerfile Image com alphine

```
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
```
