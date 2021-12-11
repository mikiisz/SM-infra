### Certificate Creation

Generate certs for client.

```shell
$ cd client
$ ssh-keygen -f ./ssh_cert

Generating public/private rsa key pair.
Enter passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved in ./ssh_cert.
Your public key has been saved in ./ssh_cert.pub.
The key fingerprint is:
SHA256: -
The key's randomart image is:
+---[RSA 3072]----+
|                 |
+----[SHA256]-----+
```

### Connect via ssh tunnel to private cloud

```shell
$ ssh -i ssh_cert login@adress
```

You may find `login@adress` in terragrunt output of `terragrunt apply`

```terraform
Apply complete! Resources : 0 added, 0 changed, 0 destroyed.

Outputs :

public_login = "ec2-user@101.102.103.104"
```