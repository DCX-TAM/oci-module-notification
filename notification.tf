# Criação Notification

resource "oci_ons_notification_topic" "test_notification_topic" {
    #Required
    compartment_id = var.compartment_id
    name = var.notification_topic_name

    #Optional
    freeform_tags = {"Department"= "Finance"}
}