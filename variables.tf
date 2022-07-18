variable "tags" {
  type        = map(string)
  description = "Resource tags"

  default = {
    created-by = "ourchitecture-tutorials"
    managed-by = "terraform"
  }
} 

variable "resource_group_name" {
  type        = string
  description = "terraform_orchestration"
}

variable "app_service_plan_name" {
  type        = string
  description = "terraform_orchestration-2021"
}

variable "app_service_name" {
  type        = string
  description = "terraformappservice"
}

variable "client_affinity_enabled" {
  type        = bool
  description = "O Serviço de Aplicativo envia cookies de afinidade de sessão, que roteiam solicitações de cliente na mesma sessão para a mesma instância? Padrões para verdadeiro"
  default     = true
}

variable "https_only" {
  type        = bool
  description = "O Serviço de Aplicativo só pode ser acessado via HTTPS? Padrões para verdadeiro"
  default     = true
}

variable "http2_enabled" {
  type        = bool
  description = "O HTTP2 está habilitado neste serviço de aplicativo? Padrões para verdadeiro"
  default     = true
}

variable "linux_fx_version" {
  type        = string
  description = "Linux App Framework e versão para o AppService. Padrões para node|16-lts"
  default     = "node|16-lts"
}

variable "use_32_bit_worker_process" {
  type        = bool
  description = "O Serviço de Aplicativo é executado no modo de 32 bits, em vez do modo de 64 bits? Isso deve ser verdade para os planos Gratuito e Compartilhado. Padrões para verdadeiro"
  default     = true
}

variable "website_run_from_package" {
  type        = bool
  description = "A Azure deve executar o aplicativo de um arquivo zip? Essa configuração deve ser definida em conjunto com a configuração scm_do_build_during_deployment. Padrões para verdadeiro"
  default     = true
}

variable "scm_do_build_during_deployment" {
  type        = bool
  description = "A Azure deve compilar o aplicativo durante a implantação? Essa configuração deve ser definida em conjunto com a configuração website_run_from_package. Padrões para falso"
  default     = false
}

variable "website_httplogging_retention_days" {
  type        = number
  description = "Por quantos dias reter logs. Padrões para 3"
  default     = 3
}

variable "disable_hugo_build" {
  type        = bool
  description = "Defina como true para desabilitar as compilações do Hugo; caso contrário, falso. Quando a configuração scm_do_build_during_deployment for verdadeira, essa configuração pode levar a erros devido a um bug conhecido com o processo de compilação do Oryx (https://github.com/microsoft/Oryx/issues/755). Padrões para verdadeiro"
  default     = true
}