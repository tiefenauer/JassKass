/**
 * AzureServiceTest.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.azure
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.azure
{
	import info.tiefenauer.jasskass.azure.service.AzureService;
	
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertNull;

	public class AzureServiceTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/    
		private var service:AzureService;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			service = new AzureService(null);
		}
		
		[After]
		public function tearDown():void
		{
			service = null;
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		/*============================================================================*/
		/* Tests                                                                      */
		/*============================================================================*/
		[Test(description="attributes should not be null")]
		public function testDefaults():void{
			assertNotNull(service.urlLoader);
			assertNotNull(service.urlStream);
			assertNotNull(service.onError);
			assertNotNull(service.onProgress);
			assertNotNull(service.onSuccess);
		}
		
	}
}