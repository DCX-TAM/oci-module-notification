variable "compartment_id" {}
variable "notification_topics" {
    type = map(object({
      name = string
      description = string
      tags = map(string)
    }))
  
}