# Criação Notification

resource "oci_ons_notification_topic" "test_notification_topic" {
    for_each = var.notification_topics
    #Required
    compartment_id = var.compartment_id
    name = each.value.name
    description = each.value.description

    #Optional

    freeform_tags = each.value["tags"]
}

