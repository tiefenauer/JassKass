package flexUnitTests
{
	import org.flexunit.asserts.assertTrue;

	public class SampleTest
	{		
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
		
		[Test]
		public function testSomething():void{
			assertTrue(true);
		}
		
	}
}