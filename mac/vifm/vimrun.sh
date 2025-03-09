#!/bin/bash
NVIM_SERVER="/tmp/nvim.pipe"
nvim --server "$NVIM_SERVER" --remote "$@"
