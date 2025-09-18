variable "resource_group" {
    type = list(object({
        name     = string
        location = string
        tags     = map(string)
    }))
}