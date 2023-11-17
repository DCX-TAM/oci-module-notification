# Notification Module OCI (H1)

O Oracle Cloud Infrastructure (OCI) Notifications é um serviço de publicação/assinatura (pub/sub) altamente disponível e de baixa latência que envia alertas e mensagens a Oracle Functions, Email, SMS e parceiros de entrega de mensagens, incluindo Slack, PagerDuty e ServiceNow. O serviço está integrado ao Oracle Identity and Access Management para acesso seguro e entrega cada mensagem, mesmo durante picos de tráfego.

## Como utilizar o módulo (H2)

No arquivo main.tf do terraform, realizar a declaração do módulo conforme mostrado abaixo

```hcl
module "notification" {
    source = "github.com/DCX-TAM/oci-module-notification"

    compartment_id = var.compartment_id
    notification_topics = var.notification_topics
    
}
```

Depois de declarar o módulo no main, é necessário criar a variable notification_topics, no arquivo variables.tf crie sua declaração:
```hcl
variable "notification_topics" {}
```
E para criar todos os notification topics desejado basta no arquivo terraform.tfvars, declarar os valores para as variáveis da seguinte maneira

```hcl
notification_topics = {
    topic01 = {
        name = "DCX-Tracking"
        tags = {
            environment = "production"
            department  = "finance"
        } 
    },
    #topic02 = {
    #    name = "DCX-Notification"
    #    tags = {
    #        environment = "production"
    #        department  = "tam"
    #    } 
    #},
}
```

Para criar mais de um tópico basta descomentar e continuar acrestando os blocos de variáveis em sequência

