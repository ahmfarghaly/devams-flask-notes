echo "Create Cluster"
eksctl create cluster ^
    --name DevamsK8sCluster ^
    --region us-west-2 ^
    --nodegroup-name standard-workers ^
    --node-type t3.micro ^
    --node-ami auto ^
    --nodes 2 ^
    --nodes-min 1 ^
    --nodes-max 4

echo "Create a kubectl configuration file"
aws eks --region us-west-2 update-kubeconfig --name DevamsK8sCluster                     