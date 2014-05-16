/**
 * AzureKassServiceTest.as
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
	import flash.events.Event;
	import flash.net.URLLoader;
	
	import info.tiefenauer.jasskass.azure.service.KassService;
	import info.tiefenauer.jasskass.kass.model.Kass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	
	import mockolate.stub;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.hamcrest.core.anything;
	import org.osflash.signals.Signal;

	public class KassServiceTest
	{		
		[Rule] public var rule:MockolateRule = new MockolateRule();
		[Mock] public var group:JassGroup;
		[Mock] public var urlLoader:URLLoader;
		[Mock] public var onSuccess:Signal;
		[Mock] public var kass:Kass;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var service:KassService;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			service = new KassService();
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
		[Test(description="getKass(group with id) should produce a correct Kass")]
		public function testGetById():void{
			var now:Date = new Date();
			urlLoader.data = JSON.stringify({
				id: 'someId',
				group: 'someGroupId',
				entries: [
					{
						id: 'entry1', 
						date: now.time, 
						amounts: [
							{id: 'amount1', player: 'player1', value: 10},
							{id: 'amount2', player: 'player2', value: 20},
							{id: 'amount3', player: 'player3', value: 30},
							{id: 'amount4', player: 'player4', value: 40},
						]
					},
					{
						id: 'entry2', 
						date: now.time + 100000, 
						amounts: [
							{id: 'amount1', player: 'player2', value: 20},
							{id: 'amount2', player: 'player1', value: 10},
							{id: 'amount3', player: 'player4', value: 40},
							{id: 'amount4', player: 'player3', value: 30},
						]
					}
				]
			});
			stub(urlLoader).method('load').args(anything()).dispatches(new Event(Event.COMPLETE), 100);
			stub(group).getter('id').returns('someGroup');
			
			service.onSuccess.addOnce(function(kass:IKass):void{
				assertNotNull(kass);
				assertEquals('someId', kass.id);
				assertNotNull(kass.group);
				assertEquals('someGroupId', kass.group.id);
				assertEquals(2, kass.entries.length);
			});
			service.urlLoader = urlLoader;
			service.getKass(group);
		}
		
	}
}