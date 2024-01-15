#!/bin/bash
systemctl --user restart pipewire pipewire-pulse
systemctl --user daemon-reload

