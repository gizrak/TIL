## Kubernetes

- [WSL2에서 minikube로 k8s 사용](https://mini.jellypo.pe.kr/wp/?p=11205)
- [Istio는 무엇이고 왜 중요할까?](https://www.linkedin.com/pulse/istio%EB%8A%94-%EB%AC%B4%EC%97%87%EC%9D%B4%EA%B3%A0-%EC%99%9C-%EC%A4%91%EC%9A%94%ED%95%A0%EA%B9%8C-sean-lee/?originalSubdomain=kr)
- [Istio & envoy 파헤치기](https://phantasmicmeans.tistory.com/entry/Istio-%ED%8C%8C%ED%97%A4%EC%B9%98%EA%B8%B0)
- [K8S Volume - PV/PVC](https://kimjingo.tistory.com/153)

### 유용한 명령어

```bash
# 현재 context 확인
kubectl config current-context

# context list 확인
kubectl config get-contexts

# context 선택
kubectl config use-context <context_name>

# user unset
kubectl config unset users.kubernetes-admin

# context unset
kubectl config unset contexts.kubernetes-admin@kubernetes

# cluster unset
kubectl config unset clusters.kubernetes
```
