# k0s-ansible

A modular automation toolkit for deploying and managing [k0s](https://k0sproject.io/) Kubernetes clusters using Ansible, Terraform (HCL), Jinja, Nix, and shell scripting.

---

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [License](#license)

---

## Overview

**k0s-ansible** is designed to make deploying and managing [k0s](https://k0sproject.io/) Kubernetes clusters reproducible and customizable. It leverages:

- **Ansible** for orchestration
- **Terraform (HCL)** for infrastructure provisioning
- **Jinja** for configuration templating
- **Nix** for environment reproducibility
- **Shell scripts** for automation steps

---

## Features

- Automated provisioning and configuration of k0s clusters
- Infrastructure-as-Code with Terraform (HCL)
- Dynamic configuration templating via Jinja2
- Environment reproducibility using Nix
- Shell scripts for orchestration and utilities
- Modular roles and reusable components
- Support for multiple infrastructure providers (e.g., Proxmox, Cloudflare)

---

## Repository Structure

The project is organized as follows (see ![image1](image1)):

```
ansible/
  roles/
    k0s/
      controller/
      initial_controller/
      worker/
    prereq/
  facts.yml
  management-cluster.yml
  site.yml
clusters/
terraform/
  hub/
    .terraform/
    bootstrap/
    cluster.tf
    deploy.sh
    ...
  modules/
    cloudflare/
    cluster/
      templates/
      outputs.tf
      proxmox-nodes.tf
      talos.tf
      variables.tf
      versions.tf
.gitignore
flake.lock
flake.nix
secrets.env
```

- **ansible/** – Ansible roles and playbooks for k0s and prerequisites
- **clusters/** – (Reserved for cluster definitions or inventory)
- **terraform/** – Infrastructure modules and environments (e.g., hub, cloudflare, proxmox)
- **flake.nix/flake.lock** – Nix environment setup and reproducibility
- **secrets.env** – Environment-specific secrets (not tracked)

---

## Requirements

- [Ansible](https://docs.ansible.com/)
- [Terraform](https://www.terraform.io/)
- [Nix](https://nixos.org/) (optional, for reproducible environments)
- [k0sctl](https://github.com/k0sproject/k0sctl) (optional)
- Bash or compatible shell

---

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/JamesAtIntegratnIO/k0s-ansible.git
   cd k0s-ansible
   ```

2. **(Optional) Enter a Nix shell for reproducible tooling:**
   ```bash
   nix-shell
   ```

3. **Install dependencies:**
   - Ansible: `pip install ansible`
   - Terraform: [Install instructions](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
   - k0sctl: `curl -sSLf https://get.k0s.sh | sudo sh`

---

## Usage

### 1. Infrastructure Provisioning

- **Configure Terraform variables** in `terraform/hub/terraform.tfvars` or other relevant environment.
- **Apply Terraform:**
   ```bash
   cd terraform/hub
   terraform init
   terraform apply
   ```

### 2. Cluster Bootstrapping

- **Edit Ansible inventory and variables** as needed in the `ansible/` directory.
- **Run the playbooks:**
   ```bash
   cd ansible
   ansible-playbook -i your_inventory site.yml
   ```

### 3. Utility Scripts

- Run helper scripts (e.g., `deploy.sh`) as needed for cluster operations:
   ```bash
   cd terraform/hub
   ./deploy.sh
   ```

---

## Configuration

- **Terraform:** Set variables in `terraform/hub/terraform.tfvars` or environment-specific files.
- **Ansible:** Tweak roles, variables, and templates in `ansible/roles/` and `ansible/*.yml`.
- **Nix:** Adjust `flake.nix` for tooling reproducibility.
- **Secrets:** Place secret environment variables in `secrets.env` (not tracked by git).

---

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Open a Pull Request

Issues, suggestions, and contributions are always welcome!

---

## License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.