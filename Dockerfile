# Use .NET 9 runtime for the final build
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

# Use .NET 9 SDK for building the application
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
# Copy and restore dependencies
COPY ["sathish.csproj", "./"]
RUN dotnet restore "sathish.csproj"
# Copy the remaining source code
COPY . .
WORKDIR "/src/"
# Build the project
RUN dotnet build "sathish.csproj" -c Release -o /app/build

# Publish the project
FROM build AS publish
RUN dotnet publish "sathish.csproj" -c Release -o /app/publish

# Final stage: Use runtime image to host the application
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "sathish.dll"]
