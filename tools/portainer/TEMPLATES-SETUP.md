# Configuración Manual de Plantillas en Portainer

Portainer CE no soporta la variable `PORTAINER_TEMPLATES` para plantillas personalizadas. Las plantillas personalizadas deben configurarse desde la interfaz web.

## 📋 Pasos para Configurar Plantillas Personalizadas

### Opción 1: Configurar URL de Plantillas (Recomendado)

1. **Accede a Portainer**: http://localhost:9000
2. **Ve a Settings**:
   - Click en tu usuario (esquina superior derecha)
   - Selecciona **Settings**
3. **Configura App Templates**:
   - Busca la sección **"App Templates"**
   - En el campo **"URL"**, ingresa:
     ```
     http://templates-server/templates.json
     ```
   - Click en **"Save settings"**
4. **Refresca la página**
5. **Ve a App Templates** en el menú lateral

### Opción 2: Usar Custom Templates (Alternativa)

Si la Opción 1 no funciona, puedes usar Custom Templates:

1. **Ve a Custom Templates**:
   - En el menú lateral, busca **"Custom Templates"**
2. **Crea plantillas manualmente**:
   - Click en **"Add Custom Template"**
   - Copia el contenido de cada plantilla desde `templates/templates.json`

## 🔗 URL del Servidor de Plantillas

El servidor nginx está sirviendo las plantillas en:
- **Interno (desde Portainer)**: `http://templates-server/templates.json`
- **Externo (desde tu navegador)**: No accesible directamente

## 🐛 Troubleshooting

**Si las plantillas no aparecen:**

1. Verifica que el servidor de plantillas esté corriendo:
   ```bash
   docker ps | grep portainer-templates
   ```

2. Verifica que Portainer pueda acceder al servidor:
   ```bash
   docker exec portainer sh -c "wget -qO- http://templates-server/templates.json | head -20"
   ```

3. Revisa los logs de Portainer:
   ```bash
   docker compose logs portainer
   ```

## 📝 Nota Importante

**Portainer CE vs Business Edition:**
- **CE (Community)**: No soporta `--templates` flag ni `PORTAINER_TEMPLATES` env var
- **Business**: Soporta configuración automática de plantillas

Para usar plantillas automáticamente, necesitarías Portainer Business Edition, o configurarlas manualmente desde la UI como se describe arriba.

## 🎯 Plantillas Disponibles

Las siguientes plantillas están disponibles en `templates/templates.json`:

**Containers:**
- Langflow
- Flowise  
- n8n
- Code Server

**Stacks:**
- Langflow + PostgreSQL
- Flowise + PostgreSQL
- n8n + PostgreSQL
