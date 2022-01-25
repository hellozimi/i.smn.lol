# i.smn.lol

Self hosted video recording solution.

I'm using [Kap](https://github.com/wulkano/Kap) video screen recordings and wanted an easy way to share the videos with my own domain.

There's a s3 plugin ([SamVerschueren/kap-s3](https://github.com/SamVerschueren/kap-s3#readme)) to Kap which lets you upload your video straight to a bucket on aws, this projects uses terraform to setup the bucket, policies and creates a separate iam user to use within the Kap s3 plugin. The iam user created for Kap will only have rights to write to this specific bucket on s3. Terraform will output the `aws_access_key_id` and `region` to use for Kap, to get the `secret_access_key` you'll need to enter the terraform console.

# Setup

Vercel is used to have easy access to ssl certificate for my domain `i.smn.lol`. This `vercel.json` config file just adds an url rewrite to all incoming requests to my s3 bucket static website url. I use [Hover](https://hover.com) as my dns provider. I have set up a c-name to my vercel project, read more here: [Vercel.com: Custom Domains](https://vercel.com/docs/concepts/projects/custom-domains)

### Vercel

```sh
$ vercel
$ vercel --prod
```

### Terraform

```sh
$ cd terraform
$ terraform init
$ terraform plan -out plan.out
$ terraform apply plan.out
aws_access_key_id = "<access key id>"
region = "eu-west-1"

# To get the secret access key to use in Kap
$ terraform console
> nonsensitive(aws_iam_access_key.kap_user.secret)
"<secret access key>"
```
