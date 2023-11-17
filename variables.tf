variable "compartment_id" {}
variable "notification_topic_name" {
    type = map(object ({
        name = string
        tags = map(string)
    })
    )
}
