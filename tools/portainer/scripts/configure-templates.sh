#!/bin/bash
# Script to automatically configure Portainer templates URL
# This runs after Portainer starts and configures the templates URL via API

set -e

PORTAINER_URL="http://localhost:9000"
TEMPLATES_URL="http://templates-server/templates.json"
ADMIN_USER="${PORTAINER_ADMIN_USER:-admin}"
ADMIN_PASS="${PORTAINER_ADMIN_PASSWORD:-admin123}"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}🔧 Configuring Portainer templates...${NC}"

# Wait for Portainer to be ready
echo -e "${YELLOW}⏳ Waiting for Portainer to start...${NC}"
for i in {1..30}; do
    if curl -s "$PORTAINER_URL/api/status" > /dev/null 2>&1; then
        echo -e "${GREEN}✓ Portainer is ready${NC}"
        break
    fi
    if [ $i -eq 30 ]; then
        echo -e "${RED}✗ Timeout waiting for Portainer${NC}"
        exit 1
    fi
    sleep 2
done

# Check if admin user exists (initialization required)
INIT_REQUIRED=$(curl -s "$PORTAINER_URL/api/users/admin/check" | grep -o '"requiresInitialSetup":[^,}]*' | cut -d':' -f2)

if [ "$INIT_REQUIRED" = "true" ]; then
    echo -e "${YELLOW}⚠️  Portainer requires initial setup${NC}"
    echo -e "${BLUE}Creating admin user...${NC}"
    
    # Initialize admin user
    curl -s -X POST "$PORTAINER_URL/api/users/admin/init" \
        -H "Content-Type: application/json" \
        -d "{\"Username\":\"$ADMIN_USER\",\"Password\":\"$ADMIN_PASS\"}" > /dev/null
    
    echo -e "${GREEN}✓ Admin user created${NC}"
    sleep 2
fi

# Login to get JWT token
echo -e "${BLUE}Logging in...${NC}"
TOKEN=$(curl -s -X POST "$PORTAINER_URL/api/auth" \
    -H "Content-Type: application/json" \
    -d "{\"username\":\"$ADMIN_USER\",\"password\":\"$ADMIN_PASS\"}" | grep -o '"jwt":"[^"]*' | cut -d'"' -f4)

if [ -z "$TOKEN" ]; then
    echo -e "${RED}✗ Failed to login${NC}"
    echo -e "${YELLOW}Please configure templates manually in Settings > App Templates${NC}"
    echo -e "${YELLOW}URL: $TEMPLATES_URL${NC}"
    exit 1
fi

echo -e "${GREEN}✓ Logged in successfully${NC}"

# Get current settings
echo -e "${BLUE}Updating settings...${NC}"
SETTINGS=$(curl -s -X GET "$PORTAINER_URL/api/settings" \
    -H "Authorization: Bearer $TOKEN")

# Update settings with templates URL
curl -s -X PUT "$PORTAINER_URL/api/settings" \
    -H "Authorization: Bearer $TOKEN" \
    -H "Content-Type: application/json" \
    -d "{
        \"TemplatesURL\": \"$TEMPLATES_URL\",
        \"LogoURL\": \"\",
        \"BlackListedLabels\": [],
        \"AuthenticationMethod\": 1,
        \"LDAPSettings\": {
            \"AnonymousMode\": true,
            \"ReaderDN\": \"\",
            \"URL\": \"\",
            \"TLSConfig\": {\"TLS\": false, \"TLSSkipVerify\": false},
            \"StartTLS\": false,
            \"SearchSettings\": [{\"BaseDN\": \"\", \"Filter\": \"\", \"UserNameAttribute\": \"\"}],
            \"GroupSearchSettings\": [{\"GroupBaseDN\": \"\", \"GroupFilter\": \"\", \"GroupAttribute\": \"\"}],
            \"AutoCreateUsers\": false
        },
        \"OAuthSettings\": {
            \"ClientID\": \"\",
            \"AccessTokenURI\": \"\",
            \"AuthorizationURI\": \"\",
            \"ResourceURI\": \"\",
            \"RedirectURI\": \"\",
            \"UserIdentifier\": \"\",
            \"Scopes\": \"\",
            \"OAuthAutoCreateUsers\": false,
            \"DefaultTeamID\": 0,
            \"SSO\": false,
            \"LogoutURI\": \"\",
            \"KubeSecretKey\": \"\"
        },
        \"SnapshotInterval\": \"5m\",
        \"EdgeAgentCheckinInterval\": 5,
        \"EnableEdgeComputeFeatures\": false,
        \"UserSessionTimeout\": \"8h\",
        \"KubeconfigExpiry\": \"0\",
        \"EnableTelemetry\": true,
        \"HelmRepositoryURL\": \"https://charts.bitnami.com/bitnami\",
        \"KubectlShellImage\": \"portainer/kubectl-shell\",
        \"TrustOnFirstConnect\": false,
        \"EnforceEdgeID\": false,
        \"AllowVolumeBrowserForRegularUsers\": false,
        \"AllowBindMountsForRegularUsers\": false,
        \"AllowPrivilegedModeForRegularUsers\": false,
        \"AllowHostNamespaceForRegularUsers\": false,
        \"AllowStackManagementForRegularUsers\": false,
        \"AllowDeviceMappingForRegularUsers\": false,
        \"AllowContainerCapabilitiesForRegularUsers\": false,
        \"EnableHostManagementFeatures\": false,
        \"FDOConfiguration\": {\"Enabled\": false, \"OwnerURL\": \"\", \"OwnerUsername\": \"\"}
    }" > /dev/null

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Templates URL configured successfully!${NC}"
    echo -e "${BLUE}Templates URL: $TEMPLATES_URL${NC}"
    echo ""
    echo -e "${GREEN}You can now access templates at:${NC}"
    echo -e "  ${BLUE}http://localhost:9000${NC} → App Templates"
else
    echo -e "${RED}✗ Failed to configure templates${NC}"
    echo -e "${YELLOW}Please configure manually in Settings > App Templates${NC}"
    echo -e "${YELLOW}URL: $TEMPLATES_URL${NC}"
fi
