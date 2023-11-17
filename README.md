![dcx image](https://grtalm7kfakz.objectstorage.sa-saopaulo-1.oci.customer-oci.com/p/rz1PrUSjAzDArWNXmXXKpKp8DnqtRql8NbISuaJtMo0rDk3dsA4FKX_xKX5msBlO/n/grtalm7kfakz/b/gustavodo2011/o/dcxdatacentrics.jpg)

# Notification Module OCI (H1)

O Oracle Cloud Infrastructure (OCI) Notifications é um serviço de publicação/assinatura (pub/sub) altamente disponível e de baixa latência que envia alertas e mensagens a Oracle Functions, Email, SMS e parceiros de entrega de mensagens, incluindo Slack, PagerDuty e ServiceNow. O serviço está integrado ao Oracle Identity and Access Management para acesso seguro e entrega cada mensagem, mesmo durante picos de tráfego.

## Como utilizar o módulo (H2)

No arquivo **main.tf** do terraform, realizar a declaração do módulo conforme mostrado abaixo

```hcl
module "notification" {
    source = "github.com/DCX-TAM/oci-module-notification"

    compartment_id = var.compartment_id
    notification_topics = var.notification_topics
    
}
```

Depois de declarar o módulo no **main.tf**, é necessário criar a variable notification_topics, no arquivo **variables.tf** crie sua declaração:
```hcl
variable "notification_topics" {}
```
E para criar todos os notification topics desejado basta no arquivo **terraform.tfvars**, declarar os valores para as variáveis da seguinte maneira

```hcl
notification_topics = {
    topic01 = {
        name = "DCX-Tracking"
        description = "Notification topic criado para financeiro"
        tags = {
            environment = "production"
            department  = "finance"
        } 
    },
    #topic02 = {
    #    name = "DCX-Notification"
    #    description = "Notification topic criado equipe tam"
    #    tags = {
    #        environment = "production"
    #        department  = "tam"
    #    } 
    #},
}
```

Para criar mais de um tópico basta descomentar e continuar acrestando os blocos de variáveis em sequência

## Output para o módulo (H2)

Para receber os dados de saída no terminal do terraform basta adicionar o arquivo **outputs.tf** e declarar o código abaixo:

```hcl
output "notification" {
  value = module.notification

}
```
Exemplo de Saída:
```hcl
Outputs:

notification = {
  "notification_id" = [
    "ocid1.onstopic.oc1.sa-saopaulo-1.aaaaaaaa3oypsmhorw6ftyfaim3qgdljsysmn2z7f55v3tjsly66dwxofyva",
    "ocid1.onstopic.oc1.sa-saopaulo-1.aaaaaaaadrc2tunrvhqde7vemp2yaicqjrrki3t2hijw5qyamjzyye37xtmq",
  ]
}
```

