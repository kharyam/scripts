oc get csr --kubeconfig=kubeconfig-noingress  | grep Pending | awk '{print $1}' | xargs --no-run-if-empty oc adm certificate approve --kubeconfig=kubeconfig-noingress
