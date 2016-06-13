component extends="coldbox.system.Interceptor" {

    public void function configure() {
        variables.shouldReload = getProperty( "autoReload", true );
    }
    
    public void function preReinit( event, interceptData, buffer ) {
        if ( shouldReload ) {
            callOrmReload();
        }
    }

    private void function callOrmReload() {
        ormReload();
    }

}
