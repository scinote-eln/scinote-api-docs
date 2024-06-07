# User Roles

## Get User Roles

```shell
curl "https://<server-name>/api/v1/user_roles"
  -H "Authorization: Bearer qwerty123456..."
```
> The above command returns JSON structured like this:

```json
{
    "data": [
        {
            "id": "1",
            "type": "user_roles",
            "attributes": {
                "name": "Owner",
                "permissions": ["project_read", "experiment_read", "task_read"]
            }
        },
        {
            "id": "2",
            "type": "user_roles",
            "attributes": {
                "name": "User",
                "permissions": ["project_read", "experiment_read", "task_read"]
            }
        }
    ],
    "links": {
        "self": "https://<server-name>/api/v1/user_roles?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "first": "https://<server-name>/api/v1/user_roles?page%5Bnumber%5D=1&page%5Bsize%5D=10",
        "prev": null,
        "next": null,
        "last": "https://<server-name>/api/v1/user_roles?page%5Bnumber%5D=1&page%5Bsize%5D=10"
    }
}
```

This endpoint retrieves all user roles in the system.

### HTTP Request

`GET https://<server-name>/api/v1/user_roles`
