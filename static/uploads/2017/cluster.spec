metadata:
  creationTimestamp: 2017-05-22T15:58:26Z
  name: kubernetes.r7v.de
spec:
  api:
    dns: {}
  authorization:
    alwaysAllow: {}
  channel: stable
  cloudProvider: aws
  clusterDNSDomain: cluster.local
  configBase: s3://rsokolkov/kubernetes.r7v.de
  configStore: s3://rsokolkov/kubernetes.r7v.de
  dnsZone: ZN8CFE2EK5U2U
  docker:
    bridge: ""
    ipMasq: false
    ipTables: false
    logDriver: json-file
    logLevel: warn
    logOpt:
    - max-size=10m
    - max-file=5
    storage: overlay,aufs
    version: 1.12.6
  etcdClusters:
  - etcdMembers:
    - instanceGroup: master-us-east-1a
      name: a
    name: main
  - etcdMembers:
    - instanceGroup: master-us-east-1a
      name: a
    name: events
  keyStore: s3://rsokolkov/kubernetes.r7v.de/pki
  kubeAPIServer:
    address: 127.0.0.1
    admissionControl:
    - NamespaceLifecycle
    - LimitRanger
    - ServiceAccount
    - PersistentVolumeLabel
    - DefaultStorageClass
    - DefaultTolerationSeconds
    - ResourceQuota
    allowPrivileged: true
    anonymousAuth: false
    apiServerCount: 1
    authorizationMode: AlwaysAllow
    cloudProvider: aws
    etcdServers:
    - http://127.0.0.1:4001
    etcdServersOverrides:
    - /events#http://127.0.0.1:4002
    image: gcr.io/google_containers/kube-apiserver:v1.6.2
    insecurePort: 8080
    kubeletPreferredAddressTypes:
    - InternalIP
    - Hostname
    - ExternalIP
    - LegacyHostIP
    logLevel: 2
    securePort: 443
    serviceClusterIPRange: 100.64.0.0/13
    storageBackend: etcd2
  kubeControllerManager:
    allocateNodeCIDRs: true
    attachDetachReconcileSyncPeriod: 1m0s
    cloudProvider: aws
    clusterCIDR: 100.96.0.0/11
    clusterName: kubernetes.r7v.de
    configureCloudRoutes: true
    image: gcr.io/google_containers/kube-controller-manager:v1.6.2
    leaderElection:
      leaderElect: true
    logLevel: 2
    useServiceAccountCredentials: true
  kubeDNS:
    domain: cluster.local
    image: gcr.io/google_containers/kubedns-amd64:1.3
    replicas: 2
    serverIP: 100.64.0.10
  kubeProxy:
    clusterCIDR: 100.96.0.0/11
    cpuRequest: 100m
    image: gcr.io/google_containers/kube-proxy:v1.6.2
    logLevel: 2
  kubeScheduler:
    image: gcr.io/google_containers/kube-scheduler:v1.6.2
    leaderElection:
      leaderElect: true
    logLevel: 2
  kubelet:
    allowPrivileged: true
    babysitDaemons: true
    cgroupRoot: /
    cloudProvider: aws
    clusterDNS: 100.64.0.10
    clusterDomain: cluster.local
    enableDebuggingHandlers: true
    evictionHard: memory.available<100Mi,nodefs.available<10%,nodefs.inodesFree<5%,imagefs.available<10%,imagefs.inodesFree<5%
    hostnameOverride: '@aws'
    kubeconfigPath: /var/lib/kubelet/kubeconfig
    logLevel: 2
    networkPluginMTU: 9001
    networkPluginName: kubenet
    nonMasqueradeCIDR: 100.64.0.0/10
    podManifestPath: /etc/kubernetes/manifests
    requireKubeconfig: true
  kubernetesApiAccess:
  - 0.0.0.0/0
  kubernetesVersion: 1.6.2
  masterInternalName: api.internal.kubernetes.r7v.de
  masterKubelet:
    allowPrivileged: true
    babysitDaemons: true
    cgroupRoot: /
    cloudProvider: aws
    clusterDNS: 100.64.0.10
    clusterDomain: cluster.local
    enableDebuggingHandlers: true
    evictionHard: memory.available<100Mi,nodefs.available<10%,nodefs.inodesFree<5%,imagefs.available<10%,imagefs.inodesFree<5%
    hostnameOverride: '@aws'
    kubeconfigPath: /var/lib/kubelet/kubeconfig
    logLevel: 2
    networkPluginMTU: 9001
    networkPluginName: kubenet
    nonMasqueradeCIDR: 100.64.0.0/10
    podManifestPath: /etc/kubernetes/manifests
    registerSchedulable: false
    requireKubeconfig: true
  masterPublicName: api.kubernetes.r7v.de
  networkCIDR: 172.20.0.0/16
  networking:
    kubenet: {}
  nonMasqueradeCIDR: 100.64.0.0/10
  secretStore: s3://rsokolkov/kubernetes.r7v.de/secrets
  serviceClusterIPRange: 100.64.0.0/13
  sshAccess:
  - 0.0.0.0/0
  subnets:
  - cidr: 172.20.32.0/19
    name: us-east-1a
    type: Public
    zone: us-east-1a
  topology:
    dns:
      type: Public
    masters: public
    nodes: public
