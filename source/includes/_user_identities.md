# User Identities

## Get User Identities

```shell
curl "https://<server-name>/api/v1/users/1/identities"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": [
    {
      "id": "1",
      "type": "user_identities",
      "attributes": {
        "provider": "sample",
        "uid": "abcde123"
      }
    }
  ],
  "links": {
    "self": "https://<server-name>/api/v1/users/1/identities?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "first": "https://<server-name>/api/v1/users/1/identities?page%5Bnumber%5D=1&page%5Bsize%5D=10",
    "prev": null,
    "next": null,
    "last": "https://<server-name>/api/v1/users/1/identities?page%5Bnumber%5D=1&page%5Bsize%5D=10"
  }
}
```

This endpoint retrieves all identity mappings for the specified user.

### HTTP Request

`GET https://<server-name>/api/v1/users/<USER_ID>/identities(?filter[created_at][from]=<FROM>&filter[created_at][to]=<TO>&filter[updated_at][from]=<FROM>&filter[updated_at][to]=<TO>)`

### URL Parameters

| Parameter | Description                                                                      |
| --------- | -------------------------------------------------------------------------------- |
| USER_ID   | The ID of the user to retrieve identities from                                   |
| FROM      | If present will filter experiments corresponding timestamp above or equals value |
| TO        | If present will filter experiments corresponding timestamp below or equals value |

## Get User Identity

```shell
curl "https://<server-name>/api/v1/users/1/identities/1"
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "user_identities",
    "attributes": {
      "provider": "sample",
      "uid": "abcde123"
    }
  }
}
```

This endpoint retrieves a specific user identity mapping.

### HTTP Request

`GET https://<server-name>/api/v1/users/<USER_ID>/identities/<ID>`

### URL Parameters

| Parameter | Description                                  |
| --------- | -------------------------------------------- |
| USER_ID   | The ID of the user to retrieve identity from |
| ID        | The ID of the user identity mapping          |

## Create User Identity

```shell
curl -X POST \
  https://<server-name>/api/v1/users/1/identities \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
    "data": {
        "type": "user_identities",
        "attributes": {
            "provider": "sample1",
            "uid": "abcde123"
        }
    }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "user_identities",
    "attributes": {
      "provider": "sample1",
      "uid": "abcde123"
    }
  }
}
```

This endpoint creates new user identity mapping for specific user.

### HTTP Request

`POST https://<server-name>/api/v1/users/<USER_ID>/identities`

### URL Parameters

| Parameter | Description        |
| --------- | ------------------ |
| USER_ID   | The ID of the user |

> Request body

```json
{
  "data": {
    "type": "user_identities",
    "attributes": {
      "provider": "sample1",
      "uid": "abcde123"
    }
  }
}
```

### Identity attributes

| Attribute | Mandatory | Description                                     |
| --------- | --------- | ----------------------------------------------- |
| provider  | yes       | name of the external identity provider          |
| uid       | yes       | uid of the user from external identity provider |

## Update User Identity

```shell
curl -X PATCH \
  https://<server-name>/api/v1/users/1/identities/1 \
  -H 'Authorization: Bearer qwerty123456...' \
  -H 'Content-Type: application/vnd.api+json' \
  -d '{
      "data": {
          "type": "user_identities",
          "id": 1,
          "attributes": {
              "provider": "sample2",
              "uid": "abcde1234"
          }
      }
  }'
```

> The above command returns JSON structured like this:

```json
{
  "data": {
    "id": "1",
    "type": "user_identities",
    "attributes": {
      "provider": "sample2",
      "uid": "abcde1234"
    }
  }
}
```

This endpoint updates existing identity mapping for the selected user.
If submitted attributes are the same and no changes are made for the identity mapping, server returns empty body with response code 204.

### HTTP Request

`PATCH https://<server-name>/api/v1/users/<USER_ID>/identities/<ID>`

### URL Parameters

| Parameter | Description                         |
| --------- | ----------------------------------- |
| USER_ID   | The ID of the user                  |
| ID        | The ID of the user identity mapping |

### Request body

```json
{
  "data": {
    "type": "user_identities",
    "id": "1",
    "attributes": {
      "provider": "sample2",
      "uid": "abcde1234"
    }
  }
}
```

### User identity attributes

| Attribute | Mandatory | Description                                     |
| --------- | --------- | ----------------------------------------------- |
| provider  | no        | name of the external identity provider          |
| uid       | no        | uid of the user from external identity provider |

## Delete User Identity

```shell
curl -X DELETE \
  https://<server-name>/api/v1/users/1/identities/1 \
  -H "Authorization: Bearer qwerty123456..."
```

> The above command returns empty body with status code 200

This endpoint deletes specific user identity mapping.

### HTTP Request

`DELETE https://<server-name>/api/v1/users/<USER_ID>/identities/<ID>`

### URL Parameters

| Parameter | Description                                          |
| --------- | ---------------------------------------------------- |
| USER_ID   | The ID of the user to retrieve identity mapping from |
| ID        | The ID of the identity mapping                       |
