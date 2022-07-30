# action-sourceknight

[![Actions Status](https://github.com/maxime1907/action-sourceknight/workflows/Release/badge.svg)](https://github.com/maxime1907/action-sourceknight/actions)

Build sourcemod plugins with sourceknight

## Usage

```yaml
name: Build sourcemod plugin
on:
  push:
    tags:
      - 'v*.*.*'
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v3
    - name: Build sourcemod plugin
      uses: maxime1907/action-sourceknight@v1
      with:
        cmd: build
```
