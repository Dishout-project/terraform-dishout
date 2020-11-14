#!/bin/bash

# Create dishout user
useradd -m -d /home/dishout dishout && usermod --shell /bin/bash dishout
