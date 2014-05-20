/**
 * StartJassTest.as
 *
 * Project: JassKass
 * Date: May 20, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.jass.controller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.jass.controller
{
	import flash.events.EventDispatcher;
	
	import info.tiefenauer.jasskass.jass.controller.StartJass;

	public class StartJassTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var command:StartJass;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			command = new StartJass();
			command.eventDispatcher = new EventDispatcher();
		}
		
		[After]
		public function tearDown():void
		{
			command = null;
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
		[Ignore]
		[Test(async, description="Events should be correctly dispatched")]
		public function testCommand():void{
		}
		
	}
}