///@desc trace(value,...)
///@arg values(plural_possible!)
function trace() {
	/* === Shorter debug_messager => console log; === */
	// concenacts arguments into one string, with a seperator!
	var i = 0,
		s = "";
	repeat(argument_count){
	    s += string(argument[i]);
	}  
	show_debug_message(s);



}
