# Dockyard - Complete Service Catalog

Comprehensive list of 1000+ self-hosted services available for Dockyard. 
See [ROADMAP.md](ROADMAP.md) for implementation phases.

**Status**: 10/1000+ implemented (1%)

---

**Jump to Category:**
[AI](#ai) | [Automation](#automation) | [Analytics](#analytics) | [Databases](#databases) | [Documentation](#documentation) | [Communication](#communication) | [Project Management](#project-management) | [File Storage](#file-storage) | [Security](#security) | [Search](#search) | [Low-Code](#low-code) | [E-Commerce](#e-commerce) | [Finance](#finance) | [ERP](#erp) | [Education](#education) | [Social](#social) | [Media](#media) | [Development](#development) | [Monitoring](#monitoring) | [Infrastructure](#infrastructure) | [And 30+ more categories...](#additional-categories)

---

## 🤖 AI - Artificial Intelligence (150+ services)

See [ROADMAP.md](ROADMAP.md) for implementation in Phases 1, 2, 11-15.

### Current (✅ = Implemented)
- ✅ **Ollama** (Port 11434) - Local LLM inference
- ✅ **ComfyUI** (Port 8188) - Stable Diffusion workflows  
- ✅ **Dify** (Port 3000) - LLM app development
- ✅ **Flowise** (Port 3001) - LLM flow builder
- ✅ **Langflow** - Visual LLM development

### LLM Interfaces & Chat (Priority 1-2)
- [ ] **Open WebUI** (Port 3100) - Modern Ollama UI
- [ ] **Anything LLM** (Port 3200) - RAG document chat
- [ ] **LibreChat** (Port 3080) - Multi-LLM unified chat
- [ ] **Danswer** (Port 3005) - AI document search
- [ ] **PrivateGPT** (Port 8001) - Private document chat
- [ ] **Quivr** (Port 3500) - Second brain RAG

### Image Generation (Priority 2)
- [ ] **Stable Diffusion WebUI** (Port 7860) - AUTOMATIC1111
- [ ] **InvokeAI** (Port 9090) - Professional SD UI
- [ ] **Fooocus** (Port 7865) - Simplified SD  
- [ ] **Kohya SS** (Port 7861) - LoRA training
- [ ] **SD.Next** (Port 7862) - Next-gen SD interface

### Code AI (Priority 2-3)
- [ ] **Tabby** (Port 8100) - Code completion (Copilot alternative)
- [ ] **Continue Server** (Port 65432) - VS Code AI assistant
- [ ] **CodeGPT** (Port 8101) - Code generation
- [ ] **Aider** (Port 8102) - AI pair programming
- [ ] **Cursor Server** (Port 8103) - AI code editor backend

### Text Generation (Priority 3)
- [ ] **Oobabooga Text Gen** (Port 7870) - Large model UI
- [ ] **LocalAI** (Port 8090) - OpenAI-compatible API
- [ ] **LM Studio Server** (Port 1234) - Local model runner
- [ ] **Kobold AI** (Port 5001) - Creative writing AI
- [ ] **SillyTavern** (Port 8000) - Character AI chat

### Model Serving & Inference (Priority 3-4)
- [ ] **vLLM** (Port 8200) - Fast LLM inference
- [ ] **Text Generation Inference** (Port 8201) - Hugging Face TGI
- [ ] **Triton Inference Server** (Port 8202) - NVIDIA inference
- [ ] **Ray Serve** (Port 8265) - ML model serving
- [ ] **BentoML** (Port 8203) - Model deployment
- [ ] **TorchServe** (Port 8204) - PyTorch serving
- [ ] **TensorFlow Serving** (Port 8501) - TF model serving
- [ ] **Seldon Core** (Port 8205) - ML deployment platform
- [ ] **KServe** (Port 8206) - Serverless ML inference
- [ ] **MLflow Serving** (Port 8207) - MLflow model deployment

### MLOps & Training (Priority 4-5)
- [ ] **MLflow** (Port 5000) - ML lifecycle
- [ ] **ClearML** (Port 8008) - ML experiment tracking
- [ ] **Weights & Biases** (self-hosted)
- [ ] **Kubeflow** - ML on Kubernetes
- [ ] **DVC Studio** - Data version control
- [ ] **ZenML** (Port 8210) - ML pipeline orchestration
- [ ] **Metaflow** (Port 8211) - ML infrastructure
- [ ] **Kedro** (Port 8212) - Data science framework
- [ ] **Polyaxon** (Port 8213) - ML platform
- [ ] **Pachyderm** (Port 8214) - Data versioning

### LLM Observability (Priority 2)
- [ ] **Langfuse** (Port 3400) - LLM observability
- [ ] **LangSmith** (self-hosted variant)
- [ ] **Helicone** (Port 8215) - LLM monitoring
- [ ] **LLMonitor** (Port 8216) - LLM analytics
- [ ] **Traceloop** (Port 8217) - LLM tracing

### AI Chatbots & Agents (Priority 3)
- [ ] **Botpress** (Port 3600) - Visual chatbot builder
- [ ] **Rasa** (Port 5005) - Conversational AI
- [ ] **Botkit** (Port 3601) - Bot development toolkit
- [ ] **Botpress** (Port 3602) - Enterprise chatbot
- [ ] **ChatterBot** (Port 3603) - Python chatbot

### Vector Databases (Current + Planned)
- ✅ **ChromaDB** (Port 9100) - Vector database
- ✅ **Qdrant** (Port 6333) - Vector search engine
- [ ] **Weaviate** (Port 8110) - Vector DB with AI
- [ ] **Milvus** (Port 19530) - Scalable vector DB
- [ ] **Vespa** (Port 8218) - Search + vector DB
- [ ] **Pinecone** (self-hosted variant)
- [ ] **LanceDB** (Port 8219) - Vector database
- [ ] **pgvector** (PostgreSQL extension)

### Computer Vision (Priority 4)
- [ ] **Label Studio** (Port 8220) - Data labeling
- [ ] **CVAT** (Port 8221) - Video annotation
- [ ] **Supervisely** (Port 8222) - Computer vision platform
- [ ] **V7** (self-hosted) - Training data platform
- [ ] **Roboflow** (self-hosted) - CV workflow

### Speech & Audio AI (Priority 5)
- [ ] **Whisper Server** (Port 9000) - Speech-to-text
- [ ] **Piper** (Port 9001) - Text-to-speech
- [ ] **Coqui TTS** (Port 9002) - TTS engine
- [ ] **Silero** (Port 9003) - STT/TTS models
- [ ] **DeepSpeech** (Port 9004) - Speech recognition

### AI Tools & Utilities (Priority 5)
- [ ] **Gradio** (Port 7860) - ML app interface
- [ ] **Streamlit** (Port 8501) - Data app framework
- [ ] **Hugging Face Spaces** (self-hosted)
- [ ] **LiteLLM Proxy** (Port 4000) - LLM router
- [ ] **Semantic Kernel** (Port 8230) - AI orchestration

### Research & Notebooks (Priority 3)
- ✅ **Jupyter Lab** (Port 8889) - Interactive computing
- [ ] **JupyterHub** (Port 8000) - Multi-user Jupyter
- [ ] **Apache Zeppelin** (Port 8231) - Web-based notebook
- [ ] **RStudio Server** (Port 8787) - R development
- [ ] **Databricks** (self-hosted) - Unified analytics

### AI-Powered Apps (Priority 5)
- [ ] **Monica** (Port 8232) - Personal CRM with AI
- [ ] **Khoj** (Port 8233) - AI second brain
- [ ] **Mem** (self-hosted) - AI note-taking
- [ ] **Reclaim.ai** (self-hosted) - AI scheduling
- [ ] **Tome** (self-hosted) - AI presentations

### Additional AI Services (100+)
*(Detailed list in full catalog - see Phase 11-15 in ROADMAP.md)*

---

## 🔄 Automation & Workflows (80+ services)

See [ROADMAP.md](ROADMAP.md) for implementation in Phases 5, 10.

### Current
- ✅ **n8n** (Port 5678) - Workflow automation

### High Priority
- [ ] **Activepieces** (Port 8082) - AI-powered automation
- [ ] **Windmill** (Port 8300) - Developer-first workflows
- [ ] **Temporal** (Port 7233) - Durable workflows
- [ ] **Apache Airflow** (Port 8081) - Data pipelines
- [ ] **Prefect** (Port 4200) - Modern workflows
- [ ] **Kestra** (Port 8085) - Orchestration
- [ ] **Dagster** (Port 3000) - Data orchestrator
- [ ] **Argo Workflows** (Port 2746) - Kubernetes workflows
- [ ] **Flyte** (Port 8088) - ML/data workflows
- [ ] **Luigi** (Port 8082) - Batch job pipeline

### Additional Automation (70+ more services listed in full catalog)

---

## 📊 Analytics & Business Intelligence (60+ services)

### Current
- [ ] Planning Phase 1

### High Priority  
- [ ] **Metabase** (Port 3050) - BI platform
- [ ] **Apache Superset** (Port 3060) - Data exploration
- [ ] **Redash** (Port 5000) - SQL dashboards
- [ ] **Grafana** (Port 3700) - Metrics visualization  
- [ ] **Plausible** (Port 8010) - Web analytics
- [ ] **Umami** (Port 3020) - Simple analytics

### Additional Analytics (50+ more services)

---

## 🗄️ Databases (80+ services)

### Current
- ✅ **ChromaDB** (Port 9100) - Vector database
- ✅ **Qdrant** (Port 6333) - Vector search

### SQL Databases (Priority 1)
- [ ] **PostgreSQL** (Port 5432) - Production SQL
- [ ] **MySQL** (Port 3306) - Popular SQL
- [ ] **MariaDB** (Port 3307) - MySQL fork
- [ ] **SQLite** (embedded)
- [ ] **CockroachDB** (Port 26257) - Distributed SQL
- [ ] **TiDB** (Port 4000) - MySQL-compatible distributed
- [ ] **YugabyteDB** (Port 5433) - Distributed SQL

### NoSQL Databases (Priority 2-3)
- [ ] **MongoDB** (Port 27017) - Document DB
- [ ] **CouchDB** (Port 5984) - Document DB with sync
- [ ] **RethinkDB** (Port 28015) - Realtime DB
- [ ] **ArangoDB** (Port 8529) - Multi-model
- [ ] **OrientDB** (Port 2480) - Multi-model graph

### Time Series (Priority 3)
- [ ] **InfluxDB** (Port 8086) - Time series
- [ ] **TimescaleDB** (Port 5433) - Time series PostgreSQL
- [ ] **Victoria Metrics** (Port 8428) - Time series
- [ ] **Prometheus** (Port 9090) - Time series + monitoring
- [ ] **QuestDB** (Port 9000) - High-performance time series

### Key-Value & Cache (Priority 1)
- [ ] **Redis** (Port 6379) - In-memory cache
- [ ] **KeyDB** (Port 6380) - Multi-threaded Redis
- [ ] **Memcached** (Port 11211) - Memory cache
- [ ] **Dragonfly** (Port 6379) - Modern Redis alternative
- [ ] **Valkey** (Port 6379) - Redis fork

### Graph Databases (Priority 3-4)
- [ ] **Neo4j** (Port 7474) - Graph database
- [ ] **JanusGraph** (Port 8182) - Distributed graph
- [ ] **Dgraph** (Port 8080) - Distributed graph
- [ ] **Nebula Graph** (Port 9669) - Distributed graph
- [ ] **Apache AGE** (PostgreSQL extension)

### Wide-Column (Priority 4)
- [ ] **Cassandra** (Port 9042) - Wide-column distributed
- [ ] **ScyllaDB** (Port 9043) - Cassandra-compatible
- [ ] **HBase** (Port 16010) - Hadoop database
- [ ] **Apache Accumulo** (Port 9999) - Sorted distributed

### Analytical (Priority 3)
- [ ] **ClickHouse** (Port 8123) - OLAP database
- [ ] **Apache Druid** (Port 8888) - Real-time analytics
- [ ] **Apache Pinot** (Port 9000) - Real-time OLAP
- [ ] **StarRocks** (Port 9030) - MPP analytics
- [ ] **Apache Doris** (Port 9030) - MPP database

### Additional Databases (30+ more services)

---

## 📝 Documentation & Knowledge Management (70+ services)

### Current
- [ ] Planning Phase 2

### High Priority
- [ ] **Outline** (Port 3110) - Notion alternative
- [ ] **BookStack** (Port 6875) - Documentation
- [ ] **Wiki.js** (Port 3210) - Modern wiki
- [ ] **Docusaurus** (Port 3300) - Static docs
- [ ] **Hedgedoc** (Port 3030) - Collaborative markdown

### Note Taking (40+ services including Trilium, Joplin, Standard Notes, etc.)
### Knowledge Bases (20+ services)
### API Documentation (10+ services)

---

## 💬 Communication & Collaboration (90+ services)

### Team Chat (Priority 3)
- [ ] **Mattermost** (Port 8065) - Slack alternative
- [ ] **Rocket.Chat** (Port 3040) - Team chat
- [ ] **Zulip** (Port 9991) - Threaded chat
- [ ] **Element** (Port 8008) - Matrix client
- [ ] **Chatwoot** (Port 3000) - Customer messaging

### Video Conferencing (Priority 3)
- [ ] **Jitsi Meet** (Port 8443) - Video calls
- [ ] **BigBlueButton** (Port 8080) - Web conferencing
- [ ] **Galene** (Port 8443) - Videoconference server
- [ ] **LiveKit** (Port 7880) - WebRTC infrastructure
- [ ] **Mediasoup** (Port 3000) - WebRTC framework

### Additional Communication (70+ more services including email, forums, social)

---

## 🎯 Project & Task Management (60+ services)

### Project Management (Priority 3-4)
- [ ] **Plane** (Port 3310) - Jira/Linear alternative
- [ ] **Focalboard** (Port 8000) - Trello alternative
- [ ] **Taiga** (Port 9000) - Agile PM
- [ ] **Wekan** (Port 8012) - Kanban
- [ ] **OpenProject** (Port 8030) - PM suite
- [ ] **Redmine** (Port 8031) - PM tool
- [ ] **Phabricator** (Port 8032) - Development platform

### Time & Resource (20+ services)
### Agile Tools (15+ services)
### Task Trackers (15+ services)

---

## 🗂️ File Management & Storage (50+ services)

### Cloud Storage (Priority 3)
- [ ] **Nextcloud** (Port 8200) - Complete cloud
- [ ] **Seafile** (Port 8400) - File sync
- [ ] **ownCloud** (Port 8401) - File sharing
- [ ] **Syncthing** (Port 8384) - P2P sync
- [ ] **Filestash** (Port 8402) - File browser

### Object Storage (Priority 2)
- [ ] **MinIO** (Port 9001) - S3-compatible
- [ ] **SeaweedFS** (Port 9333) - Distributed storage
- [ ] **Ceph** (Port 8443) - Distributed storage
- [ ] **GlusterFS** (Port 24007) - Distributed file system

### Additional File Services (40+ including document management, file browsers, etc.)

---

## 🔐 Security & Authentication (70+ services)

### Identity & Auth (Priority 4)
- [ ] **Authentik** (Port 9000) - Identity provider
- [ ] **Keycloak** (Port 8180) - IAM
- [ ] **Authelia** (Port 9091) - Auth proxy
- [ ] **LLDAP** (Port 3890) - Lightweight LDAP
- [ ] **FreeIPA** (Port 443) - Identity management

### Password Management (Priority 4)
- [ ] **Vaultwarden** (Port 8500) - Bitwarden
- [ ] **Passbolt** (Port 8970) - Team passwords
- [ ] **Psono** (Port 10100) - Password manager
- [ ] **Padloc** (Port 3000) - Password manager

### Secrets Management (Priority 4)
- [ ] **Vault** (Port 8200) - HashiCorp secrets
- [ ] **Infisical** (Port 8700) - Secret management
- [ ] **Doppler** (self-hosted) - Secrets sync
- [ ] **SOPS** - Encrypted secrets

### VPN & Network Security (Priority 4)
- [ ] **WireGuard** (Port 51820) - Modern VPN
- [ ] **Tailscale** - Zero-config VPN
- [ ] **Headscale** (Port 8650) - Tailscale control
- [ ] **OpenVPN** (Port 1194) - Classic VPN
- [ ] **NetBird** (Port 8640) - Mesh network

### DNS & Ad Blocking (Priority 4)
- [ ] **Pi-hole** (Port 8053) - Ad blocking
- [ ] **AdGuard Home** (Port 3030) - DNS filter
- [ ] **Blocky** (Port 4000) - DNS proxy
- [ ] **CoreDNS** (Port 1053) - DNS server

### Additional Security (40+ services including firewalls, SIEM, vulnerability scanning)

---

## 🔍 Search Engines (40+ services)

### General Search (Priority 4)
- [ ] **Meilisearch** (Port 7700) - Typo-tolerant search
- [ ] **Typesense** (Port 8108) - Search engine
- [ ] **Elasticsearch** (Port 9200) - Full-text search
- [ ] **OpenSearch** (Port 9200) - ES fork
- [ ] **Sonic** (Port 1491) - Lightweight search
- [ ] **Zinc** (Port 4080) - ES alternative
- [ ] **Manticore Search** (Port 9308) - Search engine
- [ ] **Apache Solr** (Port 8983) - Enterprise search

### Specialized Search (20+ services)
### Search Infrastructure (10+ services)

---

## 🚀 Low-Code / No-Code Platforms (50+ services)

### App Builders (Priority 5)
- [ ] **Appsmith** (Port 8091) - Internal tools
- [ ] **Budibase** (Port 4001) - Business apps
- [ ] **Tooljet** (Port 8600) - App builder
- [ ] **Retool** (self-hosted) - Internal tools
- [ ] **UI Bakery** (Port 8601) - Low-code platform

### Database UI (Priority 5)
- [ ] **NocoDB** (Port 8084) - Airtable alternative
- [ ] **Baserow** (Port 8602) - No-code database
- [ ] **Rowy** (Port 3003) - Firestore UI
- [ ] **ILLA Builder** (Port 8603) - Internal tools

### Additional Low-Code (35+ including form builders, workflow designers, etc.)

---

## 🛒 E-Commerce & Retail (60+ services)

### E-Commerce Platforms (Priority 6)
- [ ] **Medusa** (Port 9000) - Shopify alternative
- [ ] **Saleor** (Port 8700) - Headless commerce
- [ ] **Bagisto** (Port 8701) - Laravel commerce
- [ ] **PrestaShop** (Port 8210) - E-commerce
- [ ] **Shopware** (Port 8220) - Enterprise commerce
- [ ] **Magento** (Port 8702) - Commerce platform
- [ ] **WooCommerce** (WordPress plugin)
- [ ] **Reaction Commerce** (Port 3000)
- [ ] **Spree Commerce** (Port 3000)
- [ ] **Sylius** (Port 8230) - Symfony commerce

### POS Systems (10+ services)
### Inventory Management (15+ services)
### Payment Processing (10+ services)
### Marketplace Platforms (10+ services)

---

## 💰 Finance & Accounting (50+ services)

### Personal Finance (Priority 6)
- [ ] **Firefly III** (Port 8300) - Finance manager
- [ ] **Actual Budget** (Port 5006) - Budgeting
- [ ] **Kresus** (Port 9876) - Personal finance
- [ ] **Money Manager Ex** (Port 8301)
- [ ] **GnuCash** (desktop app)

### Invoicing & Billing (Priority 6)
- [ ] **Invoice Ninja** (Port 8310) - Invoicing
- [ ] **Crater** (Port 8320) - Invoicing
- [ ] **InvoicePlane** (Port 8321) - Invoices
- [ ] **SolidInvoice** (Port 8322) - Billing

### Accounting (Priority 6)
- [ ] **Akaunting** (Port 8330) - Accounting software
- [ ] **Frappe Books** (Port 8331) - Accounting
- [ ] **Manager** (Port 8332) - Accounting software

### Additional Finance (25+ including expense tracking, crypto wallets, trading platforms)

---

## 🏢 ERP & CRM (50+ services)

### ERP Systems (Priority 6)
- [ ] **ERPNext** (Port 8703) - Complete ERP
- [ ] **Odoo** (Port 8069) - Business suite
- [ ] **Dolibarr** (Port 8340) - ERP/CRM
- [ ] **iDempiere** (Port 8350) - Open source ERP
- [ ] **Apache OFBiz** (Port 8704) - ERP framework
- [ ] **Tryton** (Port 8000) - Business framework

### CRM Systems (Priority 6)
- [ ] **SuiteCRM** (Port 8705) - CRM platform
- [ ] **Vtiger** (Port 8706) - CRM & Helpdesk
- [ ] **EspoCRM** (Port 8707) - CRM software
- [ ] **Monica** (Port 8708) - Personal CRM
- [ ] **Twenty** (Port 8709) - Modern CRM

### Additional ERP/CRM (30+ services)

---

## 📚 Education & Learning (80+ services)

### LMS Platforms (Priority 7)
- [ ] **Moodle** (Port 8400) - Learning platform
- [ ] **Canvas LMS** (Port 8410) - Educational LMS
- [ ] **Open edX** (Port 8420) - MOOC platform
- [ ] **Chamilo** (Port 8430) - E-learning
- [ ] **Totara Learn** (Port 8431) - Enterprise LMS
- [ ] **ILIAS** (Port 8432) - Learning management

### Course Creation (15+ services)
### Knowledge Testing (20+ services)
### Educational Tools (35+ services)

---

## 📱 Social Networks & Community (75+ services)

### Social Networks (Priority 7)
- [ ] **Mastodon** (Port 8710) - Federated social
- [ ] **Lemmy** (Port 8536) - Reddit alternative
- [ ] **Pixelfed** (Port 8450) - Instagram alternative
- [ ] **PeerTube** (Port 9000) - YouTube alternative
- [ ] **Funkwhale** (Port 5000) - Music social
- [ ] **Diaspora** (Port 3000) - Distributed social
- [ ] **Friendica** (Port 8711) - Social platform
- [ ] **Hubzilla** (Port 8712) - Social CMS

### Forums & Discussion (Priority 7)
- [ ] **Discourse** (Port 4567) - Discussion platform
- [ ] **Flarum** (Port 8460) - Modern forum
- [ ] **NodeBB** (Port 8713) - Forum platform
- [ ] **phpBB** (Port 8714) - Bulletin board
- [ ] **MyBB** (Port 8715) - Forum software
- [ ] **Question2Answer** (Port 8716) - Q&A platform

### Additional Social (45+ including community platforms, social bookmarking, etc.)

---

## 📰 Content Management & Publishing (90+ services)

### CMS Platforms (Priority 7)
- [ ] **Ghost** (Port 2368) - Blogging
- [ ] **WordPress** (Port 8717) - Classic CMS
- [ ] **Joomla** (Port 8718) - CMS platform
- [ ] **Drupal** (Port 8719) - Enterprise CMS
- [ ] **Concrete CMS** (Port 8720) - Easy CMS
- [ ] **October CMS** (Port 8721) - Laravel CMS

### Headless CMS (Priority 7)
- [ ] **Strapi** (Port 1337) - Headless CMS
- [ ] **Directus** (Port 8055) - Data platform
- [ ] **Payload CMS** (Port 8722) - Headless CMS
- [ ] **Sanity** (self-hosted) - Content platform
- [ ] **Contentful** (self-hosted alternative)

### Static Site Generators (20+ services)
### Digital Publishing (15+ services)
### Newsletter Platforms (10+ services)

---

## 📺 Media Management (100+ services)

### Media Servers (Priority 9)
- [ ] **Jellyfin** (Port 8096) - Media server
- [ ] **Plex** (Port 32400) - Media server
- [ ] **Emby** (Port 8097) - Media server
- [ ] **Kodi** - Media center
- [ ] **Universal Media Server** (Port 5001)

### Photo Management (Priority 9)
- [ ] **Photoprism** (Port 2342) - Photo manager
- [ ] **Immich** (Port 2283) - Google Photos alt
- [ ] **Lychee** (Port 8890) - Photo management
- [ ] **Piwigo** (Port 8900) - Photo gallery
- [ ] **LibrePhotos** (Port 8901) - Photo management
- [ ] **Photoview** (Port 8902) - Photo gallery
- [ ] **Photonix** (Port 8903) - Photo manager

### Music Streaming (Priority 9)
- [ ] **Navidrome** (Port 4533) - Music server
- [ ] **Ampache** (Port 8910) - Audio streaming
- [ ] **Mopidy** (Port 6680) - Music server
- [ ] **Airsonic** (Port 4041) - Music streamer
- [ ] **Subsonic** (Port 4040) - Music streaming
- [ ] **Koel** (Port 8911) - Music streaming
- [ ] **Black Candy** (Port 8912) - Music server

### Video Processing (15+ services)
### Media Organization (20+ services)
### eBook & Comics (15+ services including Calibre-Web, Kavita, Komga, etc.)
### Podcast Management (10+ services)

---

## 🛠️ Development Tools (120+ services)

### Code Repositories (Priority 2)
- [ ] **Gitea** (Port 3700) - Git forge
- [ ] **GitLab CE** (Port 8929) - DevOps platform
- [ ] **Gogs** (Port 3001) - Git service
- [ ] **Forgejo** (Port 3702) - Gitea fork
- [ ] **Phabricator** (Port 8032) - Dev suite

### CI/CD (Priority 4)
- ✅ **n8n** can handle some CI/CD
- [ ] **Drone** (Port 8060) - CI/CD
- [ ] **Woodpecker** (Port 8070) - Drone fork
- [ ] **Jenkins** (Port 8913) - Automation
- [ ] **Tekton** - K8s-native CI/CD
- [ ] **Argo CD** (Port 8730) - GitOps
- [ ] **Concourse** (Port 8720) - CI pipeline
- [ ] **TeamCity** (Port 8914) - CI server

### Container Registries (Priority 4)
- [ ] **Harbor** (Port 8050) - Container registry
- [ ] **Docker Registry** (Port 5000) - Docker registry
- [ ] **Quay** (self-hosted) - Container registry
- [ ] **Portus** (Port 3000) - Registry frontend

### IDE & Code Servers (Priority 2)
- ✅ **Code-server** (Port 8080) - VS Code in browser
- ✅ **Jupyter Lab** (Port 8889) - Interactive computing
- [ ] **Eclipse Che** (Port 8915) - Cloud IDE
- [ ] **Coder** (Port 7080) - Dev environments
- [ ] **Gitpod** (self-hosted) - Cloud IDE
- [ ] **Theia IDE** (Port 3000) - Cloud IDE

### Code Quality (Priority 5)
- [ ] **SonarQube** (Port 9001) - Code quality
- [ ] **DeepSource** (Port 8750) - Code review
- [ ] **CodeClimate** (self-hosted) - Code analysis
- [ ] **CodeScene** (Port 8916) - Code analysis

### Testing (Priority 5)
- [ ] **Selenium Grid** (Port 4444) - Browser automation
- [ ] **Cypress Dashboard** - E2E testing
- [ ] **Katalon** (Port 8740) - Test automation
- [ ] **TestRail** (Port 8917) - Test management

### API Tools (20+ services including Postman alternatives, API gateways, etc.)
### Database Tools (15+ services)
### Monitoring for Devs (20+ services)

---

## 📊 Monitoring & Observability (90+ services)

### Metrics & Monitoring (Priority 4)
- [ ] **Prometheus** (Port 9090) - Metrics collection
- [ ] **Grafana** (Port 3710) - Visualization
- [ ] **Netdata** (Port 19999) - Real-time monitoring
- [ ] **Uptime Kuma** (Port 3721) - Uptime monitoring
- [ ] **Cacti** (Port 8690) - Network graphing
- [ ] **LibreNMS** (Port 8660) - Network monitoring
- [ ] **Zabbix** (Port 8670) - Enterprise monitoring
- [ ] **Nagios** (Port 8918) - IT monitoring
- [ ] **Icinga** (Port 8919) - Monitoring platform
- [ ] **Sensu** (Port 3000) - Monitoring solution
- [ ] **Checkmk** (Port 5000) - IT monitoring

### Logging (Priority 4)
- [ ] **Loki** (Port 3100) - Log aggregation
- [ ] **Graylog** (Port 9030) - Log management
- [ ] **Elastic Stack** (ELK) - Log analysis
- [ ] **Fluentd** (Port 24224) - Log collector
- [ ] **Seq** (Port 5341) - Log server

### Tracing (Priority 5)
- [ ] **Jaeger** (Port 16686) - Distributed tracing
- [ ] **Zipkin** (Port 9411) - Tracing system
- [ ] **Tempo** (Port 3200) - Distributed tracing
- [ ] **SigNoz** (Port 3301) - Observability platform

### APM (Priority 5)
- [ ] **Sentry** (Port 9010) - Error tracking
- [ ] **Elastic APM** (Port 8200) - Performance monitoring
- [ ] **Pinpoint** (Port 8920) - APM solution
- [ ] **SkyWalking** (Port 8080) - APM system

### Status Pages (Priority 5)
- [ ] **Uptime Kuma** (duplicate - see metrics)
- [ ] **Cachet** (Port 8001) - Status page
- [ ] **Statping** (Port 8921) - Status page
- [ ] **Gatus** (Port 8002) - Health dashboard

### Additional Monitoring (40+ services)

---

## 🌐 Infrastructure & Networking (100+ services)

### Reverse Proxies (Priority 4)
- [ ] **Traefik** (Port 8922) - Modern proxy
- [ ] **Nginx Proxy Manager** (Port 81) - Nginx UI
- [ ] **Caddy** (Port 2019) - Auto HTTPS
- [ ] **HAProxy** (Port 8923) - Load balancer
- [ ] **Envoy** (Port 9901) - Service proxy

### Container Management (Priority 2)
- [ ] **Portainer** (Port 9443) - Docker/K8s UI
- [ ] **Yacht** (Port 8710) - Container UI
- [ ] **Dozzle** (Port 8888) - Docker logs
- [ ] **Lazydocker** - Terminal Docker UI

### Kubernetes Tools (Priority 5)
- [ ] **K9s** - Terminal K8s UI
- [ ] **Lens** - K8s IDE
- [ ] **Rancher** (Port 8924) - K8s management
- [ ] **OpenShift** - Enterprise K8s
- [ ] **K3s** - Lightweight K8s

### Service Mesh (Priority 6)
- [ ] **Istio** - Service mesh
- [ ] **Linkerd** - Service mesh
- [ ] **Consul** (Port 8500) - Service mesh

### API Gateways (Priority 5)
- [ ] **Kong** (Port 8001) - API gateway
- [ ] **Tyk** (Port 8925) - API gateway
- [ ] **Gravitee** (Port 8083) - API management
- [ ] **KrakenD** (Port 8760) - API gateway
- [ ] **Apache APISIX** (Port 9080)

### Additional Infrastructure (60+ services including DNS, DHCP, IPAM, etc.)

---

## 🏠 Home Automation & IoT (70+ services)

### Home Automation (Priority 8)
- [ ] **Home Assistant** (Port 8123) - Home automation
- [ ] **OpenHAB** (Port 8926) - Smart home
- [ ] **Domoticz** (Port 8630) - Automation system
- [ ] **Node-RED** (Port 1880) - IoT flows
- [ ] **Home Bridge** (Port 8581) - HomeKit bridge

### IoT Platforms (Priority 8)
- [ ] **Mosquitto** (Port 1883) - MQTT broker
- [ ] **Zigbee2MQTT** (Port 8620) - Zigbee bridge
- [ ] **ESPHome** (Port 6052) - ESP firmware
- [ ] **Tasmota** - Device firmware
- [ ] **ThingsBoard** (Port 8927) - IoT platform

### Additional IoT (50+ services)

---

## 📝 Forms & Surveys (30+ services)

### Form Builders (Priority 7)
- [ ] **Formbricks** (Port 3002) - Open source forms
- [ ] **LimeSurvey** (Port 8095) - Survey platform
- [ ] **Typebot** (Port 3005) - Conversational forms
- [ ] **FormIO** (Port 3010) - Form builder
- [ ] **OhMyForm** (Port 3020) - TypeForm alternative
- [ ] **Framaforms** (Port 8928) - Form creator
- [ ] **SurveyJS** (Port 8929) - Survey library

### Additional Forms (20+ services)

---

## 🔖 Personal Productivity (80+ services)

### Bookmarks & Read-later (Priority 7)
- [ ] **Linkding** (Port 9090) - Bookmark manager
- [ ] **Shiori** (Port 8530) - Bookmark manager
- [ ] **Wallabag** (Port 8540) - Read-it-later
- [ ] **Readeck** (Port 8520) - Read-it-later
- [ ] **Omnivore** (Port 8930) - Read-later

### Note Taking (Priority 7)
- [ ] **Trilium** (Port 8931) - Hierarchical notes
- [ ] **Joplin Server** (Port 22300) - Note sync
- [ ] **Standard Notes** (Port 8932) - Encrypted notes
- [ ] **Memos** (Port 5230) - Lightweight notes
- [ ] **Obsidian Sync** (self-hosted)

### RSS Readers (Priority 7)
- [ ] **FreshRSS** (Port 8470) - RSS aggregator
- [ ] **Miniflux** (Port 8480) - RSS reader
- [ ] **Tiny Tiny RSS** (Port 8490) - RSS
- [ ] **Newsblur** (Port 8500) - News reader
- [ ] **Yarr** (Port 8933) - RSS reader

### Task Management (15+ services)
### Habit Tracking (10+ services)
### Personal Dashboards (20+ services)

---

## 🎮 Gaming & Entertainment (60+ services)

### Game Server Management (Priority 8)
- [ ] **Pterodactyl** (Port 8590) - Game server panel
- [ ] **AMP** (Port 8600) - Game manager
- [ ] **Crafty Controller** (Port 8610) - Minecraft manager
- [ ] **LinuxGSM** - Game server manager
- [ ] **PufferPanel** (Port 8934) - Game panel

### Specific Games (30+ including Minecraft, Terraria, Valheim servers, etc.)
### Game Libraries (10+ services)
### Retro Gaming (10+ services)

---

## 🔗 Utilities & Tools (100+ services)

### Link Shorteners (Priority 7)
- [ ] **Shlink** (Port 8550) - URL shortener
- [ ] **YOURLS** (Port 8560) - URL shortener
- [ ] **Kutt** (Port 8935) - Modern shortener
- [ ] **Polr** (Port 8936) - Link shortener

### Pastebin (Priority 7)
- [ ] **PrivateBin** (Port 8570) - Secure pastebin
- [ ] **Hastebin** (Port 7777) - Simple pastebin
- [ ] **Paaster** (Port 8580) - Pastebin
- [ ] **Ghostbin** (Port 8937) - Pastebin

### File Sharing (20+ services)
### QR Code Generators (10+ services)
### Text Tools (15+ services)
### Image Tools (20+ services)
### Video Tools (20+ services)

---

## 💾 Backup & Disaster Recovery (40+ services)

### Backup Solutions (Priority 8)
- [ ] **Duplicati** (Port 8938) - Backup software
- [ ] **Restic** - Backup program
- [ ] **BorgBackup** - Deduplicating backup
- [ ] **Bacula** (Port 9101) - Backup solution
- [ ] **UrBackup** (Port 55414) - Client/server backup
- [ ] **Kopia** (Port 51515) - Backup tool
- [ ] **Rclone** - Cloud sync
- [ ] **rsnapshot** - Filesystem snapshot

### Disaster Recovery (20+ services)
### Sync Solutions (10+ services)

---

## 🎨 Design & Creative Tools (50+ services)

### Design Tools (Priority 8)
- [ ] **Penpot** (Port 8850) - Figma alternative
- [ ] **Excalidraw** (Port 8860) - Whiteboard
- [ ] **Draw.io** (Port 8870) - Diagrams
- [ ] **Drawpile** (Port 27750) - Collaborative drawing
- [ ] **tldraw** (Port 8939) - Simple whiteboard

### Additional Creative (40+ including video editing, audio production, 3D tools, etc.)

---

## ⏱️ Time Management (30+ services)

### Time Tracking (Priority 8)
- [ ] **Kimai** (Port 8820) - Time tracking
- [ ] **Traggo** (Port 8830) - Tag-based tracking
- [ ] **Timetagger** (Port 8840) - Time tracking
- [ ] **Clockify** (self-hosted)
- [ ] **ActivityWatch** (Port 5600) - Activity tracker

### Calendar & Scheduling (15+ services)
### Pomodoro & Focus (10+ services)

---

## 🎚️ Feature Flags & A/B Testing (20+ services)

### Feature Flags (Priority 8)
- [ ] **Unleash** (Port 4242) - Feature toggles
- [ ] **Flagsmith** (Port 8800) - Feature flags
- [ ] **GrowthBook** (Port 8940) - A/B testing
- [ ] **FeatBit** (Port 8810) - Feature flags
- [ ] **Bullet Train** (Port 8941) - Feature flags

### Additional Experimentation (10+ services)

---

## 🔄 Data Integration & ETL (40+ services)

### ETL Platforms (Priority 8)
- [ ] **Airbyte** (Port 8942) - ELT platform
- [ ] **Meltano** (Port 8943) - DataOps platform
- [ ] **Apache NiFi** (Port 8780) - Data flow
- [ ] **Talend** (Port 8790) - Data integration
- [ ] **Singer** - ETL framework
- [ ] **dbt** - Data transformation

### Stream Processing (15+ services)
### Data Quality (10+ services)

---

## ⚡ Message Queues & Event Streaming (35+ services)

### Message Brokers (Priority 5)
- [ ] **RabbitMQ** (Port 15672) - Message broker
- [ ] **Apache Kafka** (Port 9092) - Event streaming
- [ ] **NATS** (Port 4222) - Messaging system
- [ ] **Redis Streams** (part of Redis)
- [ ] **Apache Pulsar** (Port 6650) - Pub/sub
- [ ] **Redpanda** (Port 8944) - Kafka alternative

### Job Queues (15+ services including BullMQ, Celery, etc.)

---

## 📧 Email & Communication (50+ services)

### Mail Servers (Priority 7)
- [ ] **Mailcow** (Port 8945) - Mail server suite
- [ ] **Mailu** (Port 8946) - Mail server
- [ ] **Mail-in-a-Box** (Port 443) - Easy mail
- [ ] **iRedMail** (Port 443) - Mail server
- [ ] **Postal** (Port 5000) - Mail platform

### Webmail (Priority 7)
- [ ] **Roundcube** (Port 8947) - Webmail
- [ ] **Rainloop** (Port 8948) - Webmail
- [ ] **SnappyMail** (Port 8949) - Webmail

### Email Tools (20+ including testing, newsletters, SMTP, etc.)

---

## 🌍 Translation & Localization (20+ services)

### Translation Platforms (Priority 9)
- [ ] **Weblate** (Port 8980) - Translation
- [ ] **Pontoon** (Port 8990) - Mozilla localization
- [ ] **Traduora** (Port 8950) - Translation management
- [ ] **Tolgee** (Port 8951) - Localization platform

---

## 🔔 Notifications & Alerts (30+ services)

### Notification Services (Priority 8)
- [ ] **Gotify** (Port 8952) - Push notifications
- [ ] **Apprise** (Port 8953) - Notification service
- [ ] **ntfy** (Port 8954) - Push notifications
- [ ] **Pushover** (self-hosted alternative)

### Alert Management (15+ services)

---

## 📱 Mobile & Remote Access (25+ services)

### Remote Desktop (Priority 8)
- [ ] **Guacamole** (Port 8955) - Remote desktop gateway
- [ ] **Apache Guacamole** (Port 8956) - Clientless remote
- [ ] **xrdp** (Port 3389) - Remote desktop
- [ ] **NoVNC** (Port 6080) - VNC in browser

### Mobile Device Management (10+ services)

---

## 🎯 Analytics & Tracking (Extended) (40+ services)

### Web Analytics (Priority 7)
- [ ] **Matomo** (Port 8957) - Web analytics
- [ ] **PostHog** (Port 8958) - Product analytics
- [ ] **Ackee** (Port 8959) - Privacy analytics
- [ ] **Fathom** (self-hosted) - Simple analytics
- [ ] **Shynet** (Port 8960) - Analytics

### Product Analytics (15+ services)
### Marketing Analytics (10+ services)

---

## Additional Categories (200+ services across 20+ more categories)

### Healthcare & Medical (40+ services)
### Legal & Compliance (30+ services)
### Real Estate (25+ services)
### Manufacturing & Supply Chain (40+ services)
### Hospitality & Tourism (30+ services)
### Non-Profit & Charity (20+ services)
### Government & Public Sector (30+ services)
### Agriculture (20+ services)
### Transportation & Logistics (30+ services)
### Energy & Utilities (25+ services)
### Construction (20+ services)
### Insurance (20+ services)
### Human Resources (40+ services)
### Customer Support (50+ services)
### Sales & Marketing (60+ services)
### Quality Assurance (25+ services)
### Compliance & Audit (30+ services)
### Research & Development (40+ services)
### Testing & Validation (35+ services)
### Specialized Industry Tools (100+ services)

---

## Summary Statistics

**Total Services Listed**: 1000+
**Currently Implemented**: 10 (1%)
**Categories**: 50+
**High Priority (Phases 1-4)**: 80 services
**Medium Priority (Phases 5-10)**: 120 services
**Low Priority (Phases 11-50)**: 800+ services

See [ROADMAP.md](ROADMAP.md) for detailed implementation phases.

---

**Last Updated**: 2025-12-06
**Project**: Dockyard
**Maintained by**: Zylarian Innovations LLC
