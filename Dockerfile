# Use the base image
FROM fredblgr/ubuntu-novnc:20.04

# Expose the port on which NoVNC runs (80 inside the container)
EXPOSE 80

# Set the environment variable for screen resolution
ENV RESOLUTION 1707x1067

# Install Firefox ESR and clean up to keep image lightweight
RUN apt-get update && \
    apt-get install -y firefox-esr && \
    rm -rf /var/lib/apt/lists/*

# Fix for Firefox crash/sandbox issues inside containers without custom --shm-size
RUN echo 'pref("browser.tabs.remote.autostart", false);' >> /etc/firefox/syspref.js

# Start the command to run NoVNC
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
