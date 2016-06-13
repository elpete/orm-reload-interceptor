<cfsetting showDebugOutput="false">

<!--- Executes all tests in the 'specs' folder with simple reporter by default --->
<cfparam name="url.reporter"        default="simple">
<cfparam name="url.directory"       default="tests.specs">
<cfparam name="url.recurse"         default="true" type="boolean">

<!--- Include the TestBox HTML Runner --->
<cfinclude template="/testbox/system/runners/HTMLRunner.cfm" >