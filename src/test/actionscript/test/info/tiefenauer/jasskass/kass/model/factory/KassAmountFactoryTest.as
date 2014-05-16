/**
 * KassAmountFactoryTest.as
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
	import info.tiefenauer.jasskass.kass.model.factory.KassAmountFactory;
	import info.tiefenauer.jasskass.kass.model.interfaces.IKassAmount;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertNotNull;

	public class KassAmountFactoryTest
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
			var kassAmount:IKassAmount = KassAmountFactory.fromAzureObject({
				id: 'someId',
				player: 'somePlayer',
				value: 10
			});
			
			assertEquals('someId', kassAmount.id);
			assertNotNull(kassAmount.player);
			assertEquals('somePlayer', kassAmount.player.id);
			assertEquals(10, kassAmount.value);
		}
		[Test(description="invalid amounts should result in default")]
		public function shouldBeZero():void{
			var kassAmount:IKassAmount = KassAmountFactory.fromAzureObject({
				id: 'someId',
				player: 'somePlayer',
				value: 'someInvalidValue'
			});
			
			assertEquals('someId', kassAmount.id);
			assertNotNull(kassAmount.player);
			assertEquals('somePlayer', kassAmount.player.id);
			assertEquals(0, kassAmount.value);
		}
		[Test(description="toAzureObject() should work")]
		public function testToAzureObject():void{
			var amount:IKassAmount = new KassAmount();
			amount.id = 'someId';
			amount.player = new JassPlayer();
			amount.player.id = 'somePlayerId';
			amount.value = 20;
			
			var obj:Object = KassAmountFactory.toAzureObject(amount);
			assertNotNull(obj.id);
			assertEquals(amount.id, obj.id);
			assertNotNull(obj.player);
			assertEquals(amount.player.id, obj.player);
			assertNotNull(obj.value);
			assertEquals(amount.value, obj.value);
		}
		
	}
}