package com.timrobles.util {
    import flash.events.EventDispatcher;
    import flash.events.TimerEvent;
    import flash.utils.Timer;    

    /**
    * A timer at random intervals within min and max values.
    * @author Tim Robles
    */
    public class RandomTimer extends EventDispatcher {
    
        //----------------------------------
        //  Private Variables
        //----------------------------------
        
        private var min : Number = 0;
        private var max : Number = 1000;
        private var repeatCount : uint = 0;
        private var _currentCount : uint = 0;
        private var _delay : Number = 0;
        
        private var timer : Timer;
        
        //--------------------------------------------------------------------------
        //
        //  Constructor
        //
        //--------------------------------------------------------------------------
        
        /**
        * @param min Minimum time in milliseconds for timer event.
        * @param max Max time.
        * @param repeat ( optional )
        */
        public function RandomTimer( min : Number, max : Number, repeat : uint = 0 ) {
            
            this.min = min;
            this.max = max;
            this.repeatCount = repeat;
            
        }
        
        //--------------------------------------------------------------------------
        //
        //  Public Methods
        //
        //--------------------------------------------------------------------------
        
        public function start() : void {

            _currentCount = 0;            
            signalTimer();
            
        }
        
        public function stop() : void {
            
            if ( timer.hasEventListener( TimerEvent.TIMER ) )
                timer.removeEventListener( TimerEvent.TIMER, timerHandler );
                
        }
        
        public function reset() : void {
        
            // TODO
           	
        }
        
        public function get currentCount() : int {
        	
        	return _currentCount;
        	
        }
        
        public function get delay() : Number {
        
            return _delay;
            	
        }
        
        //--------------------------------------------------------------------------
        //
        //  Private Methods
        //
        //--------------------------------------------------------------------------
        
        private function timerHandler( evt : TimerEvent ) : void {
            
            dispatchEvent( new TimerEvent( TimerEvent.TIMER ) );
            
            timer.removeEventListener( TimerEvent.TIMER, timerHandler );
            
            if ( _currentCount < repeatCount || repeatCount == 0 ) {
                
                signalTimer();
                _currentCount++;
                
            } else {
                
                dispatchEvent( new TimerEvent( TimerEvent.TIMER_COMPLETE ) );
                
            }
            
        }
        
        private function signalTimer() : void {
            
            _delay = getDelay();
            timer = new Timer( _delay, 1 );
            timer.addEventListener( TimerEvent.TIMER, timerHandler );
            timer.start();
            
        }
        
        private function getDelay() : Number {
            
            return Math.random() * ( max - min ) + min;
            
        }
        
    }


}