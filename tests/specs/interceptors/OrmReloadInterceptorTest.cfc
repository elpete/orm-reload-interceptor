/**
* The base interceptor test case will use the 'interceptor' annotation as the instantiation path to the interceptor
* and then create it, prepare it for mocking, and then place it in the variables scope as 'interceptor'. It is your
* responsibility to update the interceptor annotation instantiation path.
*/
component extends="coldbox.system.testing.BaseInterceptorTest" interceptor="OrmReloadInterceptor" {

    function beforeAll() {
        configProperties = {};
        super.setup();
    }
    
    function run() {
        describe( "OrmReloadInterceptor", function() {

            describe( "should configure correctly", function(){
                it( "can accept any value if no password is set", function(){
                    interceptor.configure();
                    expect( interceptor.$getProperty( "reloadPassword" ) )
                        .toBe( "" );
                });

                it( "can set the password in the interceptor settings", function(){
                    configProperties = {
                        reloadPassword = "correct_password"
                    }
                    super.setup();
                    interceptor.configure();
                    expect( interceptor.$getProperty( "reloadPassword" ) )
                        .toBe( "correct_password" );
                });
            });

            describe( "preProcess event", function() {
                beforeEach( function() {
                    interceptor.$( "callOrmReload" );
                } );

                afterEach( function() {
                    interceptor.$reset();
                } );

                it( "should not call ormReload if the key is missing from the url", function(){
                    var mockData  = {};
                    var mockEvent = getMockRequestContext();
                    mockEvent.$( "valueExists" ).$args( "ormReload" ).$results( false );
                    
                    interceptor.preProcess( mockEvent, mockData );
                    
                    expect( interceptor.$never( "callOrmReload" ) ).toBe( true );
                });

                it( "should not call ormReload if the key is in the url but the password is incorrect", function(){
                    var mockData  = {};
                    var mockEvent = getMockRequestContext();
                    mockEvent.$( "valueExists" ).$args( "ormReload" ).$results( true );
                    mockEvent.$( "getValue" ).$args( "ormReload" ).$results( "incorrect_password" );
                    
                    interceptor.preProcess( mockEvent, mockData );
                    
                    expect( interceptor.$never( "callOrmReload" ) ).toBe( true );
                });
                
                it( "should call ormReload if the key is in the url and the password is correct", function(){
                    var mockData  = {};
                    var mockEvent = getMockRequestContext();
                    mockEvent.$( "valueExists" ).$args( "ormReload" ).$results( true );
                    mockEvent.$( "getValue" ).$args( "ormReload" ).$results( "correct_password" );
                    
                    interceptor.preProcess( mockEvent, mockData );
                    
                    expect( interceptor.$once( "callOrmReload" ) ).toBe( true );
                });

                it( "should call ormReload if the key is in the url with any password when there is no password specified in the interceptor settings", function(){
                    configProperties = {}
                    super.setup();
                    interceptor.configure();
                    interceptor.$( "callOrmReload" );

                    var mockData  = {};
                    var mockEvent = getMockRequestContext();
                    mockEvent.$( "valueExists" ).$args( "ormReload" ).$results( true );
                    
                    mockEvent.$( "getValue" ).$args( "ormReload" ).$results( "1" );
                    interceptor.preProcess( mockEvent, mockData );
                    expect( interceptor.$once( "callOrmReload" ) ).toBe( true );
                    
                    interceptor.$reset();
                    interceptor.$( "callOrmReload" );

                    mockEvent.$( "getValue" ).$args( "ormReload" ).$results( "any_password" );
                    interceptor.preProcess( mockEvent, mockData );
                    expect( interceptor.$once( "callOrmReload" ) ).toBe( true );
                });
            }); 
        });
    }
    
}
