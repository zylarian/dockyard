#!/bin/bash
# Auto-generate Portainer templates.json from image directories
# This script scans images/ directory and creates templates based on metadata

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOCKYARD_ROOT="$(cd "$SCRIPT_DIR/../../.." && pwd)"
OUTPUT_FILE="$SCRIPT_DIR/../templates/templates.json"

# Colors
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

echo -e "${BLUE}🔧 Generating Portainer templates from images...${NC}"
echo ""

# Start JSON
cat > "$OUTPUT_FILE" << 'EOF'
{
  "version": "2",
  "templates": [
EOF

FIRST_TEMPLATE=true

# Function to add comma if not first template
add_comma() {
    if [ "$FIRST_TEMPLATE" = false ]; then
        echo "," >> "$OUTPUT_FILE"
    fi
    FIRST_TEMPLATE=false
}

# Scan all image directories
for category_dir in "$DOCKYARD_ROOT/images"/*; do
    if [ ! -d "$category_dir" ]; then
        continue
    fi
    
    category=$(basename "$category_dir")
    
    for image_dir in "$category_dir"/*; do
        if [ ! -d "$image_dir" ]; then
            continue
        fi
        
        image_name=$(basename "$image_dir")
        
        # Skip if no VERSION file
        if [ ! -f "$image_dir/VERSION" ]; then
            echo -e "${YELLOW}⚠️  Skipping $image_name: No VERSION file${NC}"
            continue
        fi
        
        # Read VERSION file
        source "$image_dir/VERSION" 2>/dev/null || continue
        
        # Function to get logo as base64
        get_logo_base64() {
            local app_name=$1
            local logo_file="$SCRIPT_DIR/../templates/logos/$app_name.svg"
            if [ -f "$logo_file" ]; then
                echo "data:image/svg+xml;base64,$(base64 -w 0 "$logo_file")"
            else
                # Fallback to PNG if SVG doesn't exist
                local png_file="$SCRIPT_DIR/../templates/logos/$app_name.png"
                if [ -f "$png_file" ]; then
                    echo "data:image/png;base64,$(base64 -w 0 "$png_file")"
                else
                    echo ""
                fi
            fi
        }

        # Determine image-specific values
        IMAGE_NAME="zylarian/dockyard-$image_name"
        
        case "$image_name" in
            langflow)
                TITLE="Langflow"
                DESC="Visual AI workflow builder powered by LangChain"
                CATEGORIES='["AI", "LLM", "Workflow"]'
                LOGO="$(get_logo_base64 langflow)"
                PORT="7860"
                VOLUME_PATH="/app/data"
                ENV_VARS='[
                    {"name": "LANGFLOW_HOST", "label": "Host", "default": "0.0.0.0"},
                    {"name": "LANGFLOW_PORT", "label": "Port", "default": "7860"},
                    {"name": "LANGFLOW_DATABASE_URL", "label": "Database URL", "default": "sqlite:///./data/langflow.db"}
                ]'
                ;;
            flowise)
                TITLE="Flowise"
                DESC="Drag & drop UI to build customized LLM flows"
                CATEGORIES='["AI", "LLM", "Chatbot"]'
                LOGO="$(get_logo_base64 flowise)"
                PORT="3000"
                VOLUME_PATH="/app/data"
                ENV_VARS='[
                    {"name": "PORT", "label": "Port", "default": "3000"},
                    {"name": "FLOWISE_USERNAME", "label": "Admin Username", "default": "admin"},
                    {"name": "FLOWISE_PASSWORD", "label": "Admin Password", "default": "admin"}
                ]'
                ;;
            n8n)
                TITLE="n8n"
                DESC="Powerful workflow automation tool"
                CATEGORIES='["Automation", "Workflow", "Integration"]'
                LOGO="$(get_logo_base64 n8n)"
                PORT="5678"
                VOLUME_PATH="/home/node/.n8n"
                ENV_VARS='[
                    {"name": "N8N_HOST", "label": "Host", "default": "0.0.0.0"},
                    {"name": "N8N_PORT", "label": "Port", "default": "5678"},
                    {"name": "N8N_BASIC_AUTH_ACTIVE", "label": "Enable Basic Auth", "default": "true"}
                ]'
                ;;
            code-server)
                TITLE="Code Server"
                DESC="VS Code in the browser"
                CATEGORIES='["Development", "IDE", "Tools"]'
                LOGO="$(get_logo_base64 vscode)"
                PORT="8080"
                VOLUME_PATH="/home/coder/.config/code-server"
                ENV_VARS='[
                    {"name": "PASSWORD", "label": "Password", "default": "coder"},
                    {"name": "TZ", "label": "Timezone", "default": "UTC"}
                ]'
                ;;
            dify)
                TITLE="Dify API (Standalone)"
                DESC="Dify Backend API only (requires external DB/Redis)"
                CATEGORIES='["AI", "LLM", "Backend"]'
                LOGO="$(get_logo_base64 dify)"
                PORT="5001"
                VOLUME_PATH="/app/api/storage"
                ENV_VARS='[
                    {"name": "DB_HOST", "label": "Database Host", "default": "postgres"},
                    {"name": "DB_PASSWORD", "label": "Database Password", "default": "dify"}
                ]'
                ;;
            qdrant)
                TITLE="QDrant"
                DESC="Vector Database for the next generation of AI applications"
                CATEGORIES='["AI", "Database", "Vector"]'
                LOGO="$(get_logo_base64 qdrant)"
                PORT="6333"
                VOLUME_PATH="/qdrant/storage"
                ENV_VARS='[]'
                ;;
            chromadb)
                TITLE="ChromaDB"
                DESC="The AI-native open-source embedding database"
                CATEGORIES='["AI", "Database", "Vector"]'
                LOGO="$(get_logo_base64 chromadb)"
                PORT="9100"
                INTERNAL_PORT="8000"
                VOLUME_PATH="/chroma/chroma"
                ENV_VARS='[
                    {"name": "IS_PERSISTENT", "label": "Persistent", "default": "TRUE"}
                ]'
                ;;
            *)
                echo -e "${YELLOW}⚠️  Skipping $image_name: No template definition${NC}"
                continue
                ;;
        esac
        
        # Add template
        add_comma
        cat >> "$OUTPUT_FILE" << EOF
    {
      "type": 1,
      "title": "$TITLE",
      "description": "$DESC",
      "categories": $CATEGORIES,
      "platform": "linux",
      "logo": "$LOGO",
      "image": "$IMAGE_NAME:latest",
      "name": "$image_name",
      "user": "root",
      "ports": ["$PORT:${INTERNAL_PORT:-$PORT}/tcp"],
      "volumes": [
        {
          "container": "$VOLUME_PATH",
          "bind": "${image_name}_data"
        }
      ],
      "env": $ENV_VARS
    }
EOF
        
        echo -e "${GREEN}✓ Added template: $TITLE${NC}"
    done
done

# Add stack templates
for category_dir in "$DOCKYARD_ROOT/images"/*; do
    if [ ! -d "$category_dir" ]; then
        continue
    fi
    
    category=$(basename "$category_dir")
    
    for image_dir in "$category_dir"/*; do
        if [ ! -d "$image_dir" ]; then
            continue
        fi
        
        image_name=$(basename "$image_dir")
        
        # Skip if no docker-compose.yml
        if [ ! -f "$image_dir/docker-compose.yml" ]; then
            continue
        fi
        
        # Determine stack-specific values
        case "$image_name" in
            langflow)
                TITLE="Langflow with PostgreSQL"
                DESC="Langflow with PostgreSQL database for production"
                CATEGORIES='["AI", "LLM", "Workflow"]'
                LOGO="$(get_logo_base64 langflow)"
                ;;
            flowise)
                TITLE="Flowise with PostgreSQL"
                DESC="Flowise with PostgreSQL database for production"
                CATEGORIES='["AI", "LLM", "Chatbot"]'
                LOGO="$(get_logo_base64 flowise)"
                ;;
            n8n)
                TITLE="n8n with PostgreSQL"
                DESC="n8n with PostgreSQL database for production"
                CATEGORIES='["Automation", "Workflow"]'
                LOGO="$(get_logo_base64 n8n)"
                ;;
            dify)
                TITLE="Dify Full Stack"
                DESC="Complete Dify Platform (Web, API, Worker, DB, Redis)"
                CATEGORIES='["AI", "LLM", "Platform"]'
                LOGO="$(get_logo_base64 dify)"
                ;;
            qdrant)
                TITLE="QDrant Vector DB"
                DESC="QDrant Vector Database Stack"
                CATEGORIES='["AI", "Database"]'
                LOGO="$(get_logo_base64 qdrant)"
                ;;
            chromadb)
                TITLE="ChromaDB Vector DB"
                DESC="ChromaDB Vector Database Stack"
                CATEGORIES='["AI", "Database"]'
                LOGO="$(get_logo_base64 chromadb)"
                ;;
            *)
                continue
                ;;
        esac
        
        # Add stack template
        add_comma
        cat >> "$OUTPUT_FILE" << EOF
    {
      "type": 3,
      "title": "$TITLE",
      "description": "$DESC",
      "categories": $CATEGORIES,
      "platform": "linux",
      "logo": "$LOGO",
      "repository": {
        "url": "git://git-server/dockyard",
        "stackfile": "images/$category/$image_name/docker-compose.yml"
      }
    }
EOF
        
        echo -e "${GREEN}✓ Added stack: $TITLE${NC}"
    done
done

# Close JSON array and object
cat >> "$OUTPUT_FILE" << EOF
  ]
}
EOF

echo ""
echo -e "${GREEN}✅ Templates generated successfully!${NC}"
echo -e "${BLUE}Output: $OUTPUT_FILE${NC}"
echo ""
echo -e "${YELLOW}To apply changes:${NC}"
echo "  1. Restart Portainer: docker compose restart portainer"
echo "  2. Refresh Portainer UI in browser"
