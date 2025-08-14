
# Create AKS Cluster
    # Variables
    $RESOURCE_GROUP="rg-aks-demo"
    $CLUSTER_NAME="aks-nginx-demo"
    $LOCATION="eastasia"

    # Create Resource Group
    az group create --name $RESOURCE_GROUP --location $LOCATION

    # Create AKS Cluster with 1 node (quick and cheap)
    az aks create --resource-group rg-aks-demo --name aks-nginx-demo --node-count 1 --node-vm-size Standard_B2s --enable-addons monitoring --generate-ssh-keys --location eastasia

# Connect to AKS Cluster
az aks get-credentials --resource-group $RESOURCE_GROUP --name $CLUSTER_NAME
kubectl get nodes

# Create Nginx Deployment
File : nginx-deployment.yaml

    # Apply file:
    kubectl apply -f nginx-deployment.yaml
    kubectl get nodes

# Expose Deployment
kubectl expose deployment nginx-deployment --type=LoadBalancer --name=nginx-service --port=80 --target-port=80

    # Get the EXTERNAL-IP from the output and open it in your browser.
    kubectl get service nginx-service

# Enable Autoscaling
kubectl autoscale deployment nginx-deployment --cpu-percent=50 --min=1 --max=3
    
    kubectl get hpa



    