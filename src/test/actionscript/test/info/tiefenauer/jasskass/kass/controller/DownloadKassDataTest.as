/**
 * DownloadKassDataTest.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.kass.controller
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.kass.controller
{
	import flash.events.EventDispatcher;
	
	import info.tiefenauer.jasskass.azure.service.KassService;
	import info.tiefenauer.jasskass.kass.controller.DownloadKassData;
	import info.tiefenauer.jasskass.kass.events.KassEvent;
	import info.tiefenauer.jasskass.kass.model.Kass;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	
	import mockolate.stub;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.async.Async;
	import org.hamcrest.core.anything;
	
	import robotlegs.bender.framework.impl.Context;

	public class DownloadKassDataTest
	{	
		[Rule] public var rule:MockolateRule = new MockolateRule();
		[Mock] public var group:JassGroup;
		[Mock] public var kassService:KassService;
		[Mock] public var kass:Kass;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var command:DownloadKassData;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			command = new DownloadKassData();
			command.context = new Context();
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
		[Test(async, description="downloading Kass data should work")]
		public function testExecute():void{
			stub(group).getter('id').returns('someGroupId');
			stub(kassService).method('getKass').args(anything()).calls(kassService.onSuccess.dispatch, [kass]);
			
			command.event = new KassEvent(KassEvent.DOWNLOAD_KASS_DATA);
			command.event.group = group;
			command.service = kassService;
			
			Async.handleEvent(this, command.eventDispatcher, KassEvent.DOWNLOAD_KASS_DATA_END, function(event:KassEvent, ...args ):void{
				assertEquals(group, event.group);
				assertEquals(kass, event.kass);
			});
			command.execute();
		}
		
		
	}
}