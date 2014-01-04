/**
 * JassTafelVorne
 * Copyright 2013 Daniel Tiefenauer
 */
package info.tiefenauer.jasskass.jass.views.components
{
        import flash.events.Event;
        import flash.events.MouseEvent;
        
        import mx.core.UIComponent;
        
        import spark.components.SkinnableContainer;
        import spark.core.IDisplayText;
        
        import info.tiefenauer.jasskass.app.util.translate;
        import info.tiefenauer.jasskass.jass.model.interfaces.IJass;
        
        [SkinState("normal")]
        [SkinState("disabled")]
        
        [Event(name="team1AreaClicked", type="flash.events.Event")]
        [Event(name="team2AreaClicked", type="flash.events.Event")]
        [Event(name="middleAreaClicked", type="flash.events.Event")]
        
        /**
         * JassTafel vorne 
         * @author Daniel Tiefenauer
         */
        public class JassTafel extends SkinnableContainer
        {
			[Bindable]
			[Inspectable(enumeration="true,false")] public var displayZ:Boolean = true;
            [SkinPart(required="true")] public var team1LabelDisplay:IDisplayText;
            [SkinPart(required="true")] public var team2LabelDisplay:IDisplayText;
            [SkinPart(required="true")] public var team1Area:UIComponent;
            [SkinPart(required="true")] public var team2Area:UIComponent;
            [SkinPart(required="true")] public var middleArea:UIComponent;
    
            private static const NAME:String = 'JassTafel';
            // event types
            public static const TEAM_1_AREA_CLICKED:String = 'team1AreaClicked';
            public static const TEAM_2_AREA_CLICKED:String = 'team2AreaClicked';
            public static const MIDDLE_AREA_CLICKED:String = 'middleAreaClicked';
            
            [Bindable] public var jass:IJass;
            
            override protected function createChildren():void{
                    super.createChildren();
                    if (jass){
                            team1LabelDisplay.text = translate('Team 1') + ' (' + jass.team1.player1.firstName + ' + ' + jass.team1.player2.firstName + ')';
                            team2LabelDisplay.text = translate('Team 2') + ' (' + jass.team2.player1.firstName + ' + ' + jass.team2.player2.firstName + ')';
                    }
                    team1Area.addEventListener(MouseEvent.CLICK, onTeam1AreaClicked);
                    team2Area.addEventListener(MouseEvent.CLICK, onTeam2AreaClicked);
                    middleArea.addEventListener(MouseEvent.CLICK, onMiddleAreaClicked);
                    
            }
            
            //--------------------------------
            // Event handlers
            //--------------------------------
            protected function onTeam1AreaClicked(event:MouseEvent):void{
                    dispatchEvent(new Event(TEAM_1_AREA_CLICKED));
            }
            protected function onTeam2AreaClicked(event:MouseEvent):void{
                    dispatchEvent(new Event(TEAM_2_AREA_CLICKED));
            }
            protected function onMiddleAreaClicked(event:MouseEvent):void{
                    dispatchEvent(new Event(MIDDLE_AREA_CLICKED));
            }
    }
}