#oc get csr --kubeconfig=${HOME}/kubeconfig-noingress  | grep Pending | awk '{print $1}' | xargs --no-run-if-empty oc adm certificate approve --kubeconfig=${HOME}/kubeconfig-noingress
oc get csr | grep Pending | awk '{print $1}' | xargs --no-run-if-empty oc adm certificate approve
