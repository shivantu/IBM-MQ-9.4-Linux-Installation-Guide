#!/bin/bash
# IBM MQ 9.4 Installation Script

set -e

echo "Starting IBM MQ 9.4 installation..."

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# Extract package
echo "Extracting installation package..."
gunzip IBM_MQ_9.4_LINUX_X86-64.tar.gz
tar -xvf IBM_MQ_9.4_LINUX_X86-64.tar

cd MQServer

# Accept license
echo "Accepting license..."
./mqlicense.sh -text_only

# Install packages
echo "Installing RPM packages..."
rpm -ivh MQSeriesRuntime-*.rpm MQSeriesServer-*.rpm MQSeriesGSKit-*.rpm

# Set as primary installation
echo "Setting primary installation..."
/opt/mqm/bin/setmqinst -i -p /opt/mqm

# Verify installation
echo "Verifying installation..."
dspmqver

echo "IBM MQ 9.4 installation completed successfully!"
