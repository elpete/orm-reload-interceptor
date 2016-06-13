component
    displayname="ReloadWithFWReinitTest"
    extends="coldbox.system.testing.BaseInterceptorTest"
    interceptor="ReloadWithFWReinit"
{

    function beforeAll() {
        configProperties = {};
        super.setup();
    }
    
    function run() {
        describe( "ReloadWithFWReinit", function() {

            describe( "should configure correctly", function(){
                it( "defaults to auto reloading", function(){
                    interceptor.configure();
                    expect( interceptor.$getProperty( "shouldReload" ) )
                        .toBe( true );
                });

                it( "can be set to not auto reload in the interceptor settings", function(){
                    configProperties = {
                        autoReload = false
                    };
                    super.setup();
                    interceptor.configure();
                    expect( interceptor.$getProperty( "shouldReload" ) )
                        .toBe( false );
                });
            });

            describe( "preReinit event", function() {
                it( "should call ormReload on reinit by default", function(){
                    var mockData  = {};
                    var mockEvent = getMockRequestContext();
                    configProperties = {};
                    super.setup();
                    interceptor.configure();
                    interceptor.$( "callOrmReload" );
                    
                    interceptor.preReinit( mockEvent, mockData );
                    
                    expect( interceptor.$once( "callOrmReload" ) ).toBe( true );
                });

                it( "should not call ormReload on reinit when the autoReload property is false", function(){
                    var mockData  = {};
                    var mockEvent = getMockRequestContext();
                    configProperties = {
                        autoReload = false
                    };
                    super.setup();
                    interceptor.configure();
                    interceptor.$( "callOrmReload" );
                    
                    interceptor.preReinit( mockEvent, mockData );
                    
                    expect( interceptor.$never( "callOrmReload" ) ).toBe( true );
                });
            }); 
        });
    }
    
}
