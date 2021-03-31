---
title: SciNote V1 API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell

toc_footers:
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - teams
  - users
  - user_identities
  - projects
  - project_users
  - project_activities
  - project_comments
  - project_folders
  - experiments
  - task_groups
  - task_connections
  - tasks
  - task_protocols
  - protocol_steps
  - checklists
  - checklist_items
  - tables
  - attachments
  - task_users
  - task_activities
  - task_tags
  - task_inventory_items
  - results
  - reports
  - inventories
  - inventory_columns
  - inventory_column_list_items
  - inventory_column_status_items
  - inventory_column_checklist_items
  - inventory_items
  - inventory_cells
  - workflows
  - workflow_statuses
  - errors
  - status

search: true

code_clipboard: true
---

# Introduction

Welcome to the SciNote V1 API! You can use our API to access SciNote API endpoints.

This API documentation page was created with [Slate](https://github.com/lord/slate).

_By accessing or using SciNote API, you agree to [SciNote API Terms](https://scinote.net/wp-content/uploads/2018/12/SCINOTE_API_TERMS.pdf)._

# Authentication

SciNote uses JWT tokens to allow access to the API and OAuth 2 protocol for token generation using authorization code flow.

First, authorization code needs to be retrieved at the following endpoint: `GET /oauth/authorize`, please see example of such request.

> To get an authorization code, use this code:

```shell
curl https://<server-name>/oauth/authorize?client_id=<client-id>&redirect_uri=<redirect-uri>&response_type=code
```
> Where `<client-id>` is your application registration id, `<redirect-uri>` your application redirect URI.

> The above command redirects back to your application with authorization code

Now you can get a new access token at `POST /oauth/token` request. Once it expires, use refresh token to get new access token.

Post here with authorization code for `authorization_code` grant type or `refresh_token` for refresh token type. This corresponds to the token endpoint, section 3.2 of the OAuth 2 RFC.

> To get an access token, use this code:

```shell
curl -F grant_type=authorization_code \
-F client_id=<client-app-id> \
-F client_secret=<client-app-secret> \
-F code=<authorization-code> \
-F redirect_uri=<client-app-redirect-url> \
-X POST https://<server-name>/oauth/token
```

> The above command returns JSON structured like this:

```json
{
    "access_token":"qwerty123456...",
    "token_type":"bearer",
    "expires_in":7200,
    "refresh_token":"qwerty123456..."}
}
```

> And for renewal, use this code:

```shell
curl -F grant_type=refresh_token \
-F client_id=<client-app-id> \
-F client_secret=<client-app-secret> \
-F refresh_token=<refresh-token> \
-F redirect_uri=<client-app-redirect-url> \
-X POST https://<server-name>/oauth/token
```

SciNote expects for the API access token to be included in all API requests to the server in a header that looks like the following:

`Authorization: Bearer qwerty123456...`

<aside class="notice">
You must replace <code>qwerty123456...</code> with your API access token.
</aside>

### JWT payload claims

By default tokens include such set of claims:

Claim | Description
--------- | -----------
iss | Text identifier of the token issuer
exp | Token expiration time
sub | The ID of the current authenticated user

# Pagination

SciNote API uses pagination as specified here [JSON API](http://jsonapi.org/format/#fetching-pagination)

Default page size is 10.

### Pagination Parameters

Parameter | Default | Description
--------- | ------- | -----------
page_number | 1 | Number of requested page.
page_size | 10 | Number of items returned per page.
