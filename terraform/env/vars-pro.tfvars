### PROJECT SETTINGS ###
project          = "nuvolar-works-project"
region           = "europe-west1"
credentials-file = "credentials/gcp_pro_credentials.json"

### ENABLED APIS ###
apis = [
  "cloudresourcemanager.googleapis.com",
  "container.googleapis.com",
  "servicenetworking.googleapis.com"
]

### IAM ###
service-accounts = []
iam-members = []


### NETWORKS ###
networks = [
  {
    name                            = "vpc-nuvolar-works-project"
    routing-mode                    = "REGIONAL"
    auto-create-subnetworks         = false
    delete-default-routes-on-create = true
    mtu                             = 0
    subnetworks                     = [
      {
        name                = "subnet-nuvolar-works-project"
        region              = "europe-west1"
        ip-cidr-range       = "10.109.152.0/23"
        secondary-ip-ranges = []
        private-ip-google-access   = true
        private-ipv6-google-access = null
      }
    ]
    firewall-rules = []

    service-connection = []
  }
]

### ADDRESSES ###

addresses = [
]

global-addresses = [
  {
    name          = "api-gateway-ingress-ip-address"
    address-type  = "EXTERNAL"
    prefix-length = 16
    network       = "vpc-nuvolar-works-project"
  }
]


### GKE ###
gke = {
  name                        = "cluster-1"
  node-locations              = ["europe-west1-c", "europe-west1-b", "europe-west1-d"]
  initial-node-count          = 1
  node-version                = "1.27.3-gke.100"
  enable-intranode-visibility = false
  network                     = "vpc-nuvolar-works-project"
  subnetwork                  = "subnet-nuvolar-works-project"
  subnetwork-region           = "europe-west1"
  networking-mode             = "VPC_NATIVE"
  cluster-ipv4-cidr-block     = "10.88.0.0/14"
  services-ipv4-cidr-block    = "10.92.0.0/20"
  enable-autoscaling          = false
  database-encryption-state   = "DECRYPTED"
  enable-shielded-nodes       = false
  release-channel             = "REGULAR"
  node-pool                   = {
    name                          = "gke-node-pool-01"
    max-pods-per-node             = 110
    node-count                    = 1
    autoscaling-min-node-count    = null
    autoscaling-max-node-count    = null
    management-auto-repair        = true
    management-auto-upgrade       = true
    upgrade-max-surge             = 1
    upgrade-max-unavailable       = 0
    node-image-type               = "COS"
    node-disk-size-gb             = 100
    node-disk-type                = "pd-ssd"
    node-machine-type             = "e2-small"
    node-preemptible              = false
    node-disable-legacy-endpoints = true
  }
}


