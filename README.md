# ORM Reload Interceptor

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors)

## Installation

`box install orm-reload-interceptor`

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
## Contributors

Thanks goes to these wonderful people ([emoji key](https://github.com/kentcdodds/all-contributors#emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
| [<img src="https://avatars1.githubusercontent.com/u/2583646?v=4" width="100px;"/><br /><sub>Eric Peterson</sub>](https://github.com/elpete)<br />[💻](https://github.com/elpete/orm-reload-interceptor/commits?author=elpete "Code") [📖](https://github.com/elpete/orm-reload-interceptor/commits?author=elpete "Documentation") |
| :---: |
<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/kentcdodds/all-contributors) specification. Contributions of any kind welcome!
