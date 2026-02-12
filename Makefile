scaffold:
	kubectl get namespace argocd || kubectl create namespace argocd
	kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
	kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'

argocd-password:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

argocd:
	minikube service argocd-server -n argocd
