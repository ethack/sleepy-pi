#!/bin/bash

# https://askubuntu.com/questions/789465/generate-white-noise-to-calm-a-baby

# "waves" example
# play -n synth brownnoise synth pinknoise mix synth sine amod 0.3 10

# 1 hour timer example
# play -n synth 1:0:0 brownnoise synth pinknoise mix

play -n synth brownnoise synth pinknoise mix
