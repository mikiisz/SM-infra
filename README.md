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

### Usage

1. update `*_cloud/terragrunt.hcl` configs under `locals`
2. cd into `*_cloud`
3. run: `terragrunt init`/`terragrunt plan`/`terragrunt apply`
4. teardown: `terragrunt destroy`