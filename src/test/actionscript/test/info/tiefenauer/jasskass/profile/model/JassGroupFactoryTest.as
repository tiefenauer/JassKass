/**
 * JassGroupFactoryTest.as
 *
 * Project: JassKass
 * Date: Jun 12, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.profile.model
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.profile.model
{
	import info.tiefenauer.jasskass.jass.model.interfaces.IJassPlayer;
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	import info.tiefenauer.jasskass.profile.model.factory.JassGroupFactory;
	
	import mockolate.nice;
	import mockolate.stub;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertFalse;
	import org.flexunit.asserts.assertTrue;

	public class JassGroupFactoryTest
	{		
		[Rule] public var rule:MockolateRule = new MockolateRule();
		[Mock] public var group:JassGroup;
		[Mock] public var player:JassPlayer;
		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		private var player1:JassPlayer;
		private var player2:JassPlayer;
		private var player3:JassPlayer;
		private var player4:JassPlayer;
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
			player1 = nice(JassPlayer);
			stub(player1).getter('firstName').returns('Player1');
			stub(player1).getter('lastName').returns('One');
			stub(player1).getter('eMail').returns('one@player.com');
			
			player2 = nice(JassPlayer);
			stub(player2).getter('firstName').returns('Player2');
			stub(player2).getter('lastName').returns('Two');
			stub(player2).getter('eMail').returns('two@player.com');
			
			player3 = nice(JassPlayer);
			stub(player3).getter('firstName').returns('Player3');
			stub(player3).getter('lastName').returns('Three');
			stub(player3).getter('eMail').returns('three@player.com');
			
			player4 = nice(JassPlayer);
			stub(player4).getter('firstName').returns('Player4');
			stub(player4).getter('lastName').returns('Four');
			stub(player4).getter('eMail').returns('four@player.com');
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
		[Test(description="toAzureObject() should produce a correct object")]
		public function testToAzureObject():void{
			stub(group).getter('id').returns('someGroupId');
			stub(group).getter('key').returns('someGroupKey');
			stub(group).getter('name').returns('someGroupName');
			stub(group).getter('active').returns(true);
			stub(group).getter('players').returns(Vector.<IJassPlayer>([player1, player2, player3, player4]));
			
			var obj:Object = JassGroupFactory.toAzureObject(group);
			assertEquals('someGroupId', obj.id);
			assertEquals('someGroupName', obj.groupName);
			assertEquals('someGroupKey', obj.key);
			assertEquals('someGroupName', obj.name);
			assertTrue(obj.active);
			assertEquals(4, obj.players.length);
			assertEquals('Player1', obj.players[0].firstName);
			assertEquals('One', obj.players[0].lastName);
			assertEquals('one@player.com', obj.players[0].eMail);
			assertEquals('Player2', obj.players[1].firstName);
			assertEquals('Two', obj.players[1].lastName);
			assertEquals('two@player.com', obj.players[1].eMail);
			assertEquals('Player3', obj.players[2].firstName);
			assertEquals('Three', obj.players[2].lastName);
			assertEquals('three@player.com', obj.players[2].eMail);
			assertEquals('Player4', obj.players[3].firstName);
			assertEquals('Four', obj.players[3].lastName);
			assertEquals('four@player.com', obj.players[3].eMail);
		}
		[Test(description="toAzureObject() with null values should produce a correct object")]
		public function testToAzureObjectWithNullValues():void{
			stub(group).getter('id').returns(null);
			stub(group).getter('key').returns(null);
			stub(group).getter('name').returns(null);
			stub(group).getter('active').returns(null);
			stub(group).getter('players').returns(null);

			var obj:Object = JassGroupFactory.toAzureObject(group);
			assertEquals('', obj.id);
			assertEquals('', obj.groupName);
			assertEquals('', obj.key);
			assertFalse(obj.active);
			assertEquals(0, obj.players.length);
		}
		
	}
}