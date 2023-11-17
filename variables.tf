variable "compartment_id" {}
variable "notification_topics" {
    type = map(object({
      name = string
      tags = map(string)
    }))
  
}