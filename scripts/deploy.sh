#!/bin/bash
set -e

DEPLOY_ENV=${DEPLOY_ENV:-"production"}

echo "====================================="
echo "DevOps Simulator - Deployment"
echo "====================================="

echo "Selected Environment: $DEPLOY_ENV"
echo "-------------------------------------"

# Pre-deployment checks
echo "Running pre-deployment checks..."
if [ ! -f "config/app-config.yaml" ]; then
    echo "Error: Configuration file not found!"
    exit 1
fi

if[ "$DEPLOY_ENV" == "production" ]; then
    echo "Mode: Production"
    DEPLOY_REGION="us-east-1"
    APP_PORT=8080
    echo "Region: $DEPLOY_REGION"
    echo "Port: $APP_PORT"


    echo "Starting production deployment..."
    echo "Pulling latest Docker images..."

    echo "Rolling update strategy initiated..."

    echo "Application available at: https://app.example.com"

elif [ "$DEPLOY_ENV" == "development" ]; then
    echo "Mode: Development"
    DEPLOY_MODE="docker-compose"
    APP_PORT=3000
    ENABLE_DEBUG=true
    echo "Mode: $DEPLOY_MODE"
    echo "Port: $APP_PORT"
    echo "Debug: $ENABLE_DEBUG"

    echo "Installing dependencies..."
    npm install

    echo "Running tests..."
    npm test

    echo "Starting development deployment..."
    echo "Using Docker Compose..."
    docker-compose up -d

    echo "Waiting for application to be ready..."
    sleep 5

    echo "Performing health check..."
    curl -f http://localhost:$APP_PORT/health || exit 1

    echo "Application available at: http://localhost:$APP_PORT"
    echo "Hot reload enabled - code changes will auto-refresh"

else
    echo "Error: Unknown environment '$DEPLOY_ENV'"
    exit 1
fi

echo "-------------------------------------"
echo "Deployment completed successfully!"