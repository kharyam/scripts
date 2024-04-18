oc get csr  --kubeconfig=kubeconfig-noingress  | grep Pending | awk '{print }' | xargs oc adm certificate approve --kubeconfig=kubeconfig-noingress
