component displayname="ModuleConfig" {

    this.title = "OrmReloadInterceptor";
    this.author = "Eric Peterson";
    this.webURL = "";
    this.description = "Calls ORMReload() when the `ormReload=correct_password` is set in the URL or when `fwreinit` is called.";
    this.version = "1.0.0";
    this.entryPoint = "OrmReloadInterceptor";
    this.modelNamespace = "OrmReloadInterceptor";
    this.cfmapping = "OrmReloadInterceptor";
    this.dependencies = [];

    function configure() {
        interceptors = [
            { name = "URLReload", class = "#moduleMapping#.URLReload" },
            { name = "ReloadWithFWReinit", class = "#moduleMapping#.ReloadWithFWReinit" }
        ];
    }
}