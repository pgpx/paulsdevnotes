# OAuth 2

* [OAuth 2.0 and OpenID Connect (in plain English)](https://youtu.be/996OiexHze0) (YouTube) - Good introduction to OAuth 2
* [RFC 6749](https://datatracker.ietf.org/doc/html/rfc6749) - The OAuth 2.0 Authorization Framework
* [RFC 6819](https://datatracker.ietf.org/doc/html/rfc6819) - OAuth 2.0 Threat Model and Security Considerations

## Roles

[OAuth defines four roles:](https://datatracker.ietf.org/doc/html/rfc6749#section-1.1)

> **resource owner** - An entity capable of granting access to a protected resource.
When the resource owner is a person, it is referred to as an
end-user.
> 
> **resource server** - The server hosting the protected resources, capable of accepting
and responding to protected resource requests using access tokens.
> 
> **client** - An application making protected resource requests on behalf of the
resource owner and with its authorization.  The term "client" does
not imply any particular implementation characteristics (e.g.,
whether the application executes on a server, a desktop, or other
devices).
> 
> **authorization server** - The server issuing access tokens to the client after successfully
authenticating the resource owner and obtaining authorization.]

## Implicit Flow

* [Keycloak docs](https://www.keycloak.org/docs/latest/securing_apps/#_javascript_implicit_flow)