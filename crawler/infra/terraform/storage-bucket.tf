module "storage-bucket" {
  source   = "SweetOps/storage-bucket/google"
  name     = "crawler-app-storage"
  location = var.region
}

output storage-bucket_url {
  value = module.storage-bucket.url
}
