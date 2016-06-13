# ORM Reload Interceptor

Just like you can add `fwreinit=my_passsword` to the URL to reload your ColdBox application,
this module adds an interceptor that lets you specify `ormreload=my_orm_reload_password`.

You can set the reload password in the interceptor settings:

```cfc
{
	reloadPassword = "my_awesome_password"
}
```