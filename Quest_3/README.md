# **Terraform Scaffolding**

> A minimal recommended module following the standard structure is shown below. While the root module is the only required element, we recommend the structure below as the minimum:

```sh
$ tree minimal-module/
.
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
```

A complete example of a module following the standard structure is shown below.
This example includes all optional elements and is therefore the most
complex a module can become:

```sh
$ tree complete-module/
.
├── README.md
├── main.tf
├── variables.tf
├── outputs.tf
├── ...
├── modules/
│   ├── nestedA/
│   │   ├── README.md
│   │   ├── variables.tf
│   │   ├── main.tf
│   │   ├── outputs.tf
│   ├── nestedB/
│   ├── .../
├── examples/
│   ├── exampleA/
│   │   ├── main.tf
│   ├── exampleB/
│   ├── .../
```

> It is important to define a structure based on environments, example dev, pre, pro, the best thing is to be able to separate by projects and that each project has the necessary terraform modules.

> For example, if you're using terraform in development, pre, and pro environments, have separate directories for each.

```sh
nemergomez@host1:~$ tree terraform_scaffolding/
terraform_project/
├── dev
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
├── modules
│ ├── eks
│ │ ├── eks.tf
│ │ └── main.tf
│ └── vpc
│ ├── main.tf
│ └── vpc.tf
├── prod
│ ├── main.tf
│ ├── outputs.tf
│ └── variables.tf
└── pre
├── main.tf
├── outputs.tf
└── variables.tf
```


> It is strongly recommended to use the official Terraform modules available. There is no need to reinvent a module that already exists. Save a lot of time and pain. Terraform Registry has many modules available. Make changes to existing modules as needed.

> it is important to always use the latest available versions of terraform as much as possible as well as those of the hashicorp cloud provider.

> Integrate Terraform with Vault or another secret management tool. Secrets like service provider credentials must stay secret, but they also must be easy to use when needed. The best way to address those needs is to use a dedicated secret management tool. We believe HashiCorp’s Vault is the best choice for most people, but Terraform can integrate with other secret management tools as well.

> The Use Terrates for testing the developed modules is the best option for test module.