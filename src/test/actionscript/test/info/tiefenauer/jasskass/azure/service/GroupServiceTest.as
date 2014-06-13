/**
 * GroupServiceTest.as
 *
 * Project: JassKass
 * Date: Jun 13, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.azure.service
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.azure.service
{
	import info.tiefenauer.jasskass.azure.service.GroupService;
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.model.interfaces.IJassGroup;
	
	import mockolate.nice;
	import mockolate.stub;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.assertThat;
	import org.flexunit.asserts.assertNotNull;
	import org.hamcrest.number.greaterThan;
	import org.osflash.signals.utils.SignalAsyncEvent;
	import org.osflash.signals.utils.handleSignal;

	public class GroupServiceTest
	{	
		[Rule] public var rule:MockolateRule = new MockolateRule();
		[Mock] public var group:JassGroup;
		[Mock] public var player:JassPlayer;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var service:GroupService;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			service = new GroupService();
			service.init();
		}
		
		[After]
		public function tearDown():void
		{
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
		[Test(async,description="test adding group with 4 players")]
		public function shouldAddGroup():void{
			var player1:IJassPlayer = nice(JassPlayer); 
			var player2:IJassPlayer = nice(JassPlayer); 
			var player3:IJassPlayer = nice(JassPlayer); 
			var player4:IJassPlayer = nice(JassPlayer);
			stub(player1).getter('firstName').returns('Daniel');
			stub(player1).getter('lastName').returns('Tiefenauer');
			stub(player1).getter('eMail').returns('daniel@tiefenauer.info');
			stub(player2).getter('firstName').returns('Daniel');
			stub(player2).getter('lastName').returns('Huser');
			stub(player2).getter('eMail').returns('danielhuser@bluewin.ch');
			stub(player3).getter('firstName').returns('Christian');
			stub(player3).getter('lastName').returns('Stalder');
			stub(player3).getter('eMail').returns('cstalder@swissonline.ch');
			stub(player4).getter('firstName').returns('Christoph');
			stub(player4).getter('lastName').returns('Tanner');
			stub(player4).getter('eMail').returns('christoph.tanner@tannerpumpen.ch');
			stub(group).getter('name').returns('TestGroup');
			stub(group).getter('players').returns(Vector.<IJassPlayer>([player1, player2, player3, player4]));
			handleSignal(this, service.onSuccess, function(event:SignalAsyncEvent, ...args):void{
				assertThat(event.args.length, greaterThan(0));
				assertThat(event.args[0] is IJassGroup);
				var responseGroup:IJassGroup = event.args[0] as IJassGroup;
				assertNotNull(responseGroup.id);
				assertNotNull(responseGroup.key);
			}, 10000)
			service.addGroup(group);
		}
		
	}
}