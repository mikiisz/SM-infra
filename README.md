### Requirements

```shell
$ terragrunt --version

terragrunt version v0.35.4
```

```shell
$ terraform --version

Terraform v1.1.0
on darwin_amd64
```

```shell
$ which ssh-keygen 

/usr/bin/ssh-keygen
```

```shell
$ npm --version

8.1.0
```

### Usage

1. Update `./*/terragrunt.hcl` config files under `locals`.

```terraform
locals {
  # update aws bucket name and aws region according to your aws source
  bucket     = "your-bucket-name"
  aws_region = "your-region"
}
```

2. Generate certificates for client, check `./client/README.md`.

3. Init, plan and apply terragrunt for each package in following order: `private_cloud`, `public_cloud`, `client`.

```shell
$ cd private_cloud
$ terragrunt init
$ terragrunt plan
$ terragrunt apply
```

4. Update credentials under `./mobile_app/config.json` and start mobile app.

```shell
$ cd mobile_app
$ npm install
$ expo start
```

5. Teardown services: `terragrunt destroy`.

```shell
$ cd private_cloud
$ terragrunt destroy
```