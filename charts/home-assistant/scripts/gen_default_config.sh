#!/usr/bin/env bash

set -e

podman run --rm -it ghcr.io/home-assistant/home-assistant:stable python3 -c "
import json, os, homeassistant.components.default_config as dc
m_path = os.path.join(os.path.dirname(dc.__file__), 'manifest.json')
deps = json.load(open(m_path))['dependencies']
for x in sorted(deps):
    if x not in {'calendar', 'todo'}: print(f'- {x}')
"
