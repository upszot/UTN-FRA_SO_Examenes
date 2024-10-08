#!/bin/bash
SCRIPT_DIR=$(dirname "$(readlink -f "$0")")


bash $SCRIPT_DIR/check_A.sh
bash $SCRIPT_DIR/check_B.sh
bash $SCRIPT_DIR/check_C.sh
bash $SCRIPT_DIR/check_D.sh
bash $SCRIPT_DIR/check_E.sh
bash $SCRIPT_DIR/check_F.sh
