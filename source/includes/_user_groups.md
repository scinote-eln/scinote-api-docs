# User Groups

## Get User Groups

```shell
curl "https://<server-name>/api/v2/teams/1/user_groups" \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "user_groups",
      "attributes": {
        "name": "Lab technicians",
        "created_at": "2025-11-11T13:25:53.910Z",
        "updated_at": "2025-11-15T10:30:33.415Z"
      },
      "relationships": {
        "team": {
          "data": {
            "id": "1",
            "type": "teams"
          }
        },
        "users": {
          "data": [
            {
              "id": "1",
              "type": "users"
            },
            {
              "id": "2",
              "type": "users"
            }
          ]
        }
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v2/teams/1/user_groups?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v2/teams/1/user_groups?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v2/teams/1/user_groups?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all user groups in the specified team, together with the IDs of their members.
User group IDs can be used when assigning user groups to projects (see Project User Group Assignments).

### HTTP Request

`GET https://<server-name>/api/v2/teams/<TEAM_ID>/user_groups`

### URL Parameters

| Parameter | Description                                     |
| --------- | ----------------------------------------------- |
| TEAM_ID   | The ID of the team to retrieve user groups from |
