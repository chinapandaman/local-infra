argocd-scaffold:
	kubectl get namespace argocd || kubectl create namespace argocd
	kubectl apply -n argocd --server-side --force-conflicts -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

argocd-password:
	kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo

argocd:
	minikube service argocd-server -n argocd --url

sonarqube-scaffold:
	kubectl apply -f apps/sonarqube.yaml

sonarqube:
	minikube service sonarqube-sonarqube -n sonarqube --url
