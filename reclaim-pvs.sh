#!/bin/bash
# Currently there's a bug in crc 4.11 where PVs aren't being reclaimed:
# Recycle failed: unexpected error creating recycler pod:
#      pods "recycler-for-pv0006" is forbidden: violates PodSecurity
#      "baseline:latest": hostPath volumes (volume "vol")
#
# https://github.com/code-ready/crc/issues/3336

# Workaround:
# oc label  --overwrite ns openshift-infra  pod-security.kubernetes.io/enforce=privileged

# Remove claim references from failed PVs
oc get pv | grep Failed | awk '{print $1}' | xargs -l oc patch -p '{"spec":{"claimRef": null}}' pv
sleep 1

# SSH into the CRC core os node and remove data from all "Available" PVs
oc get pv | grep Available | awk '{print $1"/"}' | xargs -I% ssh -i ~/.crc/machines/crc/id_ecdsa core@$(crc ip) sudo rm -vfr /mnt/pv-data/%* 
oc get pv | grep Available | awk '{print $1}' | xargs -I% ssh -i ~/.crc/machines/crc/id_ecdsa core@$(crc ip) sudo chmod 774 /mnt/pv-data/%
