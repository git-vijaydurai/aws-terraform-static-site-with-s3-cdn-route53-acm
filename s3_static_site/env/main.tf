module "s3_demo" {
  source  = "../modules/s3"
  cdn_arn = module.cdn_demo.output_cdn_arn

}

module "cdn_demo" {
  source                           = "../modules/cdn"
  mys3_bucket_regional_domain_name = module.s3_demo.mys3_bucket_regional_domain_name
  mys3_bucket_domain_name          = module.s3_demo.mys3_bucket_domain_name
  acm_certificate_arn              = module.acm_demo.acm_arn

}

module "acm_demo" {
  source = "../modules/acm"



}

module "route53_demo" {

  source                        = "../modules/route53"
  acm_arn                       = module.acm_demo.acm_arn
  acm_domain_validation_options = module.acm_demo.acm_domain_validation_options
  cdn_dis_domain_name           = module.cdn_demo.out_cdn_dis_name

}