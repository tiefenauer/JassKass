/**
 * JassPlayerFactoryTest.as
 *
 * Project: JassKass
 * Date: Jun 12, 2014
 * 
 * @package		test.info.tiefenauer.jasskass.jass.model.factory
 * @copyright	Copyright (c) 2013 Crealogix E-Business AG
 * @link		http://www.crealogix.com
 * @author		dtie
 * @version		1.0.0
 *
 */
package test.info.tiefenauer.jasskass.jass.model.factory
{
	import info.tiefenauer.jasskass.jass.model.factory.JassPlayerFactory;
	import info.tiefenauer.jasskass.jass.model.vo.JassPlayer;
	
	import mockolate.stub;
	import mockolate.runner.MockolateRule;
	
	import org.flexunit.asserts.assertEquals;

	public class JassPlayerFactoryTest
	{	
		[Rule] public var rule:MockolateRule = new MockolateRule();
		[Mock] public var player:JassPlayer;
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
		[Test(description="toAzureObject() should produce a correct Azure-Object")]
		public function testToAzureObject():void{
			stub(player).getter('id').returns('someId');
			stub(player).getter('firstName').returns('someFirstName');
			stub(player).getter('lastName').returns('someLastName');
			stub(player).getter('eMail').returns('someEmail');
			var obj:Object = JassPlayerFactory.toAzureObject(player);
			assertEquals('someId', obj.id);
			assertEquals('someFirstName', obj.firstName);
			assertEquals('someLastName', obj.lastName);
			assertEquals('someEmail', obj.eMail);
		}
		[Test(description="toAzureObject() with null values should produce a correct Azure-Object")]
		public function testToAzureObjectWithNullValues():void{
			stub(player).getter('id').returns(null);
			stub(player).getter('firstName').returns(null);
			stub(player).getter('lastName').returns(null);
			stub(player).getter('eMail').returns(null)
				
			var obj:Object = JassPlayerFactory.toAzureObject(player);
			assertEquals('', obj.id);
			assertEquals('', obj.firstName);
			assertEquals('', obj.lastName);
			assertEquals('', obj.eMail);
		}
		
	}
}