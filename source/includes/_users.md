# Users

## Get Users

```shell
curl "https://<server-name>/api/v1/teams/1/users"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "data": {
        "id": "1",
        "type": "users",
        "attributes": {
          "full_name": "Sample User",
          "initials": "SU",
          "email": "sample@example.com",
          "avatar_url": "http://example.com/avatar.png",
          "avatar_file_size": 16181,
          "avatar_file_name": "avatar.png"
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/teams/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/teams/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/teams/1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all users from a specific team.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/users(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter | Description                                                                     |
| --------- | ------------------------------------------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve users from                                       |
| FROM      | If present will filter team users corresponding timestamp above or equals value |
| TO        | If present will filter team users corresponding timestamp below or equals value |

## Get a Specific User

```shell
curl "https://<server-name>/api/v1/users/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "users",
    "attributes": {
      "full_name": "Sample User",
      "initials": "SU",
      "email": "sample@example.com",
      "avatar_url": "http://example.com/avatar.png",
      "avatar_file_size": 16181,
      "avatar_file_name": "avatar.png"
    }
  }
}
```

This endpoint retrieves a specific user.
Only users who are members of the same teams as current user can be read.

### HTTP Request

`GET https://<server-name>/api/v1/users/<ID>`

### URL Parameters

| Parameter | Description                    |
| --------- | ------------------------------ |
| ID        | The ID of the user to retrieve |
