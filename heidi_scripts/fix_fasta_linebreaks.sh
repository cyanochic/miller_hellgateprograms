#!/bin/bash

INFILE=allSBs_prokka.ffn

awk '/^>/ { print (NR==1 ? "" : RS) $0; next } { printf "%s", $0 } END { printf RS }' $INFILE >> allSB_prokka.ffn