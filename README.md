# IBM MQ 9.4 Linux Installation

This repository provides the installation guide for IBM MQ 9.4 on Linux systems.

## 📋 Prerequisites

### ✅ Pre-installation Requirements

- Ensure the host meets hardware/software prerequisites: supported OS, adequate CPU/RAM/disk
- Ensure the host name has no spaces
- Download the installation package from IBM Passport Advantage or the IBM download site
- Log in as root (or use sudo) on the target machine

### 🚀 Installation
---
## ✅ Installation Steps

## 1. Extract Installation Package

gunzip MQServer.tar.gz
tar -xvf MQServer.tar

## Navigate to Installation Directory

cd MQServer

## Accept License

./mqlicense.sh

## OR Text-only mode

./mqlicense.sh -text_only

## Import IBM MQ Public Signing Key (Optional but Recommended)

rpm --import ibm_mq_public.pgp

rpm -Kv MQSeriesRuntime-9.4*.rpm

## Install RPM Packages

## Standard installation

rpm -ivh MQSeriesRuntime-*.rpm MQSeriesServer-*.rpm MQSeriesGSKit-*.rpm MQSeries*.rpm

## Custom installation path

rpm --prefix /opt/customLocation -ivh MQSeriesRuntime-*.rpm MQSeriesServer-*.rpm MQSeriesGSKit-*.rpm MQSeries*.rpm

## Set Primary Installation

/opt/mqm/bin/setmqinst -i -p /opt/mqm

## For custom installation path

/opt/customLocation/bin/setmqinst -i -p /opt/customLocation


## ✅ Post-installation & Verification

User and Group Setup
Create user group mqm and add your admin user if not done automatically
Ensure administration privileges are configured

## Environment Setup

## Set MQ environment

. /opt/mqm/bin/setmqenv -m QMGR_NAME

## Verification

dspmqver
