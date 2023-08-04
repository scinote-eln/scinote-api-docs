# Project Comments

## Get Project Comments

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/comments"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "comments",
      "attributes": {
        "message": "I've created a demo project"
      },
      "relationships": {
        "user": {
          "data": {
            "id": "1",
            "type": "users"
          }
        }
      }
    }
  ],
  "links": {
    "self": "http://<server-name>/api/v1/teams/1/projects/1/comments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "http://<server-name>/api/v1/teams/1/projects/1/comments?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "http://<server-name>/api/v1/teams/1/projects/1/comments?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all comments from specific project.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/comments(?created_at[from]=<FROM>&created_at[to]=<TO>&updated_at[from]=<FROM>&updated_at[to]=<TO>)`

### URL Parameters

| Parameter  | Description                                                                           |
| ---------- | ------------------------------------------------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from                                           |
| PROJECT_ID | The ID of the project to retrieve comments from                                       |
| FROM       | If present will filter project comments corresponding timestamp above or equals value |
| TO         | If present will filter project comments corresponding timestamp below or equals value |

## Get Project Comment

```shell
curl "http://<server-name>/api/v1/teams/1/projects/1/comments/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "comments",
    "attributes": {
      "message": "I've created a demo project"
    },
    "relationships": {
      "user": {
        "data": {
          "id": "1",
          "type": "users"
        }
      }
    }
  },
  "included": [
    {
      "id": "1",
      "type": "users",
      "attributes": {
        "full_name": "Admin",
        "initials": "A",
        "email": "admin@scinote.net",
        "avatar_url": "http://example.com/avatar.png",
        "avatar_file_size": 16181,
        "avatar_file_name": "avatar.png"
      }
    }
  ]
}
```

This endpoint retrieves a specific comment from specific project.

### HTTP Request

`GET https://<server-name>/api/v1/teams/<TEAM_ID>/projects/<PROJECT_ID>/comments/<COMMENT_ID>`

### URL Parameters

| Parameter  | Description                                    |
| ---------- | ---------------------------------------------- |
| TEAM_ID    | The ID of the team to retrieve project from    |
| PROJECT_ID | The ID of the project to retrieve comment from |
| COMMENT_ID | The ID of the comment to retrieve              |
