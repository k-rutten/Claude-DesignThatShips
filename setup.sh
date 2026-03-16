#!/bin/bash
set -e

echo "=== Design That Ships — MCP Setup ==="
echo ""

# Check if claude CLI exists
if ! command -v claude &> /dev/null; then
    echo "❌ 'claude' CLI not found. Install Claude Code first:"
    echo "   https://docs.claude.com/en/docs/claude-code"
    exit 1
fi

echo "Installing MCP servers..."
echo ""

# ui-ux-pro-mcp — design research (free, no key)
echo "→ ui-ux-pro-mcp (design research, 1920+ docs)"
claude mcp add ui-ux-pro-mcp --scope user -- npx ui-ux-pro-mcp
echo "  ✅ Installed"
echo ""

# ux-mcp-server — pattern generation + accessibility (free, no key)
echo "→ ux-mcp-server (pattern generation + accessibility)"
claude mcp add ux-mcp-server --scope user -- npx @elsahafy/ux-mcp-server
echo "  ✅ Installed"
echo ""

# magic-mcp — component generation (requires API key)
echo "→ magic-mcp / 21st.dev (component generation)"
echo "  ⚠️  Requires API key from https://21st.dev/magic/console"
read -p "  Enter your 21st.dev API key (or press Enter to skip): " MAGIC_KEY
if [ -n "$MAGIC_KEY" ]; then
    claude mcp add magic --scope user --env API_KEY="$MAGIC_KEY" -- npx -y @21st-dev/magic@latest
    echo "  ✅ Installed with API key"
else
    echo "  ⏭️  Skipped — you can add it later with:"
    echo "     claude mcp add magic --scope user --env API_KEY='your-key' -- npx -y @21st-dev/magic@latest"
fi
echo ""

echo "=== Setup Complete ==="
echo ""
echo "Optional extras (install manually if needed):"
echo "  • Figma MCP — for extracting design tokens from Figma"
echo "  • Microsoft Graph MCP — for SharePoint access to Blis docs"
echo ""
echo "Open this repo in Claude Code and it will auto-read CLAUDE.md."
echo "Start prototyping: 'Ik wil een feature bouwen voor [klant]'"
