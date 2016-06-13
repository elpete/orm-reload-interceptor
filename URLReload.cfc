component extends="coldbox.system.Interceptor" {

    public void function configure() {
        variables.reloadPassword = getProperty( "reloadPassword", "" );
    }
    
    public void function preProcess( event, interceptData, buffer ) {
        if ( event.valueExists( "ormReload" ) ) {
            if ( variables.reloadPassword == "" ||
                event.getValue( "ormReload" ) == variables.reloadPassword ) {
                callOrmReload();
            }
        }
    }

    private void function callOrmReload() {
        ormReload();
    }

}
