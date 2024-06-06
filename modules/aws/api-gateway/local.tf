# Extrair a zona DNS do domain_name
locals {
  # Regex para capturar "drcash." e qualquer coisa que vier depois
  domain_zone_match = regex("^(.*\\.)?(drcash\\..*)$", var.domain_name)
  domain_zone       = length(local.domain_zone_match) > 1 ? local.domain_zone_match[1] : "drcash.local"

  # Determinar se a zona é privada
  # can retorna true se o domain terminar com ".local"
  is_private_zone = can(regex(".*\\.local$", local.domain_zone))
}
