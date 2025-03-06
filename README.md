# terraform-exercise
A hands-on exercise demonstrating advanced Terraform local variable processing to dynamically discover, parse, and merge YAML configuration files across multiple tenants and environments. 

## Objective
Design a Terraform configuration that processes YAML configuration files from a specified directory structure, with the following requirements:

## Problem Description
You are tasked with creating a Terraform configuration that:

- Scans a directory of tenant configurations
- Dynamically reads YAML files
- Filters configurations based on an environment variable
- Processes and transforms the configuration data

## Directory Structure
```
tenants/
├── tenantA/
│   ├── dev/
│   │   └── configuration.yaml
│   └── prod/
│       └── configuration.yaml
├── tenantB/
│   ├── dev/
│   │   └── configuration.yaml
│   ├── test/
│   │   └── configuration.yaml
│   └── prod/
│       └── configuration.yaml
