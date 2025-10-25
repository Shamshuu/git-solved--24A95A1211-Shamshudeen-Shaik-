# System Architecture

## Overview
DevOps Simulator follows a **microservices architecture** designed for **high availability, scalability, and developer efficiency**.  
This document outlines the configurations for both **Production** and **Development** environments.

---

## Components

### 1. Application Server
| Environment | Details |
|--------------|----------|
| **Production** | Node.js + Express, Port **8080**, Horizontal auto-scaling enabled |
| **Development** | Node.js + Express (with hot reload), Port **3000**, Manual scaling (single instance), Chrome DevTools debugger on port **9229** |

---

### 2. Database Layer
| Environment | Details |
|--------------|----------|
| **Production** | PostgreSQL 14 with **master-slave replication** and **daily automated backups** |
| **Development** | PostgreSQL 14 (local single instance), **manual backups**, **auto-seeded test data** on startup |

---

### 3. Monitoring System
| Environment | Details |
|--------------|----------|
| **Production** | Prometheus + Grafana, monitors **CPU**, **Memory**, **Disk**, **Network**, with **email alerts** for critical issues |
| **Development** | Console logging + optional Prometheus, monitors **CPU**, **Memory**, **Disk**, **Network**, **Build time**, console warnings only, and experimental dashboard UI |

---

### 4. Container Orchestration
| Environment | Details |
|--------------|----------|
| **Production** | Kubernetes (planned), rolling updates with zero downtime |
| **Development** | Docker Compose (local), includes **App**, **Database**, and **Redis cache**, with **volume mounts** for hot reload |

---

### 5. Authentication System
| Environment | Details |
|--------------|----------|
| **Production** | OAuth2 + JWT authentication with secure sessions |
| **Development** | OAuth2 + JWT (beta), Google & GitHub providers for testing, **Redis-based session storage** |

---

## Deployment Strategy

### Production
- **Method**: Rolling updates  
- **Zero-downtime**: Yes  
- **Rollback**: Automated on failure  

### Development
- **Method**: Docker Compose hot reload  
- **Zero-downtime**: Not applicable  
- **Rollback**: `git checkout` previous commit  

---

## Development Workflow
1. Make code changes  
2. Auto-reload triggers rebuild  
3. Run unit tests  
4. Check console logs  
5. Commit when ready  

---

## Security

| Environment | Key Security Measures |
|--------------|-----------------------|
| **Production** | SSL/TLS encryption, database connection encryption, regular security audits |
| **Development** | SSL/TLS disabled, credentials in plain text (dev only), CORS enabled for all origins, debug endpoints exposed |

---

## Experimental Features (Dev Only)
⚠️ **Warning**: These features are experimental and under active testing:
- Multi-cloud deployment  
- AI-powered log analysis  
- Automatic rollback on anomaly detection  
