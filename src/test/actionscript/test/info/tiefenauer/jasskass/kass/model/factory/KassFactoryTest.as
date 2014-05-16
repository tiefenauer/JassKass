/**
 * KassFactoryTest.as
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
	import info.tiefenauer.jasskass.kass.model.Kass;
	import info.tiefenauer.jasskass.kass.model.KassEntry;
	import info.tiefenauer.jasskass.kass.model.factory.KassFactory;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKass;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassEntry;
	import info.tiefenauer.jasskass.profile.model.JassGroup;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;
	import org.flexunit.asserts.assertTrue;

	/**
	 * 
	 * @author dtie
	 * 
	 */
	public class KassFactoryTest
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
			var kass:IKass = KassFactory.fromAzureObject({
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
			
			assertEquals('someId', kass.id);
			assertNotNull(kass.group);
			assertEquals('someGroupId', kass.group.id);
			assertNotNull(kass.entries);
			assertEquals(2, kass.entries.length);
		}
		[Test(description="toAzureObject() should work")]
		public function testToAzureObject():void{
			var kass:IKass = new Kass();
			kass.id = 'someId';
			kass.group = new JassGroup();
			kass.group.id = 'someGroupId';
			var entry1:IKassEntry = new KassEntry();
			entry1.id = 'entry1';
			entry1.date = new Date();
			var entry2:IKassEntry = new KassEntry();
			entry1.id = 'entry1';
			entry1.date = new Date();
			
			kass.entries.push(entry1);
			kass.entries.push(entry2);
			
			var obj:Object = KassFactory.toAzureObject(kass);
			assertEquals(kass.id, obj.id);
			assertEquals(kass.group.id, obj.group);
			assertTrue(obj.entries is Array);
			assertEquals(kass.entries.length, (obj.entries as Array).length);
		}
		
	}
}