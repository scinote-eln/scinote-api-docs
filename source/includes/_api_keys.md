# API Keys

The API key is an alternative to the OAuth 2 / JWT `Bearer` token: once generated, you send it in the `Api-Key` header of your `/api/v1` requests instead of an `Authorization: Bearer ...` header (see [Alternative: API Key authentication](#alternative-api-key-authentication)).

Unlike the `/api/v1` endpoints documented elsewhere, the two actions below are **not** part of the programmatic API. They are account-management actions on your SciNote user profile settings page (`/users/edit`), triggered from a logged-in web session. They are authenticated by your Devise session cookie and a CSRF token, **not** by a `Bearer` or `Api-Key` header, and neither one returns a JSON body — each responds with a `302 Found` redirect back to the settings page.

<aside class="notice">
The API key authentication feature needs to be enabled on your instance for these actions to be available. When enabled, both actions appear as buttons in your user profile settings.
</aside>

## Regenerate API Key

```shell
curl -X POST "https://<server-name>/users/api_key_regenerate" \
  -H "X-CSRF-Token: <csrf-token>" \
  --cookie "_scinote_session=<session-cookie>"
```

> The above command does not return a JSON body. Instead it responds with a redirect:

```http
HTTP/1.1 302 Found
Location: https://<server-name>/users/edit#api-key
```

This endpoint generates a new API key for the currently authenticated user. It is used both for creating the very first key and for regenerating an existing one; regenerating invalidates the previous key immediately. The new key is a random, URL-safe string and expires one year after it is created.

Because this is a web-session action, the freshly generated key is surfaced through the settings page rather than in the response body: it is shown in full **exactly once**, right after the redirect to `/users/edit#api-key`. On every later visit to the settings page only a masked value is displayed (all characters except the last four are replaced with `*`), so copy the key when it is first shown. This key is the value you then send in the `Api-Key` header of your `/api/v1` requests.

### HTTP Request

`POST https://<server-name>/users/api_key_regenerate`

<aside class="notice">
This action requires a logged-in SciNote web session. It is normally performed from the user profile settings page (<code>/users/edit</code>), not called programmatically, and it takes no request body.
</aside>

## Revoke API Key

```shell
curl -X POST "https://<server-name>/users/api_key_revoke" \
  -H "X-CSRF-Token: <csrf-token>" \
  --cookie "_scinote_session=<session-cookie>"
```

> The above command does not return a JSON body. Instead it responds with a redirect:

```http
HTTP/1.1 302 Found
Location: https://<server-name>/users/edit#api-key
```

This endpoint revokes the currently authenticated user's API key. After revocation the user no longer has an API key, and API key authentication stops working for that user right away — any request that still sends the old key in the `Api-Key` header is rejected. To authenticate with an API key again, generate a new one with [Regenerate API Key](#regenerate-api-key).

The revoke action is only available while a key exists; once revoked, the settings page shows no key and offers only the option to generate a new one.

### HTTP Request

`POST https://<server-name>/users/api_key_revoke`

<aside class="notice">
This action requires a logged-in SciNote web session. It is normally performed from the user profile settings page (<code>/users/edit</code>), not called programmatically, and it takes no request body.
</aside>
