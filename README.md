# ORM Reload Interceptor

## ORMReload with a URL flag

Just like you can add `fwreinit=my_passsword` to the URL to reload your ColdBox application,
this module adds an interceptor that lets you specify `ormreload=my_orm_reload_password`.

The interceptor will work out of the box with no password set.

If you want to set the reload password, override the interceptor in your `config/Coldbox.cfc` settings:

```cfc
interceptors = [
	{
		class="modules.orm-reload-interceptor.URLReload",
		properties = {
			reloadPassword = "my-password-here"
		}
	}
];
```

## ORMReload on FWReinit

Installing this module will also automatically call `ormReload()` on a fwreinit (`?fwreinit=1`).
You can override this setting by overriding the interceptor in your `config/Coldbox.cfc` settings, as well:

```cfc
interceptors = [
	{
		class="modules.orm-reload-interceptor.ReloadWithFWReinit",
		properties = {
			autoReload = false
		}
	}
];
```