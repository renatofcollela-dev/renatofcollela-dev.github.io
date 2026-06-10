#!/usr/bin/env bash
# KRONOS - Onda 1 - instala Claude Code no Hetzner (rode como root)
set -e
echo "== KRONOS: instalando Node + Claude Code =="
if ! command -v node >/dev/null 2>&1 || [ "$(node -v 2>/dev/null | sed 's/v//;s/\..*//')" -lt 20 ]; then
  curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
  apt-get install -y nodejs
fi
echo "Node: $(node -v)  npm: $(npm -v)"
npm install -g @anthropic-ai/claude-code
unset ANTHROPIC_API_KEY
mkdir -p /opt/kronos && cd /opt/kronos
echo "Claude Code: $(claude --version 2>/dev/null || echo instalado)"
echo ""
echo "== PRONTO. Agora faca (no mesmo terminal): =="
echo "1) claude login        # abre uma URL: abra no celular e autorize (sua conta Max)"
echo "2) claude remote-control   # mostra QR/sessao; conecte pelo app Claude (aba Code)"
echo "Depois disso, voce comanda este servidor pelo celular, 24/7."