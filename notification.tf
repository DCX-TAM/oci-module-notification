# Criação Notification

resource "oci_ons_notification_topic" "test_notification_topic" {
    for_each = var.notification_topic_name
    #Required
    compartment_id = var.compartment_id
    name = each.key.value

    #Optional
    #freeform_tags  = each.value["tags"]
}

