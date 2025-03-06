locals {
  # Define the base path for configurations
  config_repo_path = "${path.module}/tenants"

  tenant_config_paths = {
    for path in fileset("${local.config_repo_path}", "**/configuration.yaml") :
    path => {
      # TODO: Extract and return the tenant name from the path
      tenant = ""
      # TODO: Extract and return the environment (e.g., dev, prod) from the path
      environment = ""
      full_path = "${local.config_repo_path}/${path}"
    }
  }

  tenant_yaml_configs = {
    for path, metadata in local.tenant_config_paths :
    path => "..." # TODO: Decode YAML file & return empty object if the file is missing or invalid
  }

  # Filter configurations based on the specified environment variable
  # TODO: Implement logic to filter configurations based on `var.lz_environment`
  # Only include configurations that match the selected environment
  filtered_tenant_config_paths = {}

  processed_configs = [
    for path, metadata in local.filtered_tenant_config_paths :
    {
      # TODO: Return the tenant name
      tenant = ""
      # TODO: Return the environment name
      environment = ""
      # TODO: Extract and process YAML data if available, otherwise return an empty object  
      data = try()
      full_path = metadata.full_path
    }
  ]

  flattened_processed_data = flatten([
    # TODO: 
        # - Create a list comprehension over local.processed_configs
        # - For each config, generate a new map with:
        #   a) Merge the original config.data
        #   b) Add a 'name' field: as expected output tenant-environment
        #   c) Add a 'hostname' field: Retrieve hostname if available, otherwise use a default value
        # - Example expected output structure:
        #   {
        #     name = "tenanta-dev"
        #     hostname = "dev.tenanta.com"
        #     ... (other original data)
        #   }
  ])
}
