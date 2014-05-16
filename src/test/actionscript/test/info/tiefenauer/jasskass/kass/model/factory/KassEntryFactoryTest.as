/**
 * KassEntryFactory.as
 *
 * Project: JassKass
 * Date: May 16, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.kass.model.factory
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.kass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;
	import info.tiefenauer.jasskass.kass.model.KassAmount;
	import info.tiefenauer.jasskass.kass.model.KassEntry;
	import info.tiefenauer.jasskass.kass.model.factory.KassEntryFactory;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	public class KassEntryFactoryTest
	{		
		/*============================================================================*/
		/* Private Properties                                                         */
		/*============================================================================*/
		
		/*============================================================================*/
		/* Test Setup and Teardown                                                    */
		/*============================================================================*/
		[Before]
		public function setUp():void
		{
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
		[Test(description="fromAzureObject() should work")]
		public function testFromAzureObject():void{
			var now:Date = new Date();
			var kassEntry:IKassEntry = KassEntryFactory.fromAzureObject({
				id: 'someId',
				date: now.time,
				amounts: [
					{ id: 'someId1', player: 'player1', value: 10},  
					{ id: 'someId2', player: 'player2', value: 20},  
					{ id: 'someId3', player: 'player3', value: 30},  
					{ id: 'someId4', player: 'player4', value: 40}  
				]
			});
			assertEquals('someId', kassEntry.id)
			assertNotNull(kassEntry.date);
			assertEquals(now.time, kassEntry.date.time);
			assertNotNull(kassEntry.amounts);
			assertEquals(4, kassEntry.amounts.length);
			assertEquals('someId1', kassEntry.amounts[0].id);
			assertEquals('someId2', kassEntry.amounts[1].id);
			assertEquals('someId3', kassEntry.amounts[2].id);
			assertEquals('someId4', kassEntry.amounts[3].id);
			assertNotNull(kassEntry.amounts[0].player);
			assertNotNull(kassEntry.amounts[1].player);
			assertNotNull(kassEntry.amounts[2].player);
			assertNotNull(kassEntry.amounts[3].player);
			assertEquals('player1', kassEntry.amounts[0].player.id);
			assertEquals('player2', kassEntry.amounts[1].player.id);
			assertEquals('player3', kassEntry.amounts[2].player.id);
			assertEquals('player4', kassEntry.amounts[3].player.id);
			assertEquals(10, kassEntry.amounts[0].value);
			assertEquals(20, kassEntry.amounts[1].value);
			assertEquals(30, kassEntry.amounts[2].value);
			assertEquals(40, kassEntry.amounts[3].value);
		}
		[Test(description="toAzureObject() should work")]
		public function testToAzureObject():void{
			var entry:IKassEntry = new KassEntry();
			entry.id = 'someId';
			entry.date = new Date();
			var amount1:KassAmount = new KassAmount();
			amount1.id = 'amount1';
			amount1.player = new JassPlayer();
			amount1.player.id = 'player1';
			amount1.value = 10;
			var amount2:KassAmount = new KassAmount();
			amount1.id = 'amount2';
			amount1.player = new JassPlayer();
			amount1.player.id = 'player2';
			amount1.value = 20;
			var amount3:KassAmount = new KassAmount();
			amount1.id = 'amount3';
			amount1.player = new JassPlayer();
			amount1.player.id = 'player3';
			amount1.value = 30;
			entry.amounts.push(amount1);
			entry.amounts.push(amount2);
			entry.amounts.push(amount3);
			
			entry.amounts.push();
			var obj:Object = KassEntryFactory.toAzureObject(entry);
			assertNotNull(obj.id);
			assertEquals(entry.id, obj.id);
			assertNotNull(obj.date);
			assertEquals(entry.date.time, obj.date);
			assertNotNull(obj.amounts);
			assertTrue(obj.amounts is Array);
			assertEquals(entry.amounts.length, (obj.amounts as Array).length);
		}
		
	}
}