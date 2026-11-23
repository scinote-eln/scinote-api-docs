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

## Get All Users

<aside class="notice">
  Listing all users, creating a user and updating a user require the Organization Management add-on (available on Enterprise) and can only be used by organization administrators. Requests from other users are rejected with <code>403 Forbidden</code>.
</aside>

```shell
curl "https://<server-name>/api/v1/users"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "users",
      "attributes": {
        "full_name": "John Doe",
        "initials": "JD",
        "email": "john.doe@example.com",
        "created_at": "2026-01-15T10:30:00.000Z",
        "updated_at": "2026-01-20T08:15:00.000Z",
        "subscription_status": "active_subscription"
      }
    },
    {
      "id": "2",
      "type": "users",
      "attributes": {
        "full_name": "Jane Roe",
        "initials": "JR",
        "email": "jane.roe@example.com",
        "created_at": "2026-02-01T09:00:00.000Z",
        "updated_at": "2026-02-01T09:00:00.000Z",
        "subscription_status": "locked_subscription"
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/users?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all users on the instance. Unlike the team-scoped users endpoint, it is not limited to the teams the current user belongs to and returns every user account. The result is paginated; use the `page[number]` and `page[size]` query parameters to navigate, and follow the `links` object in the response.

### HTTP Request

`GET https://<server-name>/api/v1/users(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter | Description                                                                |
| --------- | -------------------------------------------------------------------------- |
| FROM      | If present will filter users corresponding timestamp above or equals value |
| TO        | If present will filter users corresponding timestamp below or equals value |

## Create a User

```shell
curl -X POST \
  https://<server-name>/api/v1/users \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "users",
      "attributes": {
        "full_name": "New User",
        "initials": "NU",
        "email": "new.user@example.com",
        "password": "S3cretPassw0rd!",
        "subscription_status": "active_subscription"
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "42",
    "type": "users",
    "attributes": {
      "full_name": "New User",
      "initials": "NU",
      "email": "new.user@example.com",
      "created_at": "2026-07-22T12:00:00.000Z",
      "updated_at": "2026-07-22T12:00:00.000Z",
      "subscription_status": "active_subscription"
    }
  }
}
```

This endpoint creates a new user on the instance and responds with `201 Created`. The request body must follow the JSON:API format with `data.type` set to `users`. The user is created inside a transaction and is automatically confirmed, so no confirmation step is required.

### HTTP Request

`POST https://<server-name>/api/v1/users`

> Request body

```json
{
  "data": {
    "type": "users",
    "attributes": {
      "full_name": "New User",
      "initials": "NU",
      "email": "new.user@example.com",
      "password": "S3cretPassw0rd!",
      "subscription_status": "active_subscription"
    }
  }
}
```

### User attributes

| Attribute           | Mandatory | Description                                                                  |
| ------------------- | --------- | ---------------------------------------------------------------------------- |
| full_name           | yes       | Full name of the user                                                        |
| initials            | yes       | Initials of the user                                                         |
| email               | yes       | Email address of the user                                                    |
| password            | yes       | Password for the new user                                                    |
| subscription_status | no        | Subscription status of the user, either `active_subscription` or `locked_subscription` |

## Update a User

```shell
curl -X PATCH \
  https://<server-name>/api/v1/users/42 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
      "type": "users",
      "attributes": {
        "full_name": "Updated Name",
        "subscription_status": "locked_subscription"
      }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "42",
    "type": "users",
    "attributes": {
      "full_name": "Updated Name",
      "initials": "NU",
      "email": "new.user@example.com",
      "created_at": "2026-07-22T12:00:00.000Z",
      "updated_at": "2026-07-22T13:45:00.000Z",
      "subscription_status": "locked_subscription"
    }
  }
}
```

This endpoint updates an existing user. Both `PATCH` and `PUT` requests to this path are accepted and behave identically. Only the submitted attributes are changed. If the submitted attributes are the same and no changes are made, the server returns an empty body with response code 204. When `subscription_status` is changed to `active_subscription`, the maximum number of active users configured for the instance is enforced; exceeding the limit returns an error.

### HTTP Request

`PATCH https://<server-name>/api/v1/users/<ID>`

`PUT https://<server-name>/api/v1/users/<ID>`

### URL Parameters

| Parameter | Description                   |
| --------- | ----------------------------- |
| ID        | The ID of the user to update  |

### Request body

```json
{
  "data": {
    "type": "users",
    "attributes": {
      "full_name": "Updated Name",
      "subscription_status": "locked_subscription"
    }
  }
}
```

### User attributes

| Attribute           | Mandatory | Description                                                                  |
| ------------------- | --------- | ---------------------------------------------------------------------------- |
| full_name           | no        | Full name of the user                                                        |
| initials            | no        | Initials of the user                                                         |
| email               | no        | Email address of the user                                                    |
| password            | no        | New password for the user                                                    |
| subscription_status | no        | Subscription status of the user, either `active_subscription` or `locked_subscription` |
