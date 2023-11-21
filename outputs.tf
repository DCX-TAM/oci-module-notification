output "notification_id" {
    value = [for notification in oci_ons_notification_topic.test_notification_topic : notification.id]
}


output "notification_name" {
    value = [for notification in oci_ons_notification_topic.test_notification_topic : notification.name]
}