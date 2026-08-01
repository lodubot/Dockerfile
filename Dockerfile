# Use a reliable and active noVNC base image
FROM theasp/novnc:latest

# Expose the port on which NoVNC runs
EXPOSE 80

# Set environment variable for screen resolution
ENV RESOLUTION=1707x1067

# Install Firefox ESR and create necessary directory
RUN apt-get update && \
    apt-get install -y firefox-esr && \
    mkdir -p /etc/firefox && \
    rm -rf /var/lib/apt/lists/*

# Fix for Firefox crash/sandbox issues inside containers
RUN echo 'pref("browser.tabs.remote.autostart", false);' >> /etc/firefox/syspref.js
