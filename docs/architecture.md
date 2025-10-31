# System Architecture

## Overview
DevOps Simulator follows a **microservices and event-driven architecture** designed for **high availability, scalability, and developer efficiency**.  
This document unifies details from both **Production**, **Development**, and **Experimental (AI-enhanced)** configurations.

---

## Components

### 1. Application Server
| Environment | Details |
|--------------|----------|
| **Production** | Node.js + Express, Port **8080**, Horizontal auto-scaling enabled |
| **Development** | Node.js + Express (with hot reload), Port **3000**, Chrome DevTools debugger on **9229** |
| **Experimental (AI)** | Node.js + Express + TensorFlow.js, Ports **9000–9002**, AI-powered predictive auto-scaling, real-time ML inference, Apache Kafka for event streaming |

---

### 2. Database Layer
| Environment | Details |
|--------------|----------|
| **Production** | PostgreSQL 14 with **master-slave replication** and **daily automated backups** |
| **Development** | PostgreSQL 14 (local), **manual backups**, **auto-seeded test data** |
| **Experimental (AI)** | PostgreSQL cluster (5 nodes) with **multi-master replication**, Redis cluster for caching, ML-based query optimization, and geo-redundant continuous backup |

---

### 3. Monitoring System
| Environment | Details |
|--------------|----------|
| **Production** | Prometheus + Grafana, tracks **CPU**, **Memory**, **Disk**, **Network**, sends **email alerts** |
| **Development** | Console logging with verbose mode, optional Prometheus dashboard |
| **Experimental (AI)** | Prometheus + Thanos + ELK Stack with **AI-driven log analysis**, anomaly detection, and predictive alerts |

---

### 4. Container Orchestration
| Environment | Details |
|--------------|----------|
| **Production** | Kubernetes (rolling updates, zero downtime) |
| **Development** | Docker Compose with **App**, **DB**, and **Redis**, hot reload enabled |
| **Experimental (AI)** | Kubernetes with custom CRDs, **multi-cloud deployment** (AWS, Azure, GCP, DigitalOcean), **GeoDNS-based failover** |

---

### 5. Authentication System
| Environment | Details |
|--------------|----------|
| **Production** | OAuth2 + JWT with strict session management |
| **Development** | OAuth2 + JWT (beta), Google & GitHub providers for test logins |
| **Experimental (AI)** | OAuth2 + AI threat detection layer with anomaly-based access control |

---

### 6. AI/ML Pipeline *(Experimental Only)*
- **Frameworks**: TensorFlow, PyTorch, Scikit-learn  
- **Models**:
  - Anomaly detection (LSTM)
  - Load prediction (XGBoost)
  - Auto-scaling optimization (Reinforcement Learning)
- **Training**: Continuous online learning  
- **Inference latency**: <50ms  

---

## Deployment Strategy

| Environment | Method | Zero Downtime | Rollback |
|--------------|---------|----------------|-----------|
| **Production** | Rolling updates | ✅ Yes | Automated on failure |
| **Development** | Docker Compose hot reload | ❌ No | `git checkout` previous commit |
| **Experimental (AI)** | Multi-cloud rolling deploy | ✅ Yes | AI-based rollback on anomaly detection |

---

## Security

| Environment | Measures |
|--------------|-----------|
| **Production** | SSL/TLS encryption, database encryption, regular security audits |
| **Development** | SSL disabled, plain-text credentials (local only), open CORS, debug endpoints |
| **Experimental (AI)** | Encrypted AI channels, anomaly detection for intrusions, zero-trust network policy |

---

## Development Workflow
1. Make code changes  
2. Hot reload rebuilds automatically  
3. Run unit tests  
4. Check console logs or AI dashboard  
5. Commit and push when stable  

---

## Experimental Features (Under Testing)
⚠️ **Warning**: These are experimental and not yet production-validated.
- Multi-cloud orchestration  
- AI-powered predictive scaling and log analysis  
- Reinforcement learning-based rollback  
- Real-time anomaly detection  
