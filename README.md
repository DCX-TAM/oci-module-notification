

Como declarar o módulo

module "notification" {
    source = "github.com/DCX-TAM/oci-module-notification"

    compartment_id = var.compartment_id
    notification_topic_name = var.notification_topic_name

}